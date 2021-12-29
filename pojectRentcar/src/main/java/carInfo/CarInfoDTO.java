package carInfo;

public class CarInfoDTO {
	private String carClass, carName, startDate, endDate;
	private int carPrice;
	
	public CarInfoDTO(String carClass, String carName, int carPrice) {
		this.carClass = carClass;
		this.carName =  carName;
		this.carPrice = carPrice;
	}
	
	public CarInfoDTO(String carClass, String carName, String startDate, String endDate, int carPrice ) {
		this.carClass = carClass;
		this.carName =  carName;
		this.carPrice = carPrice;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	public CarInfoDTO(String startDate, String endDate ,String carName) {
		this.startDate = startDate;
		this.endDate =  endDate;
		this.carName =  carName;
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

	public int getCarPrice() {
		return carPrice;
	}

	public void setCarPrice(int carPrice) {
		this.carPrice = carPrice;
	}
}
