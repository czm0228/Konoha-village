require.config(requireConfig);

require(['jquery'], function($) {

	var sidebarSwitch = {
		init: {
			initframe: function() {
				sidebarSwitch._addEvent();
			}
		},
		_addEvent: function() {
			$('.nav').on('click', function() {
				sidebarSwitch._eventController.slideAll($(this));
			});
			$('.submenu a').on('click', function() {
				sidebarSwitch._eventController.submenuSelected($(this));
			});
			// sidebarSwitch._eventController.beautifyScroll();
		},
		_eventController: {
			/**
			 * [侧栏导航点击收缩手风琴效果]
			 * @param  {Object} obj [一级菜单点击对象]
			 * @return null
			 */
			slideAll: function(obj) {
				$('.nav').removeClass('nav-selected');
				$('.submenu a').removeClass('nav-selected');
				var $children = obj.children('.nav-down'),
					$siblings = obj.siblings('ul');
				obj.next('ul').slideToggle().siblings('ul').slideUp();
				if (obj.attr('class') == 'nav-notice-management nav') {
					$siblings.slideUp();
					$('.nav-down').attr('src', "../img/nav-down.png");
					$siblings.children().removeClass('nav-selected');
				};
				if ($children.attr('src') == "../img/nav-down.png") {
					$children.attr('src', "../img/nav-up.png");
					obj.siblings().children('.nav-down').attr('src', "../img/nav-down.png");
				} else {
					$children.attr('src', "../img/nav-down.png");
				};
				obj.addClass('nav-selected');
			},
			/**
			 * [二级菜单点击选中]
			 * @param  {Object} obj [二级菜单点击对象]
			 * @return null
			 */
			submenuSelected: function(obj) {
				$('.nav').removeClass('nav-selected');
				$('.submenu a').removeClass('nav-selected');
				obj.addClass('nav-selected');
			},
			
		}
	};
	//初始化模块
	$(function() {
		sidebarSwitch.init.initframe();
	});

});