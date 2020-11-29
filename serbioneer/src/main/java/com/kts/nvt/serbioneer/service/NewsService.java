package com.kts.nvt.serbioneer.service;

import java.util.Date;
import java.util.List;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepository;
import com.kts.nvt.serbioneer.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.News;

@Service
public class NewsService implements ServiceInterface<News> {

	@Autowired
	NewsRepository newsRepository;

	@Autowired
	CulturalSiteService culturalSiteService;

	private final String type = "News";

	@Override
	public List<News> findAll() {
		return newsRepository.findAll();
	}

	@Override
	public News findOneById(Long id) {
		return newsRepository.findById(id).orElse(null);
	}

	@Override
	public News create(News entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public News create(Long culturalSiteId, News news) throws Exception{
		//check if cultural site with given id exists
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			throw new NonexistentIdException(culturalSiteService.getType());
		}
		news.setDateTime(new Date());
		news.setCulturalSite(culturalSite);
		return newsRepository.save(news);
	}

	@Override
	public void delete(Long id) throws Exception {
		News existingNews = newsRepository.findById(id).orElse(null);
		if (existingNews == null){
			throw new Exception("News with given id doesn't exist.");
		}
		newsRepository.delete(existingNews);
	}

	@Override
	public News update(News entity, Long id) throws Exception {
		News newsToUpdate = newsRepository.findById(id).orElse(null);
		if (newsToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		newsToUpdate.setInformation(entity.getInformation());
		return newsRepository.save(newsToUpdate);
	}

	public List<News> findAllByCulturalSiteId(Long id) {
		return newsRepository.findAllByCulturalSiteId(id);
	}

}
