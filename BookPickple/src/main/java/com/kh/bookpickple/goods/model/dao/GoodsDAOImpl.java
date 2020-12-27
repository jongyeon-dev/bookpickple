package com.kh.bookpickple.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("bookMapper.selectBookList", type, rows);
	}

	@Override
	public int selectBookTotalContents(String type) {
		return sqlSession.selectOne("bookMapper.selectBookTotalContents", type);
	}

}
