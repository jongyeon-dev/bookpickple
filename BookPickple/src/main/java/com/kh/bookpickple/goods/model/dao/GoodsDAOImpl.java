package com.kh.bookpickple.goods.model.dao;

import java.util.ArrayList;
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
		List<Map<String, String>> selectBooksList = new ArrayList<Map<String, String>>();
		switch(type) {
			case "new":
				selectBooksList = sqlSession.selectList("bookMapper.selectNewBookList", null, rows);
				break;
			case "best":
				selectBooksList = sqlSession.selectList("bookMapper.selectBestBookList", null, rows);
				break;
			case "steady":
				selectBooksList = sqlSession.selectList("bookMapper.selectSteadyBookList", null, rows);
				break;
			default:
				selectBooksList = sqlSession.selectList("bookMapper.selectBookList", type, rows);
				break;
		}
		return selectBooksList;
	}

	@Override
	public int selectBookTotalContents(String type) {
		int totalContents = 0;
		switch(type) {
			case "new":
				totalContents = sqlSession.selectOne("bookMapper.selectNewBookTotalContents");
				break;
			case "best":
				totalContents = sqlSession.selectOne("bookMapper.selectBestBookTotalContents");
				break;
			case "steady":
				totalContents = sqlSession.selectOne("bookMapper.selectSteadyBookTotalContents");
				break;
			default:
				totalContents = sqlSession.selectOne("bookMapper.selectBookTotalContents", type);
				break;
		}
		return totalContents;
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
