package com.kts.nvt.serbioneer.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.NewsRepository;
import com.kts.nvt.serbioneer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.News;

@Service
public class NewsService implements ServiceInterface<News> {

	@Autowired
	NewsRepository newsRepository;

	@Autowired
	AuthenticatedUserRepository userRepository;

	@Autowired
	CulturalSiteService culturalSiteService;

	private final String type = "News";

	@Override
	public List<News> findAll() {
		return newsRepository.findAll();
	}

	public Page<News> findAll(Pageable pageable) {
		return newsRepository.findAll(pageable);
	}

	@Override
	public News findOneById(Long id) {
		return newsRepository.findById(id).orElse(null);
	}

	@Override
	public News create(News entity) {
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

	public Page<News> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId) {
		return newsRepository.findAllByCulturalSiteId(pageable, culturalSiteId);
	}

	public List<News> getAllSubscribedNews() {
		/*Long id = ((AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		AuthenticatedUser user = userRepository.findById(id).orElse(null);
		Set<CulturalSite> subscribedSites = user.getSubscribedSites();
		List<News> allNews = new ArrayList<>();
		for (CulturalSite subscribed : subscribedSites) {
			allNews.addAll(newsRepository.findAllByCulturalSiteId(subscribed.getId()));
		}
		return allNews;*/
		return null;
	}


}
