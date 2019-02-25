define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var cla_id = 0;
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.refreshdata();
		justep.Shell.on("product_collection", this.product_collection, this);
	};

	Model.prototype.product_collection = function(params) {
		var rows = this.comp('productData').find([ 'id' ], [ params.id ]);
		if (rows.length > 0) {
			rows[0].val('collection', params.collection);
		}
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_class',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("claData");
				data.clear();
				var isselect = 1;
				$.each(jsonstr.clas, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							keyword : item.keyword,
							isselect : isselect
						} ]
					};
					data.newData(options);
					isselect = 0;
				});
				if (cla_id == 0) {
					firstdata = self.comp('claData').getFirstRow();
					cla_id = firstdata.val('id');
					$(self.getElementByXid("span2")).text(firstdata.val('name'));
				}
				self.getproduct();

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.getproduct = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_product_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				cla_id : cla_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("productData");
				data.clear();
				$.each(jsonstr.products, function(i, item) {
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

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.list1AfterRender = function(event) {
		// $('.imagediv').height($('.imagediv').width());
	};

	Model.prototype.li1Click = function(event) {
		var row = event.bindingContext.$object;
		cla_id = row.val('id');
		this.comp('claData').each(function(params) {
			params.row.val('isselect', 0);
		});
		row.val('isselect', 1);
		$(this.getElementByXid("span2")).text(row.val('name'));

		this.getproduct();
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
				// self.refreshdata();
				justep.Shell.fireEvent("ower_refresh", this);
				var collection = 1;
				if (row.val('collection') == 1) {
					collection = 0;
				}
				var params = {
					id : row.val('id'),
					collection : row.val('collection')
				}
				justep.Shell.fireEvent("topsale_change_collection", params);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	return Model;
});