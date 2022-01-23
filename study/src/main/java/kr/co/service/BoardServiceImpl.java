package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.BoardDAO;
import kr.co.util.FileUtils;
import kr.co.vo.BoardVO;
import kr.co.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDao.write(boardVO);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			boardDao.insertFile(list.get(i));
		}
	}

	/*
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	*/

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return boardDao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return boardDao.listCount(scri);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		boardDao.boardHit(bno);
		return boardDao.read(bno);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {
		boardDao.update(boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		boardDao.delete(bno);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return boardDao.selectFileList(bno);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return boardDao.selectFileInfo(map);
	}

	@Override
	public void update(BoardVO boardVO, String[] files, 
					  String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		boardDao.update(boardVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i=0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				boardDao.insertFile(tempMap);
			} else {
				boardDao.updateFile(tempMap);
			}
		}
	}


}
