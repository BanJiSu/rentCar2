package model.dto;

public class CarDTO {
	String car_name;
	String type;
	int car_num;
	int car_price;
	int term;
	
	public CarDTO(String car_name, String type, int car_num, int car_price, int term) {
		this.car_name = car_name;
		this.type = type;
		this.car_num = car_num;
		this.car_price = car_price;
		this.term = term;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	
	@Override
	public String toString() {
		return "CarDTO [car_name=" + car_name + ", type=" + type + ", car_num=" + car_num
				+ ", car_price=" + car_price + ", term=" + term + "]";
	}
}
