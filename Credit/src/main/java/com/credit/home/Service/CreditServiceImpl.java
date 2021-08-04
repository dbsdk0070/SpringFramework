package com.credit.home.Service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.credit.home.dao.CreditDAO;
import com.credit.home.vo.CardVO;
import com.credit.home.vo.CusVO;
import com.credit.home.vo.itemVO;

@Service
public class CreditServiceImpl implements CreditService {
	
	@Inject
	CreditDAO creditdao;

	@Override
	public String loginOk(CusVO cusVO) {
		return creditdao.loginOk(cusVO);
	}

	@Override
	public int InsertCus(CusVO cusVO) {
		// TODO Auto-generated method stub
		return creditdao.InsertCus(cusVO);
	}

	@Override
	public int InsertItem(itemVO itemVO) {
		// TODO Auto-generated method stub
		return creditdao.InsertItem(itemVO);
	}

	@Override
	public int InsertPay(CardVO cardVO) {
		// TODO Auto-generated method stub
		return creditdao.InsertPay(cardVO);
	}

	@Override
	public String selectCusNO(CusVO cusVO) {
		// TODO Auto-generated method stub
		return creditdao.selectCusNO(cusVO);
	}

	@Override
	public CusVO getJoin(String cusno) {
		// TODO Auto-generated method stub
		return creditdao.getJoin(cusno);
	}

	@Override
	public CusVO getFamily(String cusno) {
		// TODO Auto-generated method stub
		return creditdao.getFamily(cusno);
	}

	@Override
	public itemVO getCard(String cusno) {
		// TODO Auto-generated method stub
		return creditdao.getCard(cusno);
	}

	
	
	
}
