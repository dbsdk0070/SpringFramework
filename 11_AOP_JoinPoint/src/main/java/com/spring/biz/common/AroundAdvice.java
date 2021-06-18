package com.spring.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class AroundAdvice {
//	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
//		//핵심메소드 실행 전
//		System.out.println("[Around BEFORE] 비즈니스 로직 실행전 처리");
//		Object returnObj = pjp.proceed();
//		
//		//핵심메소드 실행 후
//		System.out.println("[Around AFTER] 비즈니스 로직 실행후 처리");
//		
//		return returnObj;
//	}
	
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		String methodName = pjp.getSignature().getName();
		
		StopWatch stopWatch = new StopWatch();
		System.out.println("[Around BEFORE] 비즈니스 로직 실행전 처리");
		
		stopWatch.start();
		Object returnObj = pjp.proceed();
		stopWatch.stop();
		
		System.out.println("[Around AFTER] 비즈니스 로직 실행후 처리");
		
		System.out.println("[around] " + methodName + "() 메소드, "
				+ "실행시간 : " + stopWatch.getTotalTimeMillis());
		
		return returnObj;
	}
}







