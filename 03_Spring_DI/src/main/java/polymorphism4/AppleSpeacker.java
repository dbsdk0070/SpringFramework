package polymorphism4;

public class AppleSpeacker implements Speacker {
	public AppleSpeacker() {
		System.out.println("-->> AppleSpeacker 생성");
	}
	public void volumnUp() {
		System.out.println("-->> AppleSpeacker - 소리크게");
	}
	public void volumnDown() {
		System.out.println("-->> AppleSpeacker - 소리작게");
	}
}
