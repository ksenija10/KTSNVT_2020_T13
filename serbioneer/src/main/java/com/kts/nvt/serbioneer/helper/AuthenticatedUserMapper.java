package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import com.kts.nvt.serbioneer.dto.AdminDTO;
import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;

public class AuthenticatedUserMapper implements MapperInterface<AuthenticatedUser, AuthenticatedUserDTO>{

	@Override
	public AuthenticatedUser toEntity(AuthenticatedUserDTO dto) {
		return new AuthenticatedUser(dto.getId(), dto.getName(), dto.getSurname(), 
				dto.getEmail(), dto.getPassword());
	}

	@Override
	public AuthenticatedUserDTO toDto(AuthenticatedUser entity) {
		return new AuthenticatedUserDTO(entity.getId(), entity.getName(), entity.getSurname(), 
				entity.getEmail(), entity.getPassword());
	}

	@Override
	public List<AuthenticatedUser> toEntityList(List<AuthenticatedUserDTO> dtoList) {
		List<AuthenticatedUser> authenticatedUsers = new ArrayList<AuthenticatedUser>();
		for(AuthenticatedUserDTO auDTO : dtoList) {
			authenticatedUsers.add(toEntity(auDTO));
		}
		return authenticatedUsers;
	}

	@Override
	public List<AuthenticatedUserDTO> toDtoList(List<AuthenticatedUser> entityList) {
		List<AuthenticatedUserDTO> authenticatedUserDTOs = new ArrayList<AuthenticatedUserDTO>();
		for(AuthenticatedUser au : entityList) {
			authenticatedUserDTOs.add(toDto(au));
		}
		return authenticatedUserDTOs;
	}

	@Override
	public Page<AuthenticatedUserDTO> toDtoPage(Page<AuthenticatedUser> entityPage) {
		List<AuthenticatedUserDTO> authenticatedUserDTOList = toDtoList(entityPage.toList());
        return new PageImpl<>(authenticatedUserDTOList, entityPage.getPageable(), entityPage.getTotalElements());
	}

}
