package com.naver.erp;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginDAO {
	public int stu_LoginIdCnt( Map<String,String> idPwd  );
	public int tea_LoginIdCnt( Map<String,String> idPwd  );
	public int mana_LoginIdCnt( Map<String,String> idPwd  );
}
