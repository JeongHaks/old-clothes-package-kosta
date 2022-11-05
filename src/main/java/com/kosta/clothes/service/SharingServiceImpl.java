package com.kosta.clothes.service;

import java.io.FileOutputStream;

import javax.servlet.ServletContext;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.dao.FileDAO;
import com.kosta.clothes.dao.SharingDAO;

@Service
public class SharingServiceImpl implements SharingService{

	@Autowired
	SharingDAO sharingDAO;

	@Autowired
	FileDAO fileDAO;

	@Autowired
	ServletContext servletContext;
	@Override
	public Integer registSharing(Sharing sharing, MultipartFile[] files) throws Exception {
		String fileids = "";
		FileVO fileVo = new FileVO();
		if(files!=null) {
			String path = servletContext.getRealPath("/upload/");
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					Integer fileid = fileDAO.getNextId();
					fileVo.setTno(fileid);
					fileVo.setDirectory_name(path);
					fileVo.setTname(file.getOriginalFilename());
					fileVo.setTsize(file.getSize());
					fileVo.setContent_type(file.getContentType());
					if(fileVo.getIno() == null) {
						fileVo.setIno(0);
					}
					FileOutputStream fos = new FileOutputStream(path+fileVo.getTno());
					FileCopyUtils.copy(file.getBytes(), fos);
					
					fileids += fileVo.getTno()+",";
				}
			}
		}
	
		Integer sharingid = sharingDAO.getNextSharingNo();
		sharing.setSno(sharingid);
		sharing.setStitle(sharing.getStitle());
		sharing.setScontent(sharing.getScontent());
		sharing.setSdealType(sharing.getSdealType());
		sharing.setAddressCity(sharing.getAddressCity());
		sharing.setAddressTown(sharing.getAddressTown());
		sharing.setSfileids(fileids);
		fileVo.setSno(sharingid);
		fileDAO.insertFileInfo(fileVo);

		sharingDAO.insertSharing(sharing);
		
		return sharingid;
	}

	@Override
	public Sharing viewSharing(Integer sno) throws Exception {
		return sharingDAO.selectSharing(sno);
	}

	@Override
	public List<Sharing> getSharingList() throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.selectSharingList();
	}
	
	
}
