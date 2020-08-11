/*
 * @description 民政业务
 * @author 花梦雨
 * @create 2015-12-20
 */
(function(win, $) {

	/**
	 * [数据类型为get的方法封装]
	 * @param  {String} 	url       [请求数据的路径]
	 * @param  {Function}   handler   [请求成功要执行的方法]
	 * @param  {String}     dataType  [数据类型]
	 * @return {Function}             [保证目前的执行状态]
	 */
	var getFun = function(url, handler, dataType) {
		var dtd = $.Deferred(),
			data;
		$.ajax({
			url: url,
			data: data || {},
			dataType: dataType || 'json',
			type: "get",
			async: false,
			beforeSend: function() {}
		}).done(function(data) {
			data = handler ? handler(data) : data;
			dtd.resolve(data);
		}).fail(function() {
			dtd.reject(data);
		});
		return dtd.promise();
	};

	/**
	 * [数据类型为post的方法封装]
	 * @param  {String} 	data      [传入的id]
	 * @param  {String} 	url       [请求数据的路径]
	 * @param  {Function}   handler   [请求成功要执行的方法]
	 * @param  {String}     dataType  [数据类型]
	 * @return {Function}             [保证目前的执行状态]
	 */
	var postFun = function(url, data, handler, dataType) {
		var dtd = $.Deferred(),
			data;
		$.ajax({
			url: url,
			data: data || {},
			dataType: dataType || 'json',
			type: 'POST'
		}).done(function(data) {
			data = handler ? handler(data) : data;
			dtd.resolve(data);
		}).fail(function() {
			dtd.reject();
		});
		return dtd.promise();
	};

	var tipsDialog = function(msg) {
        fly.dialog({
            title: "提示",
            content: msg,
            time: 2
        })
    };
     
	win.utils = {
		get: getFun,
		post: postFun,
		tipsDialog:tipsDialog
	};

})(window, jQuery);