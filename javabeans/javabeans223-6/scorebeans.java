package javabeans;

public class scorebean {
	
	private float one;
	private String buho;
	private float two;
	private String qu = "=";
	
	public float getOne() {return one;}
	public void setOne(float one) {this.one=one;}
	
	public String getBuho() {return buho;}
	public void setBuho(String buho) {this.buho=buho;}
	
	public float getResult() {
		float result = 0;
		if (buho.equals("+")) {result = one + two;}
		else if (buho.equals("-")) {result = one - two;}
		else if (buho.equals("*")) {result = one * two;}
		else {result = one / two;}
		return result;
	}
	
	public float getTwo() {return two;}
	public void setTwo(float two) {this.two=two;}
	
	public String getQu() {return qu;}
	public void setQu(String qu) {this.qu=qu;}
}


