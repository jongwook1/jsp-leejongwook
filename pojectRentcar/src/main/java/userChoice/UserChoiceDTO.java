package userChoice;

import java.sql.Timestamp;

public class UserChoiceDTO {
	private String id, startDate, endDate, choiceSopt, carChoice, carClass, carName, userName;
	private int no, carPrice, birth, phoneN, drLicense, dayCount, totalPrice;
	

	private Timestamp legDate;
	
	
	public UserChoiceDTO(String sD,String eD,String cC, String cN, int cP, String uN, int dC, int tP, Timestamp legDate) {
	
		this.startDate = sD;
		this.endDate = eD;			
		this.carClass = cC;
		this.carName = cN;
		this.carPrice = cP;
		this.userName = uN;		
		this.dayCount = dC;
		this.totalPrice = tP;
		this.legDate = legDate;
	}
	
	public UserChoiceDTO(int no, String id, String sD, String eD, String cS, String cChoice, String cC, String cN,
			int cP, String uN, int birth, int pN, int dL, int dC, int tP) {
		this.no = no;
		this.id = id;
		this.startDate = sD;
		this.endDate = eD;
		this.choiceSopt = cS;
		this.carChoice = cChoice;
		this.carClass = cC;
		this.carName = cN;
		this.carPrice = cP;
		this.userName = uN;
		this.birth = birth;
		this.phoneN = pN;		
		this.drLicense = dL;
		this.dayCount = dC;
		this.totalPrice = tP;
		this.legDate = legDate;
	}
	
	
	
	public UserChoiceDTO(String id, String sD, String eD, String cS, String cChoice, String cC, String cN, int cP, String uN,  int dC, int tP, Timestamp legDate) {
		
		this.startDate = sD;
		this.endDate = eD;
		this.choiceSopt = cS;
		this.carChoice = cChoice;
		this.carClass = cC;
		this.carName = cN;
		this.carPrice = cP;
		this.userName = uN;		
		this.dayCount = dC;
		this.totalPrice = tP;
		this.legDate = legDate;
	}
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getChoiceSopt() {
		return choiceSopt;
	}

	public void setChoiceSopt(String choiceSopt) {
		this.choiceSopt = choiceSopt;
	}

	public String getCarChoice() {
		return carChoice;
	}

	public void setCarChoice(String carChoice) {
		this.carChoice = carChoice;
	}

	public String getCarClass() {
		return carClass;
	}

	public void setCarClass(String carClass) {
		this.carClass = carClass;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public int getPhoneN() {
		return phoneN;
	}

	public void setPhoneN(int phoneN) {
		this.phoneN = phoneN;
	}

	public int getDrLicense() {
		return drLicense;
	}

	public void setDrLicense(int drLicense) {
		this.drLicense = drLicense;
	}

	public int getDayCount() {
		return dayCount;
	}

	public void setDayCount(int dayCount) {
		this.dayCount = dayCount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Timestamp getLegDate() {
		return legDate;
	}

	public void setLegDate(Timestamp legDate) {
		this.legDate = legDate;
	}
	
	@Override
	public String toString() {
		
		return String.format("%s/%s/%s/%s/%d/%s/%d/%d/%s", startDate, endDate, carClass, carName, carPrice, userName, dayCount, totalPrice, legDate);
		
	}
	
	
}
