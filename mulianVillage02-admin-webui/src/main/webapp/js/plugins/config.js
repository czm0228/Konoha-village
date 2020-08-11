var requireConfig = {　
		baseUrl: "../js",

		paths: {
			jquery:"plugins/jquery-1.8.3.min",
			datePicker:"plugins/My97DatePicker/WdatePicker",
			utils:"apps/utils/utils",
			dao:"apps/dao/dao",
			flyui:"plugins/dist/js/flyui"
			
		},
		shim: {
			'utils':{
				deps:['jquery'],
				exports:'utils'
			},
			'dao':{
				deps:['jquery','utils'],
				exports:'dao'
			}
		}
};