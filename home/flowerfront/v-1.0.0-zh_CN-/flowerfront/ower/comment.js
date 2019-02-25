define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");
	var Swiper = require("../swiper-4.4.2/swiper.min");
	require("../js/jquery.raty");
	var orderid = 0;
	var mySwiper = null;
	var commentid = 0;
	var commentlevel = -1;// 评价等级 好评0 中评1 差评2
	var anonymous = 0;// 0正常 1匿名
	var descscore = -1;
	var deliverscore = -1;
	var servicescore = -1;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		$(this.getElementByXid("xiangfudiv")).raty({
			starOff : './js/img/star-off.png',
			starOn : './js/img/star-on.png',
			click : function(score, evt) {
				switch (score) {
				case (1):
					$(self.getElementByXid("xiangfuspan")).text('非常差');
					break;
				case (2):
					$(self.getElementByXid("xiangfuspan")).text('差');
					break;
				case (3):
					$(self.getElementByXid("xiangfuspan")).text('一般');
					break;
				case (4):
					$(self.getElementByXid("xiangfuspan")).text('好');
					break;
				case (5):
					$(self.getElementByXid("xiangfuspan")).text('非常好');
					break;
				}
				descscore = score;
			}
		});
		$(this.getElementByXid("wuliudiv")).raty({
			starOff : './js/img/star-off.png',
			starOn : './js/img/star-on.png',
			click : function(score, evt) {
				switch (score) {
				case (1):
					$(self.getElementByXid("wuliuspan")).text('非常差');
					break;
				case (2):
					$(self.getElementByXid("wuliuspan")).text('差');
					break;
				case (3):
					$(self.getElementByXid("wuliuspan")).text('一般');
					break;
				case (4):
					$(self.getElementByXid("wuliuspan")).text('好');
					break;
				case (5):
					$(self.getElementByXid("wuliuspan")).text('非常好');
					break;
				}
				deliverscore = score;
			}
		});
		$(this.getElementByXid("fuwudiv")).raty({
			starOff : './js/img/star-off.png',
			starOn : './js/img/star-on.png',
			click : function(score, evt) {
				switch (score) {
				case (1):
					$(self.getElementByXid("fuwuspan")).text('非常差');
					break;
				case (2):
					$(self.getElementByXid("fuwuspan")).text('差');
					break;
				case (3):
					$(self.getElementByXid("fuwuspan")).text('一般');
					break;
				case (4):
					$(self.getElementByXid("fuwuspan")).text('好');
					break;
				case (5):
					$(self.getElementByXid("fuwuspan")).text('非常好');
					break;
				}
				servicescore = score;
			}
		});
	};

	Model.prototype.refreshdata = function() {
		var rows = this.comp('imageData').find([ 'isnull' ], [ 1 ], true);
		if (rows.length > 0) {
			this.comp('imageData').deleteData(rows[0]);
		}
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_draft_comment",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				orderid : orderid,
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var imagedata = self.comp('imageData');
				commentid = jsonstr.comment.id;
				$.each(jsonstr.images, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							image : publicurl + item.image,
							isnull : 0
						} ]
					};
					var hasid = false;
					imagedata.each(function(param) {
						if (param.row.val('id') == item.id) {
							hasid = true;
						}
					});
					if (!hasid) {
						imagedata.newData(options);
					}

				});
				var options = {
					defaultValues : [ {
						id : new UUID().toString(),
						isnull : 1
					} ]
				}
				imagedata.newData(options);
				$('.imagediv').height($(document).width() / 3.5);
				$('.addi').css('marginTop', -8);
				$('.addi').css('marginLeft', -8);
				self.initswiper();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.id) {
			orderid = event.params.id;
		}
		this.refreshdata();
	};

	Model.prototype.upload_fileChange = function(event) {
		var self = this;
		if (event.target.files[0]) {
			var reader = new FileReader();
			var oFile = event.target.files[0];
			var vFD = new FormData();
			vFD.append("openid", openid);
			vFD.append("orderid", orderid);
			vFD.append("image", oFile);
			oXHR = new XMLHttpRequest();
			oXHR.addEventListener('load', function(resUpload) {
				self.refreshdata();
			}, false);
			oXHR.addEventListener('error', function() {
				// 失败
			}, false);
			oXHR.addEventListener('abort', function() {
				// 上传中断
			}, false);
			oXHR.open('POST', publicurl + "api/upload_commentimg");
			oXHR.send(vFD);
		}
	};

	Model.prototype.initswiper = function() {
		$('.swiper-wrapper').empty();
		this.comp('imageData').each(function(item) {
			if (item.row.val('isnull') == 0) {
				myimage = '<div class="swiper-slide slidediv"><img width=100% src=' + item.row.val('image') + '></div>';
				$('.swiper-wrapper').append(myimage);
			}
		});
		$('.swiper-wrapper').height($(document).height());
	}

	Model.prototype.imagedivClick = function(event) {
		var self = this;
		var row = event.bindingContext.$object;
		if (row.val('isnull') == 0) {
			self.comp('popOver1').show();
			var slideindex = 0;
			this.comp('imageData').each(function(item) {
				if (item.row.val('id') == row.val('id')) {
					slideindex = item.index;
				}
			});
			if (mySwiper && true) {
				if (mySwiper.lenght > 0)
					for (var i = 0; i < mySwiper.lenght; i++) {
						mySwiper[i].destroy();
					}
			}
			mySwiper = new Swiper('.swiper-container');
			mySwiper[1].slideTo(slideindex, 0, false);
		}
	};

	Model.prototype.closepopClick = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.delectimgBtnClick = function(event) {
		var self = this;
		var imageid = 0;
		this.comp('imageData').each(function(item) {
			if (mySwiper[1].activeIndex == item.index) {
				imageid = item.row.val('id');
			}
		});
		var row = this.comp('imageData').find([ 'id' ], [ imageid ], true);
		this.comp('imageData').deleteData(row);
		mySwiper[1].removeSlide(mySwiper[1].activeIndex);
		if (mySwiper[1].slides.length == 0) {
			this.comp('popOver1').hide();
		}
		$.ajax({
			async : true,
			url : publicurl + "api/delete_commentimg",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				commentimgid : imageid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.submitBtnClick = function(event) {
		var self = this;
		if (commentlevel == -1) {
			justep.Util.hint("请选择评价等级", {
				"tyep" : "info",
				"position" : "top",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
			return false;
		}
		if (!self.comp('commenttextarea').val()) {
			justep.Util.hint("评价内容不能为空", {
				"tyep" : "info",
				"position" : "top",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
			return false;
		}
		$.ajax({
			async : true,
			url : publicurl + "api/comment",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				commentid : commentid,
				comment : self.comp('commenttextarea').val(),
				commentlevel : commentlevel,
				anonymous : anonymous,
				descscore : descscore,
				deliverscore : deliverscore,
				servicescore : servicescore
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				justep.Shell.fireEvent("uncomment_refresh", self);
				justep.Shell.fireEvent("ower_uncomment_count", self);
				self.close();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.anonymousrowClick = function(event) {
		if (anonymous == 0) {
			anonymous = 1;
			$(this.getElementByXid("anonymousrow")).removeClass('text-muted');
			$(this.getElementByXid("anonymousrow")).addClass('anonymous-active');
			$(this.getElementByXid("anonymousi")).show();
		} else {
			anonymous = 0;
			$(this.getElementByXid("anonymousrow")).removeClass('anonymous-active');
			$(this.getElementByXid("anonymousrow")).addClass('text-muted');
			$(this.getElementByXid("anonymousi")).hide();
		}

	};

	Model.prototype.goodBtnClick = function(event) {
		commentlevel = 0;
	};

	Model.prototype.normalBtnClick = function(event) {
		commentlevel = 1;
	};

	Model.prototype.badBtnClick = function(event) {
		commentlevel = 2;
	};

	return Model;
});