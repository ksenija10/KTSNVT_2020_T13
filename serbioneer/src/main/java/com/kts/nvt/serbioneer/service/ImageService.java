package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

	public List<Image> findAllByNewsId(Long newsId) {
		return imageRepository.findAllByNewsId(newsId);
	}

	public List<Image> findAllByCommentId(Long commentId) {
		return findAllByCommentId(commentId);
	}

	public List<Image> findAllByCulturalSiteId(Long culturalSiteId) {
		return findAllByCulturalSiteId(culturalSiteId);
	}

	@Override
	public Image findOneById(Long id) {
		return imageRepository.findById(id).orElse(null);
	}

	@Override
	public Image create(Image entity) throws Exception {
		return null;
	}

	public Image create(Comment comment, Image entity) throws Exception {
		Comment maybeComment = commentService.findOneById(comment.getId());
		if (maybeComment == null) {
			// throw new NonexistentIdException(commentService.getType());
			throw new NonexistentIdException("Comment");
		}
		return imageRepository.save(entity);
	}

	public Image create(News news, Image entity) throws Exception {
		News maybeNews = newsService.findOneById(news.getId());
		if (maybeNews == null) {
			// throw new NonexistentIdException(newsService.getType());
			throw new NonexistentIdException("News");
		}
		return imageRepository.save(entity);
	}

	public Image create(CulturalSite culturalSite, Image entity) throws Exception {
		CulturalSite maybeCulturalSite = culturalSiteService.findOneById(culturalSite.getId());
		if (maybeCulturalSite == null) {
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
