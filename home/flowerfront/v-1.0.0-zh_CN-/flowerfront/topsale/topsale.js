define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!../swiper-4.4.2/swiper.min").load();
	var Swiper = require("../swiper-4.4.2/swiper.min");
	var Model = function() {
		this.callParent();
	};
	var page_width = 0;

	Model.prototype.modelLoad = function(event) {
		var mySwiper = new Swiper('.swiper-container', {
			direction : 'vertical', // 垂直切换选项
			loop : true, // 循环模式选项
			autoplay : true
		});
		mySwiper.allowTouchMove = false;
		this.refreshdata();
		page_width = $(document).width();
		justep.Shell.on("topsale_change_collection", this.topsale_change_collection, this);
	};

	Model.prototype.topsale_change_collection = function(params) {
		var rows = this.comp('productData').find([ 'id' ], [ params.id ]);
		rows[0].val('collection', params.collection);
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_recommend_product",
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
		$('.imagediv').height($('.imagediv').width());
		$('.follow').css("marginLeft", $('.imagediv').width() - 30);
		$('.follow').css("marginTop", $('.imagediv').width() - 30);
	};

	Model.prototype.i5Click = function(event) {
		// if(event.target.className.includes("my-xinxingxian")){
		// event.target.classList.replace('my-xinxingxian', 'my-xinxingshi');
		// }else{
		// event.target.classList.replace('my-xinxingshi', 'my-xinxingxian');
		// }
		var row = event.bindingContext.$object;
		var rows = this.comp('productData').find([ 'id' ], [ row.val('id') ]);
		var collection = 0;
		if (rows[0].val('collection') == 0) {
			rows[0].val('collection', 1);
			collection = 1;
		} else {
			rows[0].val('collection', 0);
		}

		var params = {
			id : row.val('id'),
			collection : collection
		}
		justep.Shell.fireEvent("product_collection", params);

		var self = this;

		// if ($(this.getElementByXid("i11")).hasClass('my-xinxingxian')) {
		// $(this.getElementByXid("i11")).removeClass('my-xinxingxian');
		// $(this.getElementByXid("i11")).addClass('my-xinxingshi');
		// } else {
		// $(this.getElementByXid("i11")).removeClass('my-xinxingshi');
		// $(this.getElementByXid("i11")).addClass('my-xinxingxian');
		// }
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
				justep.Shell.fireEvent("ower_refresh", this);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
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

	Model.prototype.keyClick = function(event) {
		this.comp('serachpopOver').show();
		$(this.getElementByXid("searchinput")).val($(this.getElementByXid("key")).attr('placeholder'));
		$(this.getElementByXid("searchinput")).focus();
	};

	Model.prototype.search = function(searchkey) {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_search",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				search : searchkey
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("searchData");
				data.clear();
				$.each(jsonstr.products, function(i, item) {

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
								cover : publicurl + item.cover
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

	Model.prototype.cancelsearchBtnClick = function(event) {
		this.comp('serachpopOver').hide();
	};

	Model.prototype.searchinputKeyup = function(event) {
		search = event.currentTarget.value;
		if (search.length > 0) {
			this.search(search);
		}else{
		this.comp("searchData").clear();
		}
	};

	Model.prototype.div33Click = function(event){
		var row = event.bindingContext.$object;
		var params = {
			data : {
				id : row.val('id')
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productdetail.w"), params);
	};


	Model.prototype.yjmhcolClick = function(event){
justep.Shell.showPage(require.toUrl("../product/productlist.w"));
	};


	return Model;
});