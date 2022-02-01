package music.models;

import java.io.Serializable;
import java.text.NumberFormat;

public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	private String code;
	private String desc;
	private double price;

	public Product() {
		this.code = "";
		this.desc = "";
		this.price = 0;
	}

	public Product(String code, String description, double price) {
		this.code = code;
		this.desc = description;
		this.price = price;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return this.code;
	}

	public void setDescription(String description) {
		this.desc = description;
	}

	public String getDescription() {
		return this.desc;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice() {
		return this.price;
	}

	public String getPriceCurrencyFormat() {
		NumberFormat currency = NumberFormat.getCurrencyInstance();
		return currency.format(this.price);
	}
}
