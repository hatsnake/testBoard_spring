package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}

	/*
	@Override
	public List<BoardVO> list() throws Exception {
		return sqlSession.selectList("boardMapper.list");
	}
	*/
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", cri);
	}

	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne("boardMapper.listCount");
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete", bno);
	}

}
