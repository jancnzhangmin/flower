define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var orderid = 0;
	var price = 0;
	var banlance = 0;
	var localbuycar;
	var deduction = 0;// 抵扣
	var page = 1;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
	page = 1;
		this.refreshdata();
		$('.x-modal-button.x-modal-button-bold.Yes')[0].innerText = '否';
		$('.x-modal-button.x-modal-button-bold.No')[0].innerText = '是';
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + '/api/get_unpay_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 10000,
			data : {
				openid : openid,
				page:page
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var orderdata = self.comp("orderData");
				
				var orderdetaildata = self.comp("orderdetailData");
				
				var optionaldata = self.comp("optionalData");
				
				var activedata = self.comp("activeData");
				
				if(page == 1){
				orderdata.clear();
				orderdetaildata.clear();
				optionaldata.clear();
				activedata.clear();
				}
				$.each(jsonstr.orders, function(i, item) {
					var ordermessage = '';
					var order_status = 0;// 0待支付 1待发货 2待收货 3待评价 4交易完成 5平台处理
					if (item.status == 0) {
						ordermessage = '平台处理';
						order_status = 5;
					} else if (item.paystatus == 0) {
						ordermessage = '待付款';
						order_status = 0;
					} else if (item.deliverstatus == 0) {
						ordermessage = '待发货';
						order_status = 1;
					} else if (item.receiptstatus == 0) {
						ordermessage = '待收货';
						order_status = 2;
					} else if (item.commentstatus == 0) {
						ordermessage = '待评价';
						order_status = 3;
					} else {
						ordermessage = '交易完成';
						order_status = 4;
					}
					var order_options = {
						defaultValues : [ {
							id : item.id,
							user_id : item.user_id,
							ordernumber : item.ordernumber,
							deduction : item.deduction,
							payprice : item.payprice,
							paysum : parseFloat(item.paysum).toFixed(2),
							paystatus : item.paystatus,
							province : item.province,
							city : item.city,
							district : item.district,
							street : item.street,
							address : item.address,
							adcode : item.adcode,
							contact : item.contact,
							contactphone : item.contactphone,
							receiptstatus : item.receiptstatus,
							autoreceipttime : item.autoreceipttime,
							summary : item.summary,
							status : item.status,
							frontuuid : item.frontuuid,
							paytime : item.paytime,
							commentstatus : item.commentstatus,
							detailcount : item.detailcount,
							discount : parseFloat(item.discount).toFixed(2),
							owerprofit : parseFloat(item.owerprofit).toFixed(2),
							deliverstatus : item.deliverstatus,
							orderstatus : order_status,
							ordermessage : ordermessage
						} ]
					};
					orderdata.newData(order_options);
					$.each(item.orderdetail, function(detail_i, detail_item) {
						var detail_options = {
							defaultValues : [ {
								id : detail_item.id,
								product_id : detail_item.product_id,
								name : detail_item.name,
								number : detail_item.number,
								price : parseFloat(detail_item.price).toFixed(2),
								unit : detail_item.unit,
								spec : detail_item.spec,
								subtitle : detail_item.subtitle,
								weight : detail_item.weight,
								brand : detail_item.brand,
								pack : detail_item.pack,
								season : detail_item.season,
								cover : publicurl + detail_item.cover,
								order_id : detail_item.order_id,
								producttype : detail_item.producttype,
								ordermessage : ordermessage
							} ]
						};
						orderdetaildata.newData(detail_options);
						$.each(detail_item.optional, function(optional_i, optional_item) {
							var optional_options = {
								defaultValues : [ {
									id : optional_item.id,
									orderdetail_id : optional_item.orderdetail_id,
									selectcondition_id : optional_item.selectcondition_id,
									selectcondition_name : optional_item.selectcondition_name
								} ]
							};
							optionaldata.newData(optional_options);
						});
						$.each(detail_item.active, function(active_i, active_item) {
							var active_options = {
								defaultValues : [ {
									id : active_item.id,
									orderdetail_id : active_item.orderdetail_id,
									active : active_item.active,
									showlable : active_item.showlable,
									summary : active_item.summary,
									keywords : active_item.keywords
								} ]
							};
							activedata.newData(active_options);
						});
					});
				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.calcount = function(orderid) {
		var count = 0;
		var rows = this.comp('orderdetailData').find([ 'order_id' ], [ orderid ]);
		rows.each(function(param) {
			count += parseFloat(param.val('number'));
		});
		return count;
	};

	Model.prototype.deleteBtnClick = function(event) {
		var row = event.bindingContext.$object;
		orderid = row.val('id');
		this.comp('deletemessageDialog').show();

	};

	Model.prototype.deletemessageDialogNo = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/delete_order",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				orderid : orderid,
				openid:openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				justep.Shell.fireEvent("ower_refresh_unpay_count", self);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		var row = this.comp('orderData').find([ 'id' ], [ orderid ], true);
		this.comp('orderData').deleteData(row);
	};

	Model.prototype.paynowBtnClick = function(event) {
		var row = event.bindingContext.$object;
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_unapyorder",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				orderid : row.val('id'),
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				price = parseFloat(jsonstr.order.paysum);
				balance = parseFloat(jsonstr.balance);
				if (balance == 0) {
					self.comp('toggle1').set({
						'disabled' : true,
						'checked' : false
					});
				} else {
					self.comp('toggle1').set({
						'disabled' : false
					});
				}
				$(self.getElementByXid("span23")).text("￥" + price.toFixed(2));
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		this.comp('popOver1').show();
	};

	Model.prototype.toggle1Change = function(event) {

	};

	Model.prototype.i9Click = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.scrollView1PullDown = function(event){
	page = 1;
this.refreshdata();
	};

	Model.prototype.scrollView1PullUp = function(event){
	page +=1;
	this.refreshdata();
	};

	return Model;
});