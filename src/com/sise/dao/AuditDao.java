package com.sise.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.sise.dao.StudentDao.RowCallbackHandlerStudent;
import com.sise.model.Admin;
import com.sise.model.AuditVO;
import com.sise.model.Student;
import com.sise.utils.EncodingTool;

@Repository("auditDao")
public class AuditDao extends BaseCrud<AuditVO> implements LoginService<AuditVO>{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
	@Override
	public AuditVO login(AuditVO cls) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(AuditVO cls) throws Exception {
		String sql = "INSERT INTO tb_award(id,stu,TYPE,NAME,img,requestTime,STATUS,auditor,auditorId,requestReason,auditReason)"+
					 "VALUES(NULL,?,?,?,?,?,?,?,?,?,?)";		
		return jdbcTemplate.update(sql,new Object[]{cls.getStu().getId(),cls.getType()
				,cls.getName()
				,cls.getImg(),
				cls.getRequestTime()      //审核时间
				,cls.getStatus()          //状态
				,cls.getAuditer(),      //审核人
				null,						//审核人id
				cls.getRequestReason(),  //申请原因
				cls.getAuditReason()});  //审核原因
	}

	public List<AuditVO> findByLimit(Integer page,Integer pageSize,String search,
			String status) {
		StringBuilder sb = new StringBuilder("SELECT * FROM tb_award WHERE 1=1");
		Object[] obj = null;
		if(search!=null) {
			search = EncodingTool.encodeStr(search);
			sb.append(" and name like ?");
			obj = new Object[]{"'%"+search+"%'",page,pageSize};
		}else {
			obj = new Object[]{page,pageSize};
		}
		sb.append(" and status='"+status+"'");
		sb.append(" ORDER BY id ASC LIMIT ?,?");
		List<AuditVO> list = new ArrayList<AuditVO>();
		jdbcTemplate.query(sb.toString(), obj,new RowCallbackHandlerAuditVO(list));
		return list;
	}
	
	
	public List<AuditVO> findByLimit(Integer page,Integer pageSize,String search,
			String status,Integer teaId) {
		StringBuilder sb = new StringBuilder("SELECT * FROM tb_award WHERE 1=1 and auditorId="+teaId);
		Object[] obj = null;
		if(search!=null) {
			search = EncodingTool.encodeStr(search);
			sb.append(" and name like ?");
			obj = new Object[]{"'%"+search+"%'",page,pageSize};
		}else {
			obj = new Object[]{page,pageSize};
		}
		sb.append(" and status='"+status+"'");
		sb.append(" ORDER BY id ASC LIMIT ?,?");
		List<AuditVO> list = new ArrayList<AuditVO>();
		jdbcTemplate.query(sb.toString(), obj,new RowCallbackHandlerAuditVO(list));
		return list;
	}
	@Override
	public List<AuditVO> search(AuditVO cls) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(AuditVO cls) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(AuditVO cls) throws Exception {
		String sql = "update tb_award set status=? where id=?";
		jdbcTemplate.update(sql,new Object[]{cls.getStatus(),cls.getId()});
	}

	@Override
	public AuditVO findById(AuditVO cls) throws Exception {
		String sql = "SELECT * FROM tb_award where id=?";
		List<AuditVO> list = new ArrayList<AuditVO>();
		jdbcTemplate.query(sql, new Object[]{cls.getId()},new RowCallbackHandlerAuditVO(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	
	@Override
	public List<AuditVO> findByLimit(Integer page, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer count() throws Exception {
		return count(null,null);
	}
	
	public Integer count(String status,String name) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tb_award WHERE 1=1");
		if(status!=null) {
			sb.append(" and status='"+status+"'");
		}
		if(name!=null) {
			sb.append(" and name like '%"+name+"'%");
		}
		return jdbcTemplate.queryForObject(sb.toString(), Integer.class);
	}
	
	class RowCallbackHandlerAuditVO implements RowCallbackHandler{

		private List<AuditVO> list;
		
		public RowCallbackHandlerAuditVO(List<AuditVO> list) {
			// TODO Auto-generated constructor stub
			this.list = list;
		}
		@Override
		public void processRow(ResultSet rs) throws SQLException {
			AuditVO a = new AuditVO();
			a.setId(rs.getInt("id"));
			a.setAuditer(rs.getString("auditor"));//(rs.getString("user"));
			a.setAuditReason(rs.getString("auditReason"));//Password(rs.getString("password"));
			a.setImg(rs.getString("img"));//(rs.getString("admin"));
			a.setName(rs.getString("name"));//Name(rs.getString("name"));
			a.setRequestReason(rs.getString("requestReason"));//Privilege(rs.getString("privilege"));
			a.setRequestTime(rs.getDate("requestTime"));
			a.setStatus(rs.getString("status"));
			a.setType(rs.getString("type"));
			a.setStuId(rs.getInt("stu"));
			list.add(a);
		}
	}

}
