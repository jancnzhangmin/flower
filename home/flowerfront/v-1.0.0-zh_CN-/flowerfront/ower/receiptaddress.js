define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var return_order = false;
	var Model = function() {
		this.callParent();
	};

	Model.prototype.addbtnClick = function(event) {
		var url = require.toUrl('./formaddress.w');
		var params = {
			type : 'add'
		}
		justep.Shell.showPage(url, params);
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_address_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("receiptData");
				data.clear();
				$.each(jsonstr.receiptaddrs, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							contact : item.contact,
							contactphone : item.contactphone,
							province : item.province,
							city : item.city,
							district : item.district,
							street : item.street,
							isdefault : item.isdefault,
							adcode : item.adcode,
							address : item.address
						} ]
					};
					data.newData(options);
				});

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.modelLoad = function(event) {
		this.refreshdata();
		justep.Shell.on("receiptaddress_refreshdata", this.receiptaddress_refreshdata, this);
	};

	Model.prototype.receiptaddress_refreshdata = function() {
		this.refreshdata();
	};

	Model.prototype.editbtnClick = function(event) {
		var row = event.bindingContext.$object;
		var url = require.toUrl('./formaddress.w');
		var params = {
			type : 'edit',
			address_id : row.val('id')
		}
		justep.Shell.showPage(url, params);
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params && event.params.type == 'order') {
			return_order = true;
		}
	};

	Model.prototype.col1Click = function(event) {
		if (return_order) {
			var row = event.bindingContext.$object;
			var params = {
				address_id : row.val('id')
			}
			justep.Shell.fireEvent("confirmorder_refreshaddress", params);
			this.close();
		}
	};

	return Model;
});