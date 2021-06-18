package polymorphism1;

class SamsungTV implements TV {
	
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체생성");
	}
	
	@Override
	public void powerOn() {
		System.out.println("SamsungTV - 전원 ON");
	}
	@Override
	public void powerOff() {
		System.out.println("SamsungTV - 전원 OFF");
	}
	@Override
	public void volumeUp() {
		System.out.println("SamsungTV - 볼륨 UP");
	}
	@Override
	public void volumeDown() {
		System.out.println("SamsungTV - 볼륨 DOWN");
	}
}
