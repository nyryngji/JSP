package forjsp;

public class bean {
	
	public int theater;
	public String sheet;
	public int title;
	public String day;
	public int hm;
	public String ids;
	public int pwds;
	public String newid;
	public int newpwd;
	
	String[] movies = {"압꾸정","데시벨","올빼미","블랙팬서: 와칸다 포에버","월드컵","유포자","오션스8","탑건: 매버릭"};
	String[] theaters = {"서울 강남","서울 신촌","서울 코엑스","경기 고양스타필드","경기 수원","세종","부산 해운대","전라 순천"};
	String[] hour = {"10:00","11:20","13:40","16:05","18:15","19:35","20:10","22:20"};
	
	public String getSheet() {return sheet;}
	public void setSheet(String sheet) {this.sheet=sheet;}
	
	public int getTitle() {return title;}
	public void setTitle(int title) {this.title=title;}
	
	public int getTheater() {return theater;}
	public void setTheater(int theater) {this.theater=theater;}
	
	public String getDay() {return day;}
	public void setDay(String day) {this.day=day;}
	
	public String getIds() {return ids;}
	public void setId(String ids) {this.ids=ids;}
	
	public int getPwds() {return pwds;}
	public void setPwds(int pwds) {this.pwds=pwds;}
	
	public int getHm() {return hm;}
	public void setHm(int hm) {this.hm=hm;}
	
	public String getNewid() {return newid;}
	public void setNewid(String newid) {this.newid=newid;}
	
	public int getNewpwd() {return newpwd;}
	public void setNewpwd(int newpwd) {this.newpwd=newpwd;}
	
	public String getMovie() {
		String movie="";
		for (int i=1;i<=8;i++) {
			if (title==i)
				movie = movies[i-1];
		}
		return movie;
	}
	
	public String getPlace() {
		String place="";
		for (int i=1;i<=8;i++) {
			if (theater==i)
				place = theaters[i-1];
		}
		return place;
	}
	
	public String getTime() {
		String time="";
		for (int i=1;i<=8;i++) {
			if (hm==i)
				time = hour[i-1];
		}
		return time;
	}
	
}
