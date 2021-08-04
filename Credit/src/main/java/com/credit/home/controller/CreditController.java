package com.credit.home.controller;

import java.util.Arrays;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.credit.home.Service.CreditService;
import com.credit.home.vo.CardVO;
import com.credit.home.vo.CusVO;
import com.credit.home.vo.itemVO;

@Controller
public class CreditController {

	@Inject
	CreditService creditService;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	
	//로그인
	@RequestMapping("/loginOk")
	@ResponseBody
	public String loginOk(CusVO cusVO, HttpSession session) {
		String check;
		System.out.println(cusVO.getBirth()+"<----생일");
		System.out.println(cusVO.getCusno()+"<----회원번호");
		
		String result = creditService.loginOk(cusVO);
		System.out.println(result);
		
		if(result==null) {
			check="N";
		}else {
			check="Y";
			session.setAttribute("logId", result);
		}
		
		return check;
	}
	//로그인 후 화면
	@RequestMapping("/showMain")
	public ModelAndView showMain(CusVO cusVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("CREDIT/main2");
		return mav;
	}
	// 로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "CREDIT/main";
	}
	
	// 카드신청
	@RequestMapping("/credit")
	public ModelAndView credit() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("CREDIT/credit");
		return mav;
	}
	
	// 카드신청완료
	@RequestMapping(value="/creditjoinOk", method = RequestMethod.GET)
	@ResponseBody
	@Transactional(rollbackFor = {Exception.class, RuntimeException.class})
	public String creditJoinOk(CardVO cardVO, CusVO cusVO, itemVO itemVO) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);//트랜젝션호출
		TransactionStatus status = transactionManager.getTransaction(def);
		
		String results = "N";
		try {
			//오케오케 아 테이블을 잘못만들었었는데 수정했다
			int resultC = creditService.InsertCus(cusVO);
			if(resultC>0) {
				itemVO.setPhone(cusVO.getPhone());
				int resultI = creditService.InsertItem(itemVO);
				cardVO.setCusno(creditService.selectCusNO(cusVO));
				System.out.println(cardVO.getCusno()+"<--뭐가나오길래그러냐");
				if(resultI>0) {
					int resultP = creditService.InsertPay(cardVO);
					if(resultP>0) {
						results = "Y"+cardVO.getCusno();
						System.out.println(results);
					}
				}
			}
			transactionManager.commit(status);
		}catch(Exception e) {
			results="N";
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println(results);
		return results;
	}
	
	
	
	@RequestMapping("/joininfo")
	public ModelAndView joinInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		CusVO cusvo =  creditService.getJoin((String)session.getAttribute("logId"));
		
		mav.addObject("joininfo", cusvo);
		mav.setViewName("CREDIT/joininfo");
		return mav;
	}
	
	
	@RequestMapping("/creditUpdate")
	public ModelAndView joininfoUpdate() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("CREDIT/joinfix");
		return mav;
	}
	
	@RequestMapping("/familyList")
	public ModelAndView familyList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("family", creditService.getFamily((String)session.getAttribute("logId"))); 
		mav.setViewName("CREDIT/familylist");
		return mav;
	}
	
	@RequestMapping("/creditinfo")
	public ModelAndView creditinfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("card", creditService.getCard((String)session.getAttribute("logId")));
		mav.setViewName("CREDIT/creditinfo");
		return mav;
	}
}
