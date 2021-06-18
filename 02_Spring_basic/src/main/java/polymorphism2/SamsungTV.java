package polymorphism2;

class SamsungTV implements TV {
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체생성");
	}
	
	public void powerOn() {
		System.out.println("SamsungTV - 전원 ON");
	}
	public void powerOff() {
		System.out.println("SamsungTV - 전원 OFF");
	}
	public void volumeUp() {
		System.out.println("SamsungTV - 볼륨 UP");
	}
	public void volumeDown() {
		System.out.println("SamsungTV - 볼륨 DOWN");
	}
	
	//-----------------------------------------------------
	
	public void initMethod() {
		System.out.println("SamsungTV - initMethod() 실행");
	}
	public void destroyMethod() {
		System.out.println("SamsungTV - destroyMethod() 실행");
	}
}
