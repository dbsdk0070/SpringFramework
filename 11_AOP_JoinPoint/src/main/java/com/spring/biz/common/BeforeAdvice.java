package com.spring.biz.common;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;

public class BeforeAdvice {
//	public void beforeLog() {
//		System.out.println("[사전처리-BeforeAdvice.beforeLog]"
//				+ " 비즈니스 로직 수행전 로그");
//	}
	
	public void beforeLog(JoinPoint jp) {		//JoinPoint type의 객체를 하나 받음 | 전달받을 파라미터 명 : jp
		String methodName = jp.getSignature().getName();		//Signature()type의 객체가 실행됨 | 실행시킬 메소드의 명칭을 확인할 수 있음
		Object[] args = jp.getArgs();							//Args() 의 type은 Object 배열타입
		System.out.println("args : " + Arrays.toString(args));
		
		System.out.println("[사전처리] " + methodName + "() 메소드"
				+ ", args정보 : " + args[0] + " - 비즈니스 로직 수행전 로그");
	}
}








