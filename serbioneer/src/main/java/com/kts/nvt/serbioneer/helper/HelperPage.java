package com.kts.nvt.serbioneer.helper;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.JsonNode;

/*
 * zdravo, ni meni nije jasno sta se dole desava pa cu ostaviti par stekoverflow<3 linkova:
 * https://stackoverflow.com/questions/34099559/how-to-consume-pageentity-response-using-spring-resttemplate/44895867#44895867
 * https://stackoverflow.com/questions/34647303/spring-resttemplate-with-paginated-api/42002709#42002709
 * https://stackoverflow.com/a/54423639    <- resenje
 * srecno!
 * 
 * S ljubavlju,
 * meeweecheeca*/

@JsonIgnoreProperties(ignoreUnknown = true)
public class HelperPage<T> extends PageImpl<T> {

	private static final long serialVersionUID = 1L;

	@JsonCreator(mode = JsonCreator.Mode.PROPERTIES)
    public HelperPage(@JsonProperty("content") List<T> content,
			    		@JsonProperty("number") int number,
			            @JsonProperty("size") int size,
			            @JsonProperty("totalElements") Long totalElements,
			            @JsonProperty("pageable") JsonNode pageable,
			            @JsonProperty("last") boolean last,
			            @JsonProperty("totalPages") int totalPages,
			            @JsonProperty("sort") JsonNode sort,
			            @JsonProperty("first") boolean first,
			            @JsonProperty("numberOfElements") int numberOfElements) {
        super(content, PageRequest.of(number, size), totalElements);
    }

    public HelperPage(List<T> content, Pageable pageable, long total) {
        super(content, pageable, total);
    }
    public HelperPage(List<T> content) {
        super(content);
    }

    public HelperPage() {
        super(new ArrayList<>());
    }
}