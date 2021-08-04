package com.credit.home.vo;

public class CusVO {
	private String cusno;
	private String cpy;
	private String kname;
	private String ename;
	private String birth;
	private String haddr;
	private String haddr2;
	
	private String htel1;
	private String htel2;
	private String htel;
	
	private String phone1;
	private String phone2;
	private String phone;
	
	private String email1;
	private String email2;
	private String email;
	
	private String sms;
	
	
	//선택사항 가족사항
	private String fkname;
	private String fename;
	private String fbirth;
	private String frel;
	private String fmax;
	private String fphone;
	private String fphone1;
	private String fphone2;
	
	//회원의 직장명
	private String caddr;
	private String ctel;
	private String ctel1;
	private String ctel2;
	private String cdeptno;
	private String cposition;
	
	
	//cardVO
	private String payacc;
	private String paybank;
	private String paydate;
	private String cardnum;
	
	//itemVO
	private String item;
	private String brand;
	private String itemService;
	private int cardDesign;
	private String addfc;
	private String foregin;
	private String payMethod;
	private String payaddr;
	private String paytel;
	private String checks;
	private String paymax;

	
	
	public String getCusno() {
		return cusno;
	}
	public void setCusno(String cusno) {
		this.cusno = cusno;
	}
	public String getCpy() {
		return cpy;
	}
	public void setCpy(String cpy) {
		this.cpy = cpy;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getHaddr() {
		return haddr;
	}
	public void setHaddr(String haddr) {
		this.haddr = haddr;
	}
	public String getHaddr2() {
		return haddr2;
	}
	public void setHaddr2(String haddr2) {
		this.haddr2 = haddr2;
	}
	public String getHtel1() {
		return htel1;
	}
	public void setHtel1(String htel1) {
		this.htel1 = htel1;
	}
	public String getHtel2() {
		return htel2;
	}
	public void setHtel2(String htel2) {
		this.htel2 = htel2;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	
	
	
	public String getHtel() {
		htel = htel1 + htel2;
		return htel;
	}
	public void setHtel(String htel) {
		this.htel = htel;
		
	}
	
	
	
	public String getPhone() {
		phone = phone1 + phone2;
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
		phone1 = phone.substring(0, 3);
		phone2 = phone.substring(4);
	}
	
	
	
	public String getEmail() {
		email = email1 +"@"+ email2;
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		int numbers = email.indexOf("@");
		email1 = email.substring(0, numbers);
		email2 = email.substring(numbers+1);
	}
	
	//가족사항
	public String getFkname() {
		return fkname;
	}
	public void setFkname(String fkname) {
		this.fkname = fkname;
	}
	public String getFename() {
		return fename;
	}
	public void setFename(String fename) {
		this.fename = fename;
	}
	public String getFbirth() {
		return fbirth;
	}
	public void setFbirth(String fbirth) {
		this.fbirth = fbirth;
	}
	public String getFrel() {
		return frel;
	}
	public void setFrel(String frel) {
		this.frel = frel;
	}
	public String getFmax() {
		return fmax;
	}
	public void setFmax(String fmax) {
		this.fmax = fmax;
	}

	public String getFphone1() {
		return fphone1;
	}
	public void setFphone1(String fphone1) {
		this.fphone1 = fphone1;
	}
	public String getFphone2() {
		return fphone2;
	}
	public void setFphone2(String fphone2) {
		this.fphone2 = fphone2;
	}

	
	public String getFphone() {
		fphone = fphone1 + fphone2;
		return fphone;
	}
	public void setFphone(String fphone) {
		this.fphone = fphone;
	}
	public String getCaddr() {
		return caddr;
	}
	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}
	public String getCtel1() {
		return ctel1;
	}
	public void setCtel1(String ctel1) {
		this.ctel1 = ctel1;
	}
	public String getCtel2() {
		return ctel2;
	}
	public void setCtel2(String ctel2) {
		this.ctel2 = ctel2;
	}
	public String getCdeptno() {
		return cdeptno;
	}
	public void setCdeptno(String cdeptno) {
		this.cdeptno = cdeptno;
	}
	public String getCtel() {
		ctel = ctel1+ctel2;
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
		ctel1 = ctel.substring(0,3);
		ctel2 = ctel.substring(3);
	}
	public String getCposition() {
		return cposition;
	}
	public void setCposition(String cposition) {
		this.cposition = cposition;
	}
	public String getPayacc() {
		return payacc;
	}
	public void setPayacc(String payacc) {
		this.payacc = payacc;
	}
	public String getPaybank() {
		return paybank;
	}
	public void setPaybank(String paybank) {
		this.paybank = paybank;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public String getCardnum() {
		return cardnum;
	}
	public void setCardnum(String cardnum) {
		this.cardnum = cardnum;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getItemService() {
		return itemService;
	}
	public void setItemService(String itemService) {
		this.itemService = itemService;
	}
	public int getCardDesign() {
		return cardDesign;
	}
	public void setCardDesign(int cardDesign) {
		this.cardDesign = cardDesign;
	}
	public String getAddfc() {
		return addfc;
	}
	public void setAddfc(String addfc) {
		this.addfc = addfc;
	}
	public String getForegin() {
		return foregin;
	}
	public void setForegin(String foregin) {
		this.foregin = foregin;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayaddr() {
		return payaddr;
	}
	public void setPayaddr(String payaddr) {
		this.payaddr = payaddr;
	}
	public String getPaytel() {
		return paytel;
	}
	public void setPaytel(String paytel) {
		this.paytel = paytel;
	}
	public String getChecks() {
		return checks;
	}
	public void setChecks(String checks) {
		this.checks = checks;
	}
	public String getPaymax() {
		return paymax;
	}
	public void setPaymax(String paymax) {
		this.paymax = paymax;
	}
	
	
}
