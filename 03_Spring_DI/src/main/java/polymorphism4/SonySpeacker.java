package polymorphism4;

public class SonySpeacker implements Speacker {
	public SonySpeacker() {
		System.out.println("-->> SonySpeacker 생성");
	}
	public void volumnUp() {
		System.out.println("-->> SonySpeacker - 소리크게");
	}
	public void volumnDown() {
		System.out.println("-->> SonySpeacker - 소리작게");
	}
}
