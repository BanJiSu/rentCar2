package model.dto;

public class RentCarDTO {
	private String carName;
	private String carSize;
	private String color;
	private int carNumber;
	private int price;
	
	
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarSize() {
		return carSize;
	}
	public void setCarSize(String carSize) {
		this.carSize = carSize;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(int carNumber) {
		this.carNumber = carNumber;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "RentCarDTO[carName="+carName+",carNumber="+carNumber+",color="+color+",price="+price+",carSize="+carSize+"]";
	}

	
}
