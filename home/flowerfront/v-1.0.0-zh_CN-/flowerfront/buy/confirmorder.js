define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");
	var address_id = 0;
	var UUID = require("$UI/system/lib/base/uuid");
	var frontuuid = '';
	var price = 0;
	var banlance = 0;
	var localbuycar;
	var deduction = 0;// 抵扣
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		if (frontuuid == '') {
			frontuuid = new UUID().toString();
			localbuycar = buycar;
		}
		this.refresh_receive();
		this.refreshdata();
		justep.Shell.on("confirmorder_refreshaddress", this.confirmorder_refreshaddress, this);
	};

	Model.prototype.refresh_receive = function() {
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
				$.each(jsonstr.receiptaddrs, function(i, item) {
					if (item.isdefault == 1) {
						$(self.getElementByXid("span1")).text('收货人：' + item.contact);
						$(self.getElementByXid("span2")).text(item.contactphone);
						$(self.getElementByXid("span3")).text('收货地址：' + item.province + item.city + item.district + item.street + item.address);
						address_id = item.id;
					}
				});

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.refreshdata = function() {

		var buycardata = this.comp('buycarData');
		buycardata.clear();
		var optionaldata = this.comp('optionalData');
		optionaldata.clear();
		var activedata = this.comp('activeData');
		activedata.clear();

		$.each(buycar, function(i, item) {
			var hasoptional = 0;
			if (item.buycaroptional.length > 0) {
				hasoptional = 1;
			}
			var uuid = new UUID().toString();
			var option = {
				defaultValues : [ {
					id : uuid,
					product_id : item.product_id,
					user_id : item.user_id,
					number : item.number,
					price : item.price,
					cost : item.cost,
					discount : item.discount,
					cover : publicurl + item.cover,
					firstprofit : item.firstprofit,
					secondprofit : item.secondprofit,
					owerprofit : item.owerprofit,
					producttype : item.producttype,
					openid : item.openid,
					name : item.name,
					subtitle : item.subtitle,
					hasoptional : hasoptional
				} ]
			}
			buycardata.newData(option);
			$.each(item.buycaroptional, function(oi, oitem) {
				var ouuid = new UUID().toString();
				var option = {
					defaultValues : [ {
						id : ouuid,
						selectcondition_id : oitem.selectcondition_id,
						selectcondition_name : oitem.selectcondition_name,
						buycar_id : uuid
					} ]
				}
				optionaldata.newData(option);
			});

			$.each(item.activetype, function(ai, aitem) {
				var auuid = new UUID().toString();
				var option = {
					defaultValues : [ {
						id : auuid,
						buycar_id : uuid,
						active : aitem.active,
						showlable : aitem.showlable,
						summary : aitem.summary,
						keywords : aitem.keywords
					} ]
				}
				activedata.newData(option);
			});
		});
		this.calower();

		$('.menu').each(function(i, item) {
			$(item).height($(item.parentElement.children[0]).height());
		});

	};

	Model.prototype.calower = function() {
		var saveprofit = 0;
		var owerprofit = 0;
		var sumprice = 0;
		this.comp('buycarData').each(function(params) {
			if (params.row.val('producttype') == 0) {
				saveprofit += parseFloat(params.row.val('number')) * parseFloat(params.row.val('discount'));
				owerprofit += parseFloat(params.row.val('number')) * parseFloat(params.row.val('owerprofit'));
				sumprice += parseFloat(params.row.val('number')) * parseFloat(params.row.val('price'));
			}
		});
		$(this.getElementByXid("span15")).text('节省了' + saveprofit.toFixed(2) + '元');
		$(this.getElementByXid("span16")).text('获得' + owerprofit.toFixed(2) + '元返现');
		$(this.getElementByXid("span19")).text('￥' + sumprice.toFixed(2));
		if (saveprofit > 0) {
			$(this.getElementByXid("row11")).show();
		} else {
			$(this.getElementByXid("row11")).hide();
		}
		if (owerprofit > 0) {
			$(this.getElementByXid("row12")).show();
		} else {
			$(this.getElementByXid("row12")).hide();
		}
		$(this.getElementByXid("span19")).text('￥' + sumprice.toFixed(2));
	};

	Model.prototype.subBtnClick = function(event) {

	};

	Model.prototype.addBtnClick = function(event) {

	};

	Model.prototype.letterdivClick = function(event) {
		var url = require.toUrl('../ower/receiptaddress.w');
		var params = {
			type : 'order'
		}
		justep.Shell.showPage(url, params);
	};

	Model.prototype.confirmorder_refreshaddress = function(params) {
		var self = this;
		address_id = params.address_id;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_appoint_address',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				address_id : address_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("span1")).text('收货人：' + jsonstr.receiptaddr.contact);
				$(self.getElementByXid("span2")).text(jsonstr.receiptaddr.contactphone);
				$(self.getElementByXid("span3")).text(
						'收货地址：' + jsonstr.receiptaddr.province + jsonstr.receiptaddr.city + jsonstr.receiptaddr.district + jsonstr.receiptaddr.street + jsonstr.receiptaddr.address);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.submitBtnClick = function(event) {
	buycar = [];
	justep.Shell.fireEvent("buycar_change", this);
	var params = {
	number:0
	}
	justep.Shell.fireEvent("buycar_change_buynumber", params);
		var self = this;
		this.comp('toggle1').set({
			'disabled' : true
		});
		this.comp('payBtn').set({
			'disabled' : true
		});
		this.comp('popOver1').show();
		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(localbuycar));
		fd.append("frontuuid", frontuuid);
		fd.append("address_id",address_id);
		fd.append("summary",this.comp('textarea1').val());
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/buycar_to_order",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				if (price == 0 && deduction == 0) {
					price = parseFloat(data.price);
					$(self.getElementByXid("span23")).text("￥" + price.toFixed(2));
					balance = parseFloat(data.balance);
					$(self.getElementByXid("span25")).text("可用余额：￥" + balance.toFixed(2));
				}
				if (balance != 0 || deduction != 0) {
					self.comp('toggle1').set({
						'disabled' : false
					});
				}
				if (price != 0 || deduction != 0) {
					self.comp('payBtn').set({
						'disabled' : false
					});
				}
				justep.Shell.fireEvent("ower_refresh_unpay_count", self);
			},
			error : function(e) {
				// 错误
			}
		});
	};

	Model.prototype.i9Click = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.toggle1Change = function(event) {

		if (this.comp('toggle1').get('checked')) {
			deduction = balance;
			price -= balance;
			balance -= deduction;
			if (price < 0) {
				balance -= price;
				price -= price;
				deduction -= balance;
			}

		} else {
			price += deduction;
			balance += deduction;
			deduction = 0;
		}
		$(this.getElementByXid("span23")).text("￥" + price.toFixed(2));
		$(this.getElementByXid("span25")).text("可用余额：￥" + balance.toFixed(2));
	};

	return Model;
});