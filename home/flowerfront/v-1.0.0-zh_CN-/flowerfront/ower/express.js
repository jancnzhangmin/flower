define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.id) {
			var self = this;
			$.ajax({
				async : true,
				url : publicurl + "api/query_express",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 10000,
				data : {
					orderid : event.params.id
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					var expressdata = self.comp('expressData');
					expressdata.clear();
					var detaildata = self.comp('detailData');
					detaildata.clear();
					$.each(jsonstr.express, function(i, item) {
						var express_options = {
							defaultValues : [ {
								id : i,
								name : item.name,
								message : item.data.message,
								nu : item.data.nu,
								state : item.data.state
							} ]
						};
						expressdata.newData(express_options);
						var ffirst = 1;
						$.each(item.data.data, function(di, ditem) {
							var detail_options = {
								defaultValues : [ {
									id : new UUID().toString(),
									express_id : i,
									ftime : ditem.ftime,
									context : ditem.context,
									ffirst:ffirst
								} ]
							};
							detaildata.newData(detail_options);
							ffirst = 0;
						});
					});

				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	return Model;
});