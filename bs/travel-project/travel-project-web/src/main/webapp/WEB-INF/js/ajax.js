var ajax = {
	/**
	 * 异步调用post方法
	 * @param url 路径
	 * @param data 数据
	 * @param callback 方法
	 */
	postAjax : function(url, data, callback) {
		$.ajax({
			type: 'post',
			url: url,
			contentType: 'application/json;charset=UTF-8',
			data: JSON.stringify(data),
			cache:false,
			success : callback
		});
	},
	/**
	 * 异步调用get方法
	 * @param url 路径
	 * @param callback 方法
	 */
	getAjax : function(url, callback) {
		$.ajax({
			type: 'get',
			url: url,
			cache:false,
			success : callback
		});
	},
	/**
	 * 同步调用AJAX
	 * @param url 路径
	 * @param data 数据
	 * @param callback 方法
	 */
	syncPostAjax : function(url, data, callback) {
		$.ajax({
			type: 'post',
			url: url,
			async : false,
			contentType: 'application/json;charset=UTF-8',
			data: JSON.stringify(data),
			cache:false,
			success : callback
		});
	}
};