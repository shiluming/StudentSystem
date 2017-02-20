package com.sise.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import com.sise.dao.StudentDao.RowCallbackHandlerStudent;
import com.sise.model.Student;
import com.sise.model.Teacher;
import com.sise.utils.EncodingTool;

@Repository("teacherDao")
public class TeacherDao extends BaseCrud<Teacher> implements LoginService<Teacher>{

	@Resource
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int save(Teacher cls) throws Exception {
		String sql = "INSERT INTO tb_teacher values(null,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{cls.getCode(),cls.getPassword(),cls.getJoinTime(),cls.getName(),cls.getSex()
				,cls.getAge(),cls.getAddress(),cls.getTell(),cls.getEmail(),cls.getPrivilege()});
	}

	@Override
	public List<Teacher> search(Teacher cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("SELECT * FROM tb_teacher WHERE 1=1");
		if(cls.getCode()!=null ) {
			sb.append(" AND code = ?");
			obj.add(cls.getCode());
		}
		if(cls.getName()!=null) {
			sb.append(" AND name like ?");
			obj.add("%"+cls.getName()+"%");
		}
		List<Teacher> list = new ArrayList<Teacher>();
		jdbcTemplate.query(sb.toString(),obj.toArray(),new RowCallbackHandlerTeacher(list));
		return list;
	}

	@Override
	public void delete(Teacher cls) throws Exception {
		String sql = "DELETE FROM tb_teacher where id=?";
		jdbcTemplate.update(sql,new Object[]{cls.getId()});
	}

	@Override
	public void update(Teacher cls) throws Exception {
		List<Object> obj = new ArrayList<Object>();
		StringBuffer sb = new StringBuffer("UPDATE tb_teacher SET id=?");
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
		
		sb.append(" WHERE id=?");
		obj.add(cls.getId());
		System.out.println(" update sql : "+sb.toString());
		System.out.println(" sql paramter : " + obj.size());
		jdbcTemplate.update(sb.toString(),obj.toArray());
		
	}

	/**
	 * 该方法是根据id拿值的
	 */
	@Override
	public Teacher findById(Teacher cls) throws Exception {
		String sql = "SELECT * FROM tb_teacher where code=?";
		List<Teacher> list = new ArrayList<Teacher>();
		jdbcTemplate.query(sql, new Object[]{cls.getCode()},new RowCallbackHandlerTeacher(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	/**
	 * 本人懒，所以不想改上面的方法了
	 * 这个就是根据  id  拿值的
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Teacher findById(Integer id) throws Exception {
		String sql = "SELECT * FROM tb_teacher where id=?";
		List<Teacher> list = new ArrayList<Teacher>();
		jdbcTemplate.query(sql, new Object[]{id},new RowCallbackHandlerTeacher(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	class RowCallbackHandlerTeacher implements RowCallbackHandler{

		private List<Teacher> list;
		public RowCallbackHandlerTeacher(List<Teacher> list) {
			// TODO Auto-generated constructor stub
			this.list = list;
		}
		
		@Override
		public void processRow(ResultSet rs) throws SQLException {
			Teacher t = new Teacher();
			t.setId(rs.getInt("id"));
			t.setCode(rs.getString("code"));
			t.setJoinTime(rs.getDate("joinTime"));
			t.setName(rs.getString("name"));
			t.setAge(rs.getInt("age"));
			t.setAddress(rs.getString("address"));
			t.setEmail(rs.getString("email"));
			t.setPassword(rs.getString("password"));
			t.setTell(rs.getString("tell"));
			t.setSex(rs.getString("sex"));
			t.setPrivilege(rs.getString("privilege"));
			list.add(t);
		}
		
	}

	@Override
	public Teacher login(Teacher cls) {
		String sql = "SELECT * FROM tb_teacher where code=? and password=?";
		List<Teacher> list = new ArrayList<Teacher>();
		jdbcTemplate.query(sql, new Object[]{cls.getCode(),cls.getPassword()},new RowCallbackHandlerTeacher(list));
		if(list.size()>0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<Teacher> findByLimit(Integer page, Integer pageSize) {
		return findByLimit(page,pageSize,null);
	}
	
	public List<Teacher> findByLimit(Integer page,Integer pageSize,String search) {
		StringBuilder sb = new StringBuilder("SELECT * FROM tb_teacher WHERE 1=1");
		Object[] obj = null;
		if(search!=null) {
			search = EncodingTool.encodeStr(search);
			sb.append(" and name like ?");
			obj = new Object[]{"%"+search+"%",page,pageSize};
		}else {
			obj = new Object[]{page,pageSize};
		}
		sb.append(" ORDER BY id ASC LIMIT ?,?");
		List<Teacher> list = new ArrayList<Teacher>();
		jdbcTemplate.query(sb.toString(), obj,new RowCallbackHandlerTeacher(list));
		return list;
	}

	@Override
	public Integer count() throws Exception {
		String sql = "SELECT COUNT(*) FROM tb_teacher";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
}
