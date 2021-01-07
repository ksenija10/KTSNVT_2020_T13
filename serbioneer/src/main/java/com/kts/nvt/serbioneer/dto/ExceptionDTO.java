package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExceptionDTO {
	
	private String status;
	private String message;
	private String time;

}
