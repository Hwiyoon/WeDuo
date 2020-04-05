package com.weduo.caffeinme.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.weduo.caffeinme.board.Cafe;

public class CafeDao implements ICafeDao {
	
	private JdbcTemplate template;
	
	@Autowired
	public CafeDao(ComboPooledDataSource dataSource) {
		// TODO Auto-generated constructor stub
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Cafe> searchCafe(final String keyword) {
		// TODO Auto-generated method stub
		List<Cafe> cafes = null;
		final String sql = "select * from CAFE where CNAME LIKE '%'||?||'%' or CADDR LIKE '%'||?||'%'";
		cafes = template.query(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setString(1, keyword);
				pstmt.setString(2, keyword);
			}}, new RowMapper<Cafe>(){
				@Override
				public Cafe mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					Cafe selectedCafe = new Cafe();
					selectedCafe.setCNO(rs.getInt("CNO"));
					System.out.println("selectedCafe.cno="+selectedCafe.getCNO());
					selectedCafe.setCNAME(rs.getString("CNAME"));
					System.out.println("selectedCafe.cname="+selectedCafe.getCNAME());
					selectedCafe.setCADDR(rs.getString("CADDR"));
					selectedCafe.setCTIME(rs.getString("CTIME"));
					selectedCafe.setCPAGE(rs.getString("CPAGE"));
					return selectedCafe;
				}});
		
		if(cafes.isEmpty())	return null;
		
		return cafes;
	}


}
