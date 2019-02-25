define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.refreshdata();
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_collection",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("productData");
				data.clear();
				$.each(jsonstr.collections, function(i, item) {
					if (item.producttype == 0) {
						var odd = 0;
						odd = i % 2;
						var options = {
							defaultValues : [ {
								id : item.id,
								name : item.name,
								price : item.price,
								unit : item.unit,
								spec : item.spec,
								pinyin : item.pinyin,
								fullpinyin : item.fullpinyin,
								subtitle : item.subtitle,
								cover : publicurl + item.cover,
								odd : odd,
								discount : item.discount,
								collection : item.collection
							} ]
						};
						data.newData(options);
					}
				});

				// $('.imagediv').height($('.imagediv').width());
				// $('.follow').css("marginLeft", $('.imagediv').width() - 30);
				// $('.follow').css("marginTop", $('.imagediv').width() - 30);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.list1AfterRender = function(event) {

	};

	Model.prototype.div25Click = function(event) {
		if (event.target.localName == 'i') {
			return false;
		}
		var row = event.bindingContext.$object;
		var params = {
			data : {
				id : row.val('id')
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productdetail.w"), params);
	};

	Model.prototype.i5Click = function(event) {
		var row = event.bindingContext.$object;
		var rows = this.comp('productData').find([ 'id' ], [ row.val('id') ]);
		if (rows[0].val('collection') == 0) {
			rows[0].val('collection', 1);
		} else {
			rows[0].val('collection', 0);
		}

		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/collection",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				product_id : row.val('id')
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				self.refreshdata();
				justep.Shell.fireEvent("ower_refresh", this);
				var params = {
					id : row.val('id'),
					collection : 0
				}
				justep.Shell.fireEvent("topsale_change_collection", params);
				justep.Shell.fireEvent("product_collection", params);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	return Model;
});