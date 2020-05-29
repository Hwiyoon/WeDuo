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
import com.weduo.caffeinme.board.CafeReviewDTO;
import com.weduo.caffeinme.board.CafeReviewVO;

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
			}
		}, new RowMapper<Cafe>() {
			@Override
			public Cafe mapRow(ResultSet rs, int rowNum) throws SQLException {
				Cafe selectedCafe = new Cafe();
				selectedCafe.setCNO(rs.getInt("CNO"));
				System.out.println("selectedCafe.cno=" + selectedCafe.getCNO());
				selectedCafe.setCNAME(rs.getString("CNAME"));
				System.out.println("selectedCafe.cname=" + selectedCafe.getCNAME());
				selectedCafe.setCADDR(rs.getString("CADDR"));
				selectedCafe.setCTIME(rs.getString("CTIME"));
				selectedCafe.setCPAGE(rs.getString("CPAGE"));
				return selectedCafe;
			}
		});

		if (cafes.isEmpty())
			return null;

		return cafes;
	}

	@Override
	public Cafe selectCafe(final int cno) {
		List<Cafe> selectedCafe = null;
		final String sql = "select * from CAFE where CNO=?";
		selectedCafe = template.query(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, cno);

			}
		}, new RowMapper<Cafe>() {
			@Override
			public Cafe mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Cafe scafe = new Cafe();
				scafe.setCNO(rs.getInt("CNO"));
				scafe.setCNAME(rs.getString("CNAME"));
				scafe.setCADDR(rs.getString("CADDR"));
				scafe.setCPAGE(rs.getString("CPAGE"));
				scafe.setCTIME(rs.getString("CTIME"));
				return scafe;
			}
		});

		if (selectedCafe.isEmpty())
			return null;

		return selectedCafe.get(0);
	}

	@Override
	public int cafeReviewWrite(final CafeReviewDTO cReviewDTO) {
		// TODO Auto-generated method stub
		final String sql = "insert into CREVIEW (RNO, CNO, MID, CONTENT, REVIEWDATE) values (CREVIEWSEQ.nextval,?,?,?,SYSDATE)";

		int result = template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, cReviewDTO.getCNO());
				pstmt.setString(2, cReviewDTO.getMID());
				pstmt.setString(3, cReviewDTO.getCONTENT());
			}
		});

		return result;
	}

	@Override
	public List<CafeReviewVO> getCafeReviews(final int cno) {
		// TODO Auto-generated method stub
		
		List<CafeReviewVO> reviews = null;
		final String sql = "select * from CREVIEW where CNO=?";
		
		reviews = template.query(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, cno);
			}}, new RowMapper<CafeReviewVO>() {
				@Override
				public CafeReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
					// TODO Auto-generated method stub
					CafeReviewVO creview = new CafeReviewVO();
					creview.setCNO(rs.getInt("CNO"));
					creview.setRNO(rs.getInt("RNO"));
					creview.setMID(rs.getString("MID"));
					creview.setCONTENT(rs.getString("CONTENT"));
					creview.setREVIEWDATE(rs.getDate("REVIEWDATE"));
					return creview;
				}
			});
		
		if(reviews.isEmpty())	return null;
		return reviews;
	}
	
	@Override
	public int deleteCafeReview(final int rno) {
		// TODO Auto-generated method stub
		
		final String sql = "delete from CREVIEW where RNO=?";
		
		int result = template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setInt(1, rno);
			}
		});
		
		return result;
	}
	
	@Override
	public int modifyCafeReview(final CafeReviewVO cReviewVO) {
		// TODO Auto-generated method stub
		final String sql = "update CREVIEW set content=? where rno=?";
		
		int result = template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setString(1, cReviewVO.getCONTENT());
				pstmt.setInt(2, cReviewVO.getRNO());
			}
		});
		
		return result;
	}

}
