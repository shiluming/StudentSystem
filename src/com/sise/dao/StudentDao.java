package com.sise.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.sise.dao.AdminDao.RowCallbackHandlerAdmin;
import com.sise.model.Admin;
import com.sise.model.Student;
import com.sise.utils.EncodingTool;

@Repository("studentDao")
public class StudentDao extends BaseCrud<Student> implements LoginService<Student>{

	@Resource
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int save(Student cls) throws Exception {
		String sql = "INSERT INTO tb_student values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{cls.getCode(),cls.getPassword(),cls.getJoinTime(),cls.getName(),cls.getMasterTeacher()
				,cls.getSex(),cls.getAge(),cls.getAddress(),cls.getTell(),cls.getEmail(),cls.getGrade(),cls.getStatus(),cls.getPrivilege()});
	}
	

	@Override
	public List<Student> search(Student cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("SELECT * FROM tb_student WHERE 1=1");
		if(cls.getCode()!=null ) {
			sb.append(" AND code = ?");
			obj.add(cls.getCode());
		}
		if(cls.getName()!=null) {
			sb.append(" AND name like ?");
			obj.add("%"+cls.getName()+"%");
		}
		List<Student> list = new ArrayList<Student>();
		jdbcTemplate.query(sb.toString(),obj.toArray(),new RowCallbackHandlerStudent(list));
		return list;
	}

	@Override
	public void delete(Student cls) throws Exception {
		String sql = "DELETE FROM tb_student where id=?";
		jdbcTemplate.update(sql,new Object[]{cls.getId()});
	}

	@Override
	public void update(Student cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("UPDATE tb_student SET id=?");
		obj.add(cls.getId());
		if(cls.getCode()!=null) {
			sb.append(" ,code = ?");
			obj.add(cls.getCode());
		}
		if(cls.getPassword()!=null) {
			sb.append(" ,password=?");
			obj.add(cls.getPassword());
		}
		if(cls.getJoinTime()!=null) {
			sb.append(" ,joinTime=?");
			obj.add(cls.getJoinTime());
		}
		if(cls.getName()!=null) {
			sb.append(" ,name=?");
			obj.add(cls.getName());
		}
		if(cls.getMasterTeacher()!=null) {
			sb.append(" ,masterTeacher=?");
			obj.add(cls.getMasterTeacher());
		}
		if(cls.getSex()!=null) {
			sb.append(" ,sex=?");
			obj.add(cls.getSex());
		}
		if(cls.getAge()!=null) {
			sb.append(" ,age=?");
			obj.add(cls.getAge());
		}
		if(cls.getAddress()!=null) {
			sb.append(" ,address=?");
			obj.add(cls.getAddress());
		}
		if(cls.getTell()!=null) {
			sb.append(" ,tell=?");
			obj.add(cls.getTell());
		}
		if(cls.getEmail()!=null) {
			sb.append(" ,email=?");
			obj.add(cls.getEmail());
		}
		if(cls.getGrade()!=null) {
			sb.append(" ,grade=?");
			obj.add(cls.getGrade());
		}
		if(cls.getStatus()!=null) {
			sb.append(" ,status=?");
			obj.add(cls.getStatus());
		}
		
		sb.append(" WHERE id=?");
		obj.add(cls.getId());
		System.out.println(" update sql : "+sb.toString());
		System.out.println(" sql paramter : " + obj.size());
		jdbcTemplate.update(sb.toString(),obj.toArray());
	}

	class RowCallbackHandlerStudent implements RowCallbackHandler{

		private List<Student> list;
		public RowCallbackHandlerStudent(List<Student> list) {
			this.list = list;
		}
		
		@Override
		public void processRow(ResultSet rs) throws SQLException {
			Student s = new Student();
			s.setId(rs.getInt("id"));
			s.setCode(rs.getString("code"));
			s.setPassword(rs.getString("password"));
			s.setJoinTime(rs.getDate("joinTime"));
			s.setName(rs.getString("name"));
			s.setMasterTeacher(rs.getInt("masterTeacher"));
			s.setSex(rs.getString("sex"));
			s.setAddress(rs.getString("address"));
			s.setAge(rs.getInt("age"));
			s.setTell(rs.getString("tell"));
			s.setEmail(rs.getString("email"));
			s.setGrade(rs.getInt("grade"));
			s.setStatus(rs.getString("status"));
			s.setPrivilege(rs.getString("privilege"));
			list.add(s);
			
		}
		
	}

	@Override
	public Student findById(Student cls) throws Exception {
		String sql = "SELECT * FROM tb_student where code=?";
		List<Student> list = new ArrayList<Student>();
		jdbcTemplate.query(sql, new Object[]{cls.getId()},new RowCallbackHandlerStudent(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	public Student findById(int cls) throws Exception {
		String sql = "SELECT * FROM tb_student where id=?";
		List<Student> list = new ArrayList<Student>();
		jdbcTemplate.query(sql, new Object[]{cls},new RowCallbackHandlerStudent(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	@Override
	public Student login(Student cls) {
		String sql = "SELECT * FROM tb_student where code=? and password=?";
		List<Student> list = new ArrayList<Student>();
		jdbcTemplate.query(sql, new Object[]{cls.getCode(),cls.getPassword()},new RowCallbackHandlerStudent(list));
		if(list.size()>0) {
			return list.get(0);
		}
		
		return null;
	}

	@Override
	public List<Student> findByLimit(Integer page, Integer pageSize) {
		return findByLimit(page,pageSize,null);
	}
	
	public List<Student> findByLimit(Integer page,Integer pageSize,String search) {
		StringBuilder sb = new StringBuilder("SELECT * FROM tb_student WHERE 1=1");
		Object[] obj = null;
		if(search!=null) {
			search = EncodingTool.encodeStr(search);
			sb.append(" and name like ?");
			obj = new Object[]{"%"+search+"%",page,pageSize};
		}else {
			obj = new Object[]{page,pageSize};
		}
		sb.append(" ORDER BY id ASC LIMIT ?,?");
		List<Student> list = new ArrayList<Student>();
		jdbcTemplate.query(sb.toString(), obj,new RowCallbackHandlerStudent(list));
		return list;
	}
	
	public List<Student> findByLimit(Integer page,Integer pageSize,String search,Integer classId) {
		StringBuilder sb = new StringBuilder("SELECT * FROM tb_student WHERE 1=1");
		Object[] obj = null;
		if(search!=null) {
			search = EncodingTool.encodeStr(search);
			sb.append(" and name like ?");
			obj = new Object[]{"%"+search+"%",page,pageSize};
		}else {
			obj = new Object[]{page,pageSize};
		}
		sb.append(" and grade='"+classId+"'");
		sb.append(" ORDER BY id ASC LIMIT ?,?");
		List<Student> list = new ArrayList<Student>();
		jdbcTemplate.query(sb.toString(), obj,new RowCallbackHandlerStudent(list));
		return list;
	}
	

	@Override
	public Integer count() throws Exception {
		String sql = "SELECT COUNT(*) FROM tb_student";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public Integer count(String paramter) {
		String sql = "SELECT COUNT(*) FROM tb_student WHERE name like '%"+paramter+"%'";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	public Integer count(String search,Integer classId) {
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) FROM tb_student WHERE 1=1");
		if(search!=null) {
			sb.append(" and name like '%"+search+"%'");
		}
		if(classId!=null) {
			sb.append(" and grade='"+classId+"'");
		}
		return jdbcTemplate.queryForObject(sb.toString(), Integer.class);
	}

}
