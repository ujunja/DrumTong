package com.drumtong.business.vo;

public class BMenuVO {
	private String estid;
	private String name;
	private int price;
	private int quickprice;
	private int ete;
	private String maincategory;
	private String subcategory;
	
	public String getMaincategory() {
		return maincategory;
	}
	public void setMaincategory(String maincategory) {
		this.maincategory = maincategory;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuickprice() {
		return quickprice;
	}
	public void setQuickprice(int quickprice) {
		this.quickprice = quickprice;
	}
	public int getEte() {
		return ete;
	}
	public void setEte(int ete) {
		this.ete = ete;
	}
	
	
}
