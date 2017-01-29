package com.sise.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.sise.dao.AdminDao.RowCallbackHandlerAdmin;
import com.sise.model.Admin;
import com.sise.model.Grade;

@Repository("gradeDao")
public class GradeDao extends BaseCrud<Grade>{

	
	@Resource
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int save(Grade cls) throws Exception {
		String sql = "INSERT INTO tb_class values(null,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{cls.getGrade(),cls.getGradeName(),cls.getTeacher()});
	}

	@Override
	public List<Grade> search(Grade cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("SELECT * FROM tb_class WHERE 1=1");
		if(cls.getGrade()!=null ) {
			sb.append(" AND grade like ?");
			obj.add("%"+cls.getGrade()+"%");
		}
		if(cls.getGradeName()!=null) {
			sb.append(" AND gradeName = ?");
			obj.add(cls.getGradeName());
		}
		if(cls.getTeacher()!=null) {
			sb.append(" AND name = ?");
			obj.add("%"+cls.getTeacher()+"%");
		}
		List<Grade> list = new ArrayList<Grade>();
		jdbcTemplate.query(sb.toString(),obj.toArray(),new RowCallbackHandlerGrade(list));
		return list;
	}

	@Override
	public void delete(Grade cls) throws Exception {
		String sql = "DELETE FROM tb_class where id=?";
		jdbcTemplate.update(sql,new Object[]{cls.getId()});
		
	}

	@Override
	public void update(Grade cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("UPDATE tb_class SET id=?");
		obj.add(cls.getId());
		if(cls.getGrade()!=null) {
			sb.append(" ,grade = ?");
			obj.add(cls.getGrade());
		}
		if(cls.getGradeName()!=null) {
			sb.append(" ,gradeName=?");
			obj.add(cls.getGradeName());
		}
		if(cls.getTeacher()!=null) {
			sb.append(" ,teacher=?");
			obj.add(cls.getTeacher());
		}
		sb.append(" WHERE id=?");
		obj.add(cls.getId());
		System.out.println(" update sql : "+sb.toString());
		System.out.println(" sql paramter : " + obj.size());
		jdbcTemplate.update(sb.toString(),obj.toArray());
	}

	@Override
	public Grade findById(Grade cls) throws Exception {
		String sql = "SELECT * FROM tb_class where id=?";
		List<Grade> list = new ArrayList<Grade>();
		jdbcTemplate.query(sql, new Object[]{cls.getId()},new RowCallbackHandlerGrade(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Grade> findByLimit(Integer page, Integer pageSize) {
		String sql = "SELECT * FROM tb_class ORDER BY id ASC LIMIT ?,?";
		List<Grade> list = new ArrayList<Grade>();
		jdbcTemplate.query(sql, new Object[]{page,pageSize},new RowCallbackHandlerGrade(list));
		return list;
	}

	@Override
	public Integer count() throws Exception {
		String sql = "SELECT COUNT(*) FROM tb_class";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	class RowCallbackHandlerGrade implements RowCallbackHandler{

		private List<Grade> list;
		
		public RowCallbackHandlerGrade(List<Grade> list) {
			// TODO Auto-generated constructor stub
			this.list = list;
		}
		@Override
		public void processRow(ResultSet rs) throws SQLException {
			Grade a = new Grade();
			a.setId(rs.getInt("id"));
			a.setGrade(rs.getString("grade"));
			a.setGradeName(rs.getString("gradeName"));
			a.setTeacher(rs.getInt("teacher"));
			list.add(a);
		}
		
	}

}
