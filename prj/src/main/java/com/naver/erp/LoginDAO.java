package com.naver.erp;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {
	public int loginIdCnt( Map<String,String> idPwd  );
}
