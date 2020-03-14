package province.pojo;

public class Province {
    private String name;
    private int currentConfirmed;//现存确诊
    private int confirmed;//累计确诊
    private int suspected;//疑似患者
    private int cured;//累计治愈
    private int dead;//累计死亡
    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCurrentConfirmed() {
		return currentConfirmed;
	}

	public void setCurrentConfirmed(int currentConfirmed) {
		this.currentConfirmed = currentConfirmed;
	}
	
	public int getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(int confirmed) {
		this.confirmed = confirmed;
	}

	public int getSuspected() {
		return suspected;
	}

	public void setSuspected(int suspected) {
		this.confirmed = suspected;
	}
	
	public int getCured() {
		return cured;
	}

	public void setCured(int cured) {
		this.confirmed = cured;
	}
	
	public int getDead() {
		return dead;
	}

	public void setDead(int dead) {
		this.confirmed = dead;
	}

}
