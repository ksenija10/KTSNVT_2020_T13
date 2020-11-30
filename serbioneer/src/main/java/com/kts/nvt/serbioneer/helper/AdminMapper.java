package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.kts.nvt.serbioneer.dto.AdminDTO;
import com.kts.nvt.serbioneer.model.Admin;

public class AdminMapper implements MapperInterface<Admin, AdminDTO>{

	@Override
	public Admin toEntity(AdminDTO dto) {
		return new Admin(dto.getId(), dto.getName(), dto.getSurname(), dto.getEmail(), 
				dto.getPassword(), dto.getDateOfBirth());
	}

	@Override
	public AdminDTO toDto(Admin entity) {
		return new AdminDTO(entity.getId(), entity.getName(), entity.getSurname(), 
				entity.getEmail(), entity.getPassword(), entity.getDateOfBirth());
	}

	@Override
	public List<Admin> toEntityList(List<AdminDTO> dtoList) {
		List<Admin> admins = new ArrayList<Admin>();
		for(AdminDTO adminDTO : dtoList) {
			admins.add(toEntity(adminDTO));
		}
		return admins;
	}

	@Override
	public List<AdminDTO> toDtoList(List<Admin> entityList) {
		List<AdminDTO> adminDTOs = new ArrayList<AdminDTO>();
		for(Admin admin : entityList) {
			adminDTOs.add(toDto(admin));
		}
		return adminDTOs;
	}

	@Override
	public Page<AdminDTO> toDtoPage(Page<Admin> entityPage) {
		// TODO Auto-generated method stub
		return null;
	}

}
