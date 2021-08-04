package com.credit.home.dao;

import com.credit.home.vo.CardVO;
import com.credit.home.vo.CusVO;
import com.credit.home.vo.itemVO;

public interface CreditDAO {
	public String loginOk(CusVO cusVO);
	//회원정보 인설트
	public int InsertCus(CusVO cusVO);
	
	//cusno 가져오기
	public String selectCusNO(CusVO cusVO);
	
	
	//상품신청
	public int InsertItem(itemVO itemVO);
	
	//결제 등록
	public int InsertPay(CardVO cardVO);
	
	//가입정보 가져오기
	public CusVO getJoin(String cusno);
	
	//가족정보 가져오기
	public CusVO getFamily(String cusno);
	
	//카드정보조회
	public itemVO getCard(String cusno);
}
