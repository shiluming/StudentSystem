package com.sise.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sise.model.AuditItem;

@Repository("auditItemDao")
public class AuditItemDao extends BaseCrud<AuditItem> implements LoginService<AuditItem>{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public AuditItem login(AuditItem cls) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(AuditItem cls) throws Exception {
		String sql = "INSERT INTO tb_award_item values(null,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[]{cls.getType(),cls.getName(),cls.getOthers(),cls.getTeaId()});
	}

	@Override
	public List<AuditItem> search(AuditItem cls) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(AuditItem cls) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(AuditItem cls) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AuditItem findById(AuditItem cls) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuditItem> findByLimit(Integer page, Integer pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer count() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
