package com.sise.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.sise.utils.AppContent;

public abstract class BaseCrud<T> {
	
	private DataSource ds = null;
	/**
	 * 获取数据库连接池
	 * @return
	 */
	public DataSource getDataSource() {
		ds = (DataSource) AppContent.getBean("dataSource");
		return ds;
	}
	/*
	 * 获取链接
	 */
	public Connection getConnection() throws SQLException {
		if(ds==null) {
			getDataSource();
		}
		return ds.getConnection();
	}
	/**
	 * 保存
	 * @return
	 * @throws Exception
	 */
	public abstract int save(T cls) throws Exception;
	
	/**
	 * 查找
	 * @param cls
	 * @return
	 * @throws Exception
	 */
	public abstract List<T> search(T cls) throws Exception;
	/**
	 * 删除
	 * @param cls
	 * @throws Exception
	 */
	public abstract void delete(T cls) throws Exception;
	
	/**
	 * 更新
	 * @param cls
	 * @throws Exception
	 */
	public abstract void update(T cls) throws Exception;
	
	/**
	 * 根据 ID 查找
	 * @param cls
	 * @return
	 * @throws Exception
	 */
	public abstract T findById(T cls) throws Exception;
}
