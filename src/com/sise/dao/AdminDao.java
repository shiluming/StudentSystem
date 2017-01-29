package com.sise.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.sise.model.Admin;

@Repository("adminDao")
public class AdminDao extends BaseCrud<Admin> implements LoginService<Admin>{

	@Resource
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int save(Admin cls) throws Exception {
		String sql = "INSERT INTO tb_admin values(null,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{cls.getUser(),cls.getPassword(),cls.getAdmin(),cls.getName(),cls.getPrivilege()});
	}

	@Override
	public List<Admin> search(Admin cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("SELECT * FROM tb_admin WHERE 1=1");
		if(cls.getUser()!=null ) {
			sb.append(" AND user like ?");
			obj.add("%"+cls.getUser()+"%");
		}
		if(cls.getAdmin()!=null) {
			sb.append(" AND admin = ?");
			obj.add(cls.getAdmin());
		}
		if(cls.getName()!=null) {
			sb.append(" AND name = ?");
			obj.add("%"+cls.getName()+"%");
		}
		List<Admin> list = new ArrayList<Admin>();
		jdbcTemplate.query(sb.toString(),obj.toArray(),new RowCallbackHandlerAdmin(list));
		return list;
	}

	@Override
	public void delete(Admin cls) throws Exception {
		String sql = "DELETE FROM tb_admin where id=?";
		jdbcTemplate.update(sql,new Object[]{cls.getId()});
	}

	@Override
	public void update(Admin cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("UPDATE tb_admin SET id=?");
		obj.add(cls.getId());
		if(cls.getUser()!=null) {
			sb.append(" ,user = ?");
			obj.add(cls.getUser());
		}
		if(cls.getPassword()!=null) {
			sb.append(" ,password=?");
			obj.add(cls.getPassword());
		}
		if(cls.getAdmin()!=null) {
			sb.append(" ,admin=?");
			obj.add(cls.getAdmin());
		}
		if(cls.getName()!=null) {
			sb.append(" ,name=?");
			obj.add(cls.getName());
		}
		
		sb.append(" WHERE id=?");
		obj.add(cls.getId());
		System.out.println(" update sql : "+sb.toString());
		System.out.println(" sql paramter : " + obj.size());
		jdbcTemplate.update(sb.toString(),obj.toArray());
		
	}

	@Override
	public Admin findById(Admin cls) throws Exception {
		String sql = "SELECT * FROM tb_admin where id=?";
		List<Admin> list = new ArrayList<Admin>();
		jdbcTemplate.query(sql, new Object[]{cls.getId()},new RowCallbackHandlerAdmin(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	class RowCallbackHandlerAdmin implements RowCallbackHandler{

		private List<Admin> list;
		
		public RowCallbackHandlerAdmin(List<Admin> list) {
			// TODO Auto-generated constructor stub
			this.list = list;
		}
		@Override
		public void processRow(ResultSet rs) throws SQLException {
			Admin a = new Admin();
			a.setId(rs.getInt("id"));
			a.setUser(rs.getString("user"));
			a.setPassword(rs.getString("password"));
			a.setAdmin(rs.getString("admin"));
			a.setName(rs.getString("name"));
			a.setPrivilege(rs.getString("privilege"));
			list.add(a);
		}
		
	}

	@Override
	public Admin login(Admin cls) {
		String sql = "SELECT * FROM tb_admin WHERE user=? and password=? and admin=?";
		List<Admin> list = new ArrayList<Admin>();
		jdbcTemplate.query(sql,new Object[]{cls.getUser(),cls.getPassword(),cls.getAdmin()}
		, new RowCallbackHandlerAdmin(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Admin> findByLimit(Integer page, Integer pageSize) {
		String sql = "SELECT * FROM tb_admin ORDER BY id ASC LIMIT ?,?";
		List<Admin> list = new ArrayList<Admin>();
		jdbcTemplate.query(sql, new Object[]{page,pageSize},new RowCallbackHandlerAdmin(list));
		return list;
	}

	@Override
	public Integer count() throws Exception {
		String sql = "SELECT COUNT(*) FROM tb_admin";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

}
