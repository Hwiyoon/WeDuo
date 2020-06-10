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
import com.weduo.caffeinme.board.Bean;
import com.weduo.caffeinme.board.BeanReview;
import com.weduo.caffeinme.board.BeanReviewDTO;
import com.weduo.caffeinme.board.BeanReviewList;

public class BeanDao implements IBeanDao {
	
	private JdbcTemplate template;
	
	@Autowired
	public BeanDao(ComboPooledDataSource dataSource) {
		// TODO Auto-generated constructor stub
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Bean> beanList() {
		// TODO Auto-generated method stub
		List<Bean> beans = null;
		final String sql = "select BNO, BNAME, CONTENT from BEAN";
		
		beans = template.query(sql, new RowMapper<Bean>() {
			@Override
			public Bean mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Bean searchedBean = new Bean();
				searchedBean.setBNO(rs.getInt("BNO"));
				searchedBean.setBNAME(rs.getString("BNAME"));
				searchedBean.setCONTENT(rs.getString("CONTENT"));
				return searchedBean;
			}});
		
		if(beans.isEmpty())	return null;
		
		return beans;
	}
	
	@Override
	public Bean selectBean(final int bno) {
		// TODO Auto-generated method stub
		
		List<Bean> beans = null;
		final String sql = "select BNO, BNAME, CONTENT from BEAN where BNO=?";
		
		beans = template.query(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, bno);
			}}, new RowMapper<Bean>() {
				@Override
				public Bean mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					Bean selectedBean = new Bean();
					selectedBean.setBNO(rs.getInt("BNO"));
					selectedBean.setBNAME(rs.getString("BNAME"));
					selectedBean.setCONTENT(rs.getString("CONTENT"));
					return selectedBean;
				}
			});
		
		if(beans.isEmpty())	return null;
		
		
		return beans.get(0);
	}
	
	@Override
	public List<BeanReviewList> beanReviewList(final int bno) {
		// TODO Auto-generated method stub
		List<BeanReviewList> Reviews = null;
		final String sql = "select RNO, MID, TITLE from BREVIEW where BNO=?";
		
		Reviews = template.query(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, bno);
			}}, new RowMapper<BeanReviewList>() {
				@Override
				public BeanReviewList mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					BeanReviewList Review = new BeanReviewList();
					Review.setRNO(rs.getInt("RNO"));
					Review.setMID(rs.getString("MID"));
					Review.setTITLE(rs.getString("TITLE"));
					return Review;
				}
			});
		
		if(Reviews.isEmpty())	return null;
		
		return Reviews;
	}
	
	@Override
	public BeanReview getBeanReview(final int rno) {
		// TODO Auto-generated method stub
		List<BeanReview> review = null;
		final String sql = "select * from BREVIEW where RNO=?";
		
		review = template.query(sql, new PreparedStatementSetter () {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, rno);
			}}, new RowMapper<BeanReview>() {
				@Override
				public BeanReview mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					BeanReview selectedReview = new BeanReview();
					selectedReview.setRNO(rs.getInt("RNO"));
					selectedReview.setMID(rs.getString("MID"));
					selectedReview.setTITLE(rs.getString("TITLE"));
					selectedReview.setCONTENT(rs.getString("CONTENT"));
					selectedReview.setBNO(rs.getInt("BNO"));
					selectedReview.setSOUR(rs.getInt("SOUR"));
					selectedReview.setSWEET(rs.getInt("SWEET"));
					selectedReview.setBITTER(rs.getInt("BITTER"));
					selectedReview.setBODY(rs.getString("BODY"));
					selectedReview.setAROMA(rs.getString("AROMA"));
					selectedReview.setFLAVOR(rs.getString("FLAVOR"));
					return selectedReview;
				}
			});
		
		if(review.isEmpty())	return null;
		
		return review.get(0);
	}
	
	@Override
	public int writeBeanReview(final String MID, final int BNO, final BeanReviewDTO beanReviewDTO) {
		// TODO Auto-generated method stub
		
		final String sql = "insert into BREVIEW (RNO, MID, BNO, TITLE, CONTENT, SOUR, SWEET, BITTER, BODY, AROMA, FLAVOR)"
				+ "values(BREVIEWSEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		int result = template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setString(1, MID);
				pstmt.setInt(2, BNO);
				pstmt.setString(3, beanReviewDTO.getTITLE());
				pstmt.setString(4, beanReviewDTO.getCONTENT());
				pstmt.setInt(5, beanReviewDTO.getSOUR());
				pstmt.setInt(6, beanReviewDTO.getSWEET());
				pstmt.setInt(7, beanReviewDTO.getBITTER());
				pstmt.setString(8, beanReviewDTO.getBODY());
				pstmt.setString(9, beanReviewDTO.getAROMA());
				pstmt.setString(10, beanReviewDTO.getFLAVOR());
			}});
		
		return result;
	}
	
	@Override
	public void deleteBeanReview(final int rno) {
		// TODO Auto-generated method stub
		final String sql = "delete from BREVIEW where rno=?";
		
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, rno);
			}});
	}

}
