define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		$(this.getElementByXid("smartContainer1")).height($(window).width() * 0.6);
		this.refreshdata();
		this.ower_refresh_unpay_count();
		this.ower_undeliver_count();
		this.ower_unreceipt_count();
		this.ower_uncomment_count();
		justep.Shell.on("ower_refresh", this.ower_refresh, this);
		justep.Shell.on("ower_refresh_unpay_count", this.ower_refresh_unpay_count, this);
		justep.Shell.on("ower_unreceipt_count", this.ower_unreceipt_count, this);
		justep.Shell.on("ower_uncomment_count", this.ower_uncomment_count, this);
	};

	Model.prototype.ower_refresh = function() {
		this.refreshdata();
	};
	
	

	Model.prototype.ower_refresh_unpay_count = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_unpay_count',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("unpay_count_lable")).text(jsonstr.ordercount);
				if (parseFloat(jsonstr.ordercount) > 0) {
					$(self.getElementByXid("unpay_count_lable")).show();
				} else {
					$(self.getElementByXid("unpay_count_lable")).hide();
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};
	
		Model.prototype.ower_uncomment_count = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_uncomment_count',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("uncomment_count_lable")).text(jsonstr.ordercount);
				if (parseFloat(jsonstr.ordercount) > 0) {
					$(self.getElementByXid("uncomment_count_lable")).show();
				} else {
					$(self.getElementByXid("uncomment_count_lable")).hide();
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};
	
	Model.prototype.ower_undeliver_count = function(){
			var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_undeliver_count',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("undeliver_count_lable")).text(jsonstr.ordercount);
				if (parseFloat(jsonstr.ordercount) > 0) {
					$(self.getElementByXid("undeliver_count_lable")).show();
				} else {
					$(self.getElementByXid("undeliver_count_lable")).hide();
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};
	
		Model.prototype.ower_unreceipt_count = function(){
			var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_unreceipt_count',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("unreceipt_count_lable")).text(jsonstr.ordercount);
				if (parseFloat(jsonstr.ordercount) > 0) {
					$(self.getElementByXid("unreceipt_count_lable")).show();
				} else {
					$(self.getElementByXid("unreceipt_count_lable")).hide();
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.row10Click = function(event) {
		justep.Shell.showPage(require.toUrl("./receiptaddress.w"));
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_collection',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("span18")).text(jsonstr.collectioncount);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.row9Click = function(event) {
		justep.Shell.showPage(require.toUrl("./mycollection.w"));
	};

	Model.prototype.div1Click = function(event) {
		justep.Shell.showPage(require.toUrl("./register.w"));
	};

	Model.prototype.unpaydivClick = function(event) {
		justep.Shell.showPage(require.toUrl("./unpay.w"));
	};

	Model.prototype.undeliverdivClick = function(event){
justep.Shell.showPage(require.toUrl("./undeliver.w"));
	};

	Model.prototype.unreceiptdivClick = function(event){
justep.Shell.showPage(require.toUrl("./unreceipt.w"));
	};

	Model.prototype.uncommentdivClick = function(event){
justep.Shell.showPage(require.toUrl("./uncomment.w"));
	};

	return Model;
});