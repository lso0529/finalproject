package org.zerock.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.command.AttachFileDTO;
import org.zerock.service.AttachFileService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RestController
@Log4j
public class FileUploadController {
	
	@Autowired
	AttachFileService service;
	
	@RequestMapping(value = "/loadProfile")
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> loadProfile(String email){
		AttachFileDTO service_DTO = new AttachFileDTO();
		service_DTO.setEmail(email);
		
		AttachFileDTO result_DTO = new AttachFileDTO();
		result_DTO = service.findByEmail(service_DTO);
		
		List<AttachFileDTO> list = new ArrayList<>();
		list.add(result_DTO);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	// 업로드된 파일 받아오기 
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, HttpServletRequest request) {
		
		// 프로젝트 파일에 저장소
		ServletContext servletContext = request.getSession().getServletContext();
		
		String webappRoot = servletContext.getRealPath("/");
		
		String uploadFolder = webappRoot + "resources\\profileImage\\";
		
		log.info("fileName: " + fileName);
		
		// 로컬에 저장된 위치를 설정
		File file = new File(uploadFolder + fileName);
		
		log.info("file: " + file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (Exception e) {
			log.info(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	// 파일 업로드 post
	@RequestMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile, String email, HttpServletRequest request) {
		
		ServletContext servletContext = request.getSession().getServletContext();
		
		System.out.println("user_email:"+email);
		
		String webappRoot = servletContext.getRealPath("/");
		
		// 확인해볼것
		System.out.println("servletContext.getContexPath"+servletContext.getContextPath());
				
		List<AttachFileDTO> list = new ArrayList<>();
		
		// 프로젝트 파일 저장 위치
		String uploadFolder = webappRoot + "resources\\profileImage\\";
		// 로컬에 저장할 위치를 설정
//		String uploadFolder = "C:\\Users\\JGD\\uploadTest\\";
		String uploadFolderPath = getFolder();
		
		// make folder ======
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
		
		for(MultipartFile multipartFile: uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
		
			log.info("--------------------");
			log.info("uploadFormPost()-> Upload File Name:" + multipartFile.getOriginalFilename());
			log.info("uploadFormPost()-> Upload File Size:" + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			log.info("only file Name:" + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "-" + uploadFileName;
			log.info("UUID + file Name:" + uploadFileName);
			
		
			try {
				
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				attachDTO.setEmail(email);
				
				// check image type file
				if(checkImageType(saveFile)) {
					
					//attachDTO.setFileType(false);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 70, 70);
					
					thumbnail.close();
				}
				
				// add to List
				list.add(attachDTO);
				System.out.println(attachDTO.toString());
				
				// Service 구간
				service.insert(attachDTO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}
			
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 이미지 파일인지 체크
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("contentType"+contentType);
			
			return contentType.startsWith("image");
			
		} catch (Exception e) {
			log.info(e.getMessage());
		}
		
		return false;
	}
	
	// 경로에 date를 기반으로 폴더 생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}	
}
