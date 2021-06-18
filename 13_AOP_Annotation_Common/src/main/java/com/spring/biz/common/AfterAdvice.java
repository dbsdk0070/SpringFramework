package com.spring.biz.common;

//(실습) AOP 관련 어노테이션 설정
//@Aspect, @Pointcut, @After 적용 
public class AfterAdvice {
	public void afterLog() {
		System.out.println("[후처리-AfterAdvice.afterLog] "
				+ "비즈니스 로직 수행 후 로그(언제나,무조건)");
	}
}
