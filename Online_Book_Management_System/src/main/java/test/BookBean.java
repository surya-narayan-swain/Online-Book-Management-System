package test;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BookBean implements Serializable {

	private String code,name,author;
	private float price;
	private int qty;
private String ReqQty;

private String TotalPrice;

public String getTotalPrice() {
	return TotalPrice;
}
public void setTotalPrice(String totalPrice) {
	TotalPrice = totalPrice;
}

	public String getReqQty() {
		return ReqQty;
	}
	public void setReqQty(String reqQty) {
		ReqQty = reqQty;
	}
	public BookBean() {}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	

	
}
