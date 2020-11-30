package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.model.News;
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

	@Override
	public List<Image> findAll() {
		return imageRepository.findAll();
	}
	
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

	@Override
	public Image create(Image entity) throws Exception {
		return null;
	}

	public Image createForComment(Long commentId, Image entity) throws Exception {
		Comment comment = commentService.findOneById(commentId);
		if (comment == null) {
			//throw new NonexistentIdException(commentService.getType());
			throw new NonexistentIdException("Comment");
		}
		return imageRepository.save(entity);
	}

	public Image createForNews(Long newsId, Image entity) throws Exception {
		News news = newsService.findOneById(newsId);
		if (news == null) {
			// throw new NonexistentIdException(newsService.getType());
			throw new NonexistentIdException("News");
		}
		return imageRepository.save(entity);
	}

	public Image createForCulturalSite(Long culturalSiteId, Image entity) throws Exception {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			// throw new NonexistentIdException(newsService.getType());
			throw new NonexistentIdException("Cultural Site");
		}
		return imageRepository.save(entity);
	}

	@Override
	public void delete(Long id) throws Exception {
		Image imageToDelete = imageRepository.findById(id).orElse(null);
		if (imageToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		imageRepository.delete(imageToDelete);

	}

	@Override
	public Image update(Image entity, Long id) throws Exception {
		Image imageToUpdate = imageRepository.findById(id).orElse(null);
		if (imageToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		imageToUpdate.setContent(entity.getContent());
		imageToUpdate.setName(entity.getName());
		return imageRepository.save(imageToUpdate);
	}

}
