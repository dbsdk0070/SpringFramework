package com.spring.biz.common;

import org.aspectj.lang.annotation.Pointcut;

//Pointcut 한 곳에 모아두는 작업
public class PointcutCommon {

	//포인트컷 작성 : 명칭은 메소드명
		@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
		public void allPointcut() {}
		
		//어드바이스의 동작시점 설정 + 포인트컷 지정
		@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
		public void getPointcut() {}
}
