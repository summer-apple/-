package com.zjlh.villa.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class ServiceLogAspect {
		Logger logger = Logger.getLogger(ServiceLogAspect.class);  
		String strLog = null ; 
	
		@Pointcut("execution(* com.zjlh.villa.service.*.*(..))")
		public void myPointCut(){}
		
		
		@Before("ServiceLogAspect.myPointCut()")
		public void doBefore(JoinPoint jp) {  
			
		        strLog = "++++++++++++++++【"  
		                + jp.getTarget().getClass().getSimpleName() + "."  
		                + jp.getSignature().getName()+"】++++++++++++++++Start";   
		        logger.warn(strLog);  
		    }  
		
		@Around("ServiceLogAspect.myPointCut()")
		  public Object doAround(ProceedingJoinPoint pjp) throws Throwable {  
			
		
				
		        long time = System.currentTimeMillis();  
		        Object retVal = pjp.proceed();  
		        time = System.currentTimeMillis() - time;  
		        System.out.println("总耗时: " + time + " ms");  
		        return retVal;  
		    } 
		  
		@After("ServiceLogAspect.myPointCut()")
		  public void doAfter(JoinPoint jp) {  
			 strLog ="+++++++++++++++++【"  
		                + jp.getTarget().getClass().getSimpleName() + "."  
		                + jp.getSignature().getName()+"】++++++++++++++++End";   
		        logger.warn(strLog);  
		}
	
}
