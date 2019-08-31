package com.zzh.common;
/**
 * 上传图片返回值
 * <p>Title: PictureResult</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年7月22日下午2:09:02
 * @version 1.0
 */
public class PictureResult {

	/**
	 * 上传图片返回值，成功：0	失败：1	
	 */
	private Integer error;
	/**
	 * 回显图片使用的url
	 */
	private String url;
	/**
	 * 错误时的错误消息
	 */
	private String message;
	public PictureResult(Integer state, String url) {
		this.url = url;
		this.error = state;
	}
	public PictureResult(Integer state, String url, String errorMessage) {
		this.url = url;
		this.error = state;
		this.message = errorMessage;
	}
	public Integer getError() {
		return error;
	}
	public void setError(Integer error) {
		this.error = error;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
