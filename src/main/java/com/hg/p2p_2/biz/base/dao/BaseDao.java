package com.hg.p2p_2.biz.base.dao;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * 基础的baseDAO层，所有dao都要继承此类
 *
 * @param <T>
 */
@NoRepositoryBean
public interface BaseDao<T> extends PagingAndSortingRepository<T, Long>, JpaSpecificationExecutor<T> {
}
