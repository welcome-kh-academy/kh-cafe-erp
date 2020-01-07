package com.KHCafeErp.www.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImgFile {
	private int fileno;
	private int productNo;
	private String originName;
	private String storedName;
	
	private MultipartFile productImage;

	@Override
	public String toString() {
		return "ImgFile [fileno=" + fileno + ", productNo=" + productNo + ", originName=" + originName + ", storedName="
				+ storedName + ", productImage=" + productImage + "]";
	}

	public int getFileno() {
		return fileno;
	}

	public void setFileno(int fileno) {
		this.fileno = fileno;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

}
