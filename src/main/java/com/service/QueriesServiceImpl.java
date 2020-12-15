package com.service;

import com.repository.QueriesRepository;
import org.springframework.stereotype.Service;

import com.model.Queries;

@Service
public class QueriesServiceImpl implements QueriesService {
	private final QueriesRepository queriesRepository;

	public QueriesServiceImpl(QueriesRepository queriesRepository) {
		this.queriesRepository = queriesRepository;
	}

	public void addQuery(Queries queries) {

		queriesRepository.save(queries);
	}

}
