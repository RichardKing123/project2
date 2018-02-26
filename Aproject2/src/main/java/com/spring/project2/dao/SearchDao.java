package com.spring.project2.dao;

import java.util.List;

import com.spring.project2.domain.BdEstimatedSales;
import com.spring.project2.domain.BdFloatingPopulation;
import com.spring.project2.domain.BdIo;
import com.spring.project2.domain.BdSettledPopulation;
import com.spring.project2.domain.Bd_Index;
import com.spring.project2.domain.Bd_Shop;
import com.spring.project2.domain.PolygonPoint;

public interface SearchDao {

	//검색시 검색목록
	public abstract List<Bd_Index> searchList(String business_type ,String district);
	//상세보기시 개업 폐업
	public abstract Bd_Shop searchDetail(String bd_code_name, String business_type);
	//상세보기시 매출분석
	public abstract List<BdEstimatedSales> searchSales(String bd_code_name, String business_type);
	//상세보기시 유동인구분석
	public abstract List<BdFloatingPopulation> searchFloating(String bd_code_name);
	//상세보기시 상주인구분석
	public abstract List<BdSettledPopulation> searchSettled(String bd_code_name);
	//상세보기시 소득소비분석
	public abstract List<BdIo> searchIo(String bd_code_name);
	// 각 구에 해당하는 다각형을 그릴 수 있는 포인트 리스트를 가져오는 메서드
		public List<PolygonPoint> getGuPloygon(String district);
	
}
