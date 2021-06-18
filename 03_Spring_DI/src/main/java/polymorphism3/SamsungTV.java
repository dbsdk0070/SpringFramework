package polymorphism3;

class SamsungTV implements TV {
	private SonySpeacker speacker;
	private int price;
	private int width;
	private int height;
	
	public SamsungTV() {
		System.out.println(">> SamsungTV 객체 생성");
	}
	public SamsungTV(SonySpeacker speacker) {
		System.out.println(">> SamsungTV 객체 생성");
		this.speacker = speacker;
	}
	public SamsungTV(SonySpeacker speacker, int price) {
		System.out.println(">> SamsungTV 객체 생성");
		this.speacker = speacker;
		this.price = price;
	}
	public SamsungTV(SonySpeacker speacker, int width, int height) {
		System.out.println(">> SamsungTV 객체 생성");
		this.speacker = speacker;
		this.width = width;
		this.height = height;
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
	@Override
	public String toString() {
		return "SamsungTV [speacker=" + speacker + ", price=" + price + ", width=" + width + ", height=" + height + "]";
	}
	
	//========= getter, setter 생성 ==========
	public SonySpeacker getSpeacker() {
		return speacker;
	}
	public void setSpeacker(SonySpeacker speacker) {
		this.speacker = speacker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	
	
	
}









