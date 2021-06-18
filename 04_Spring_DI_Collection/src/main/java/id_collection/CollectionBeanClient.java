package id_collection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {
	public static void main(String[] args) {
			System.out.println("----- 스프링 컨테이너 구동전 ------");
			//1. 스프링컨테이너 구동(스프링 설정 파일 읽어서)
			GenericXmlApplicationContext factory 
					= new GenericXmlApplicationContext("applicationContext.xml");
			System.out.println("----- 스프링 컨테이너 구동후 ------");
					
			//2. 스프링컨테이너 사용
			CollectionBean bean = (CollectionBean) factory.getBean("collectionBean");
			
			System.out.println(">> --------------------객체요청 후 -------------------");
			System.out.println("--------- List 타입---------");
			System.out.println("bean : " + bean);
			List<String> addressList = bean.getAddressList();
			for (String address : addressList) {	//향상된 for문 list출력할 때 사용
				System.out.println(address);
			}
			System.out.println("--------- Set 타입---------");
			Set<String> addressSet = bean.getAddressSet();
			System.out.println(addressSet);
			
			System.out.println("--------- Map 타입---------");
			Map<String, String> addressMap = bean.getAddressMap();
			System.out.println(addressMap);
			
			System.out.println("--------- Properties 타입---------");
			Properties addressProp = bean.getAddressProp();
			System.out.println(addressProp);
			
			//3. 스프링컨테이너 종료(close)
			System.out.println("----- 스프링 컨테이너 종료처리 ------");
			factory.close();
		}
	}
