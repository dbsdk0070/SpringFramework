package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {
	
	//포인트컷 작성 : 명칭은 메소드명
	@Pointcut("execution(* com.spring.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.spring.biz..*Impl.get*(..))")
	public void getPointcut() {}
	
	@AfterReturning(pointcut = "getPointcut()", returning = "returnObj")
	public void afterReturnLog(JoinPoint jp, Object returnObj) {
		System.out.println("[후처리-AfterReturningAdvice.afterReturnLog] "
				+ "비즈니스 로직 수행 후 로그(정상실행시) - " + returnObj);
	}
}







