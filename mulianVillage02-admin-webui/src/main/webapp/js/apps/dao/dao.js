/*
 * @description 民政业务
 * @author 花梦雨
 * @create 2015-12-20
 */
(function(win,$){

	/**
	 * [获取数据]
	 * @return data
	 */
	var getData =function(url){
		return utils.get(url, function(data) {
			return data;
		}, 'json');
	};

	/**
	 * [获取模板]
	 * @return tmpl
	 */
	var getTmpl =function(url){
		return utils.get(url, function(data) {
			return data;
		}, 'text');
	};

	win.dao={
		getData:getData,
		getTmpl:getTmpl
	};

})(window,jQuery);