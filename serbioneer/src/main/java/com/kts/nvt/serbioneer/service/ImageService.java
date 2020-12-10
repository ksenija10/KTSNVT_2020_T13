package com.kts.nvt.serbioneer.service;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.repository.ImageRepository;

@Service
public class ImageService implements ServiceInterface<Image> {

	@Autowired
	private ImageRepository imageRepository;

	@Autowired
	private CommentService commentService;

	@Autowired
	private NewsService newsService;

	@Autowired
	private CulturalSiteService culturalSiteService;

	private final String type = "Image";
	
	
	public Page<Image> findAll(Pageable pageable) {
		return imageRepository.findAll(pageable);
	}

	public List<Image> findAllByNewsId(Long newsId) {
		return imageRepository.findAllByNewsId(newsId);
	}

	public Page<Image> findAllByNewsId(Pageable pageable, Long newsId) {
		return imageRepository.findAllByNewsId(pageable, newsId);
	}

	public List<Image> findAllByCommentId(Long commentId) {
		return imageRepository.findAllByCommentId(commentId);
	}

	public Page<Image> findAllByCommentId(Pageable pageable, Long commentId) {
		return imageRepository.findAllByCommentId(pageable, commentId);
	}

	public List<Image> findAllByCulturalSiteId(Long culturalSiteId) {
		return imageRepository.findAllByCulturalSiteId(culturalSiteId);
	}

	public Page<Image> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId) {
		return imageRepository.findAllByCulturalSiteId(pageable, culturalSiteId);
	}

	@Override
	public Image findOneById(Long id) {
		return imageRepository.findById(id).orElse(null);
	}

	public Image createForComment(Long commentId, MultipartFile multipartFile) throws Exception {
		Comment comment = commentService.findOneById(commentId);
		if (comment == null) {
			throw new NonexistentIdException("Comment");
		}

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		String filePath = this.saveImage(multipartFile, fileName, "comment", commentId);
		Image image = new Image(fileName, filePath, comment);

		return imageRepository.save(image);
	}

	public Image createForNews(Long newsId, MultipartFile multipartFile) throws Exception {
		News news = newsService.findOneById(newsId);
		if (news == null) {
			throw new NonexistentIdException("News");
		}

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		String filePath = this.saveImage(multipartFile, fileName, "news", newsId);
		System.out.println("Prosao");
		Image image = new Image(fileName, filePath, news);

		return imageRepository.save(image);
	}

	public Image createForCulturalSite(Long culturalSiteId, MultipartFile multipartFile) throws Exception {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {

			throw new NonexistentIdException("Cultural Site");
		}

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		String filePath = this.saveImage(multipartFile, fileName, "culturalSite", culturalSiteId);
		System.out.println("Prosao");
		Image image = new Image(fileName, filePath, culturalSite);

		return imageRepository.save(image);
	}

	@Override
	public void delete(Long id) throws Exception {
		Image imageToDelete = imageRepository.findById(id).orElse(null);
		if (imageToDelete == null) {
			throw new NonexistentIdException(this.type);
		}

		if (imageToDelete.getComment() != null) {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (!imageToDelete.getComment().getAuthenticatedUser().getId().equals(user.getId())) {
				throw new Exception("You can only delete your images.");
			}
		}

		imageRepository.delete(imageToDelete);
	}

	public String saveImage(MultipartFile file, String fileName, String folderName, Long entityId) throws IOException{
		String separator = System.getProperty("file.separator");
		String folderPath = "src" + separator + "main" + separator + "resources" + separator + "images" + separator
				+ folderName;
		String entityFolderPath = folderPath + separator + entityId;
		String filePath = entityFolderPath + separator + file.getOriginalFilename();
		
		Path path = Paths.get(filePath);

		File folder = new File(folderPath);
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		File entityFolder = new File(entityFolderPath);
		if(!entityFolder.exists()) {
			entityFolder.mkdir();
		}

		OutputStream os = Files.newOutputStream(path);
		os.write(file.getBytes());
		os.close();

		return filePath;

	}

}
