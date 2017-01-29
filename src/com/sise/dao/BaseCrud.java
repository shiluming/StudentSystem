package com.sise.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.sise.utils.AppContent;

public abstract class BaseCrud<T> {
	
	private DataSource ds = null;
	/**
	 * ��ȡ���ݿ����ӳ�
	 * @return
	 */
	public DataSource getDataSource() {
		ds = (DataSource) AppContent.getBean("dataSource");
		return ds;
	}
	/*
	 * ��ȡ����
	 */
	public Connection getConnection() throws SQLException {
		if(ds==null) {
			getDataSource();
		}
		return ds.getConnection();
	}
	/**
	 * ����
	 * @return
	 * @throws Exception
	 */
	public abstract int save(T cls) throws Exception;
	
	/**
	 * ����
	 * @param cls
	 * @return
	 * @throws Exception
	 */
	public abstract List<T> search(T cls) throws Exception;
	/**
	 * ɾ��
	 * @param cls
	 * @throws Exception
	 */
	public abstract void delete(T cls) throws Exception;
	
	/**
	 * ����
	 * @param cls
	 * @throws Exception
	 */
	public abstract void update(T cls) throws Exception;
	
	/**
	 * ���� ID ����
	 * @param cls
	 * @return
	 * @throws Exception
	 */
	public abstract T findById(T cls) throws Exception;
}
