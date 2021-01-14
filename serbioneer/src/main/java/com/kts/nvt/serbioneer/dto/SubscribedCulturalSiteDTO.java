package com.kts.nvt.serbioneer.dto;

import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubscribedCulturalSiteDTO {
	
	private boolean subscribed;
	
	@NotNull
	private String userEmail;
	
	@NotNull
	private Long culturalSiteId;
	
	
}
