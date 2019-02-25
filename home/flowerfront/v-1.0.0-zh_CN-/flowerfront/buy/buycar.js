define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");
	require("css!../swiper-4.4.2/swiper.min").load();
	var Swiper = require("../swiper-4.4.2/swiper.min");
	var originalX = 0;
	var lastX = 0;
	var swiper;
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.data) {
			if (event.params.data.type == 'product') {
				$(this.getElementByXid("backi")).css({
					'color' : '#333333'
				});
			}
		} else {
			$(this.getElementByXid("backi")).css({
				'color' : '#fff'
			});
		}
	};

	Model.prototype.modelLoad = function(event) {
		justep.Shell.on("buycar_change", this.buycar_change, this);
		this.refreshdata();
		$('#x-default-loadingbar').css('z-index', -1);

	};

	Model.prototype.buycar_change = function() {
		this.refreshdata();

	}

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

		swiper = new Swiper('.swiper-container', {
			slidesPerView : 'auto'
		});

		$('.menu').each(function(i, item) {
			$(item).height($(item.parentElement.children[0]).height());
		});

	};

	Model.prototype.subBtnClick = function(event) {
		this.changeNum('sub', event);
	};

	Model.prototype.addBtnClick = function(event) {

		this.changeNum('add', event);

	};

	Model.prototype.changeNum = function(type, event) {
		var row = event.bindingContext.$object;
		if (type == 'sub') {
			row.val('number', parseFloat(row.val('number') - 1));
		} else {
			row.val('number', parseFloat(row.val('number') + 1));
		}

		// buycar{id,product_id,user_id,number,price,cost,discount,cover,firstprofit,secondprofit,owerprofit,
		// producttype,buycaroptional[id,buycar_id,select_optional,select_condition],activetype[id,buycar_id,active,showlable,summary,keywords],openid}
		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype')
			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
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
		try {
			if (this.comp('buycarData').count() > 0) {
				this.comp('button3').set({
					'label' : '结算(' + this.comp('buycarData').count() + ')'
				});
			} else {
				this.comp('button3').set({
					'label' : '结算'
				});
			}
		} catch (e) {
		}
	};

	Model.prototype.row1Touchmove = function(event) {
		// $("#sanjiaoLeft").css("marginLeft",val);
		// debugger;
		// $(event.currentTarget).animate({'marginLeft':-(originalX -
		// event.originalEvent.targetTouches[0].clientX)},10);
		// movevalue = 2;
		// $(event.currentTarget).animate({'marginLeft':-(lastX -
		// event.originalEvent.targetTouches[0].clientX)},10);
		// lastX = event.originalEvent.targetTouches[0].clientX;
		var subvalue = originalX - event.originalEvent.targetTouches[0].clientX;
		$(event.currentTarget).css("marginLeft", -subvalue);
		// $(event.currentTarget).animate({
		// 'marginLeft' : -subvalue
		// }, 1);
		$(event.currentTarget.nextElementSibling).width(subvalue);
		// $(event.currentTarget).width($(event.currentTarget)+subvalue);
		// console.log(originalX -
		// event.originalEvent.targetTouches[0].clientX);

	};

	Model.prototype.row1Touchstart = function(event) {
		try {
			$(swiper).each(function(i, item) {
				item.slideTo(0, 300, false);
			});
		} catch (e) {
		}
		// this.movreset(event);
		// originalX = event.originalEvent.targetTouches[0].clientX -
		// parseInt($(event.currentTarget).css('marginLeft'));
		// $('.mov').height(event.currentTarget.clientHeight);
		// $(event.currentTarget.nextElementSibling).height(event.currentTarget.clientHeight);
		// $(event.currentTarget.nextElementSibling).css("marginTop",
		// -event.currentTarget.clientHeight);
	};

	Model.prototype.row1Touchend = function(event) {
		if ($(event.currentTarget.nextElementSibling).width() > 80) {
			$(event.currentTarget).animate({
				'marginLeft' : -160
			}, 100);
			$(event.currentTarget.nextElementSibling).animate({
				'width' : 160
			}, 100);
		} else {
			$(event.currentTarget).animate({
				'marginLeft' : 0
			}, 100);
			$(event.currentTarget.nextElementSibling).animate({
				'width' : 0
			}, 100);
		}
	};

	Model.prototype.movreset = function(event) {
		$('.movrow').each(function(i, item) {
			if (item.attributes.id != event.currentTarget.attributes.id) {
				$(item).animate({
					'marginLeft' : 0
				}, 100);
				$(item.nextElementSibling).animate({
					'width' : 0
				}, 100);
			}
		});

		// $('.movrow').animate({'marginLeft':0},100);
		// $('.mov').animate({'width':0},100);
	};

	Model.prototype.row1Click = function(event) {

		// swiper[2].slideTo(0, 1000, false);

	};

	Model.prototype.modelActive = function(event) {

	};

	Model.prototype.deletedivClick = function(event) {
		var row = event.bindingContext.$object;
		row.val('number', 0);
		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype')
			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
		});
	};

	Model.prototype.collcetiondivClick = function(event) {
		var row = event.bindingContext.$object;
		row.val('number', 0);
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/force_collection",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				product_id : row.val('product_id')
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype')
			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
		});
		var params = {
			id : row.val('product_id'),
			collection : 1
		}
		justep.Shell.fireEvent("topsale_change_collection", params);
		justep.Shell.fireEvent("productdetail_force_collection", this);
	};

	Model.prototype.settleBtnClick = function(event){
justep.Shell.showPage(require.toUrl("./confirmorder.w"));
	};

	return Model;
});