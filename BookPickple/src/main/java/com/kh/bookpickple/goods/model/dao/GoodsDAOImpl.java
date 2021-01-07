package com.kh.bookpickple.goods.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bookpickple.manager.book.model.vo.Book;
import com.kh.bookpickple.manager.book.model.vo.BookImages;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Book> selectMainNewBookList() {
		List<Book> mainNewBookList = sqlSession.selectList("bookMapper.mainNewBookList");
		return mainNewBookList;
	}

	@Override
	public List<Book> selectMainBestBookList() {
		List<Book> mainBestBookList = sqlSession.selectList("bookMapper.mainBestBookList");
		return mainBestBookList;
	}

	@Override
	public List<Book> selectMainSteadyBookList() {
		List<Book> mainSteadyBookList = sqlSession.selectList("bookMapper.mainSteadyBookList");
		return mainSteadyBookList;
	}

	@Override
	public List<Map<String, String>> selectBookList(int cPage, int numPerPage, String type) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("bookMapper.selectBookList", type, rows);
	}

	@Override
	public int selectBookTotalContents(String type) {
		return sqlSession.selectOne("bookMapper.selectBookTotalContents", type);
	}

	@Override
	public Book selectOneBook(int bookNo) {
		return sqlSession.selectOne("bookMapper.selectOneBook", bookNo);
	}

	@Override
	public List<BookImages> selectOneBookImagesList(int bookNo) {
		return sqlSession.selectList("bookMapper.selectOneBookImages", bookNo);
	}

	@Override
	public Book selectQuickBook(int bookNo) {
		return sqlSession.selectOne("bookMapper.selectOneQuickList", bookNo);
	}

}
