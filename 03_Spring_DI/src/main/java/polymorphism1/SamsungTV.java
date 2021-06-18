package polymorphism1;

class SamsungTV implements TV {
	private SonySpeacker speacker;
	
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체 생성");
		//필드 SonySpeacker에 객체 주입
		speacker = new SonySpeacker();
	}
	
	public void powerOn() {
		System.out.println("SamsungTV - 전원ON");
	}
	public void powerOff() {
		System.out.println("SamsungTV - 전원OFF");
	}
	public void volumeUp() {
		System.out.println("SamsungTV - 소리크게");
		speacker.volumnUp();
	}
	public void volumeDown() {
		System.out.println("SamsungTV - 소리작게");
		speacker.volumnDown();
	}
}









