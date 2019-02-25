define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var formtype = '';
	var amapkey = '';
	var receiptaddrcount = 0;
	var address_id = 0;
	require("../js/jquery.charfirst.pinyin");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params) {
			if (event.params.type == 'add') {
				formtype = 'add';
				this.comp('title').set({
					'title' : '添加收货地址'
				});
			} else {
				formtype = 'edit';
				this.comp('title').set({
					'title' : '编辑收货地址'
				});
				$(this.getElementByXid("row6")).show();
				address_id = event.params.address_id;
				this.getaddressdata();
			}
		}
	};

	Model.prototype.getaddressdata = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_address",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				address_id : address_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				self.comp('input1').val(jsonstr.receiptaddr.contact);
				self.comp('input2').val(jsonstr.receiptaddr.contactphone);
				var maindata = self.comp('mainData');
				var row = maindata.find([ 'level' ], [ 'province' ], true);
				row[0].val('address', jsonstr.receiptaddr.province);
				row[0].val('adcode', jsonstr.receiptaddr.adcode.substr(0, 2) + '0000');
				row[0].val('isselect', 0);

				var row = maindata.find([ 'level' ], [ 'city' ], true);
				row[0].val('address', jsonstr.receiptaddr.city);
				row[0].val('adcode', jsonstr.receiptaddr.adcode.substr(0, 4) + '00');
				row[0].val('isselect', 0);

				var row = maindata.find([ 'level' ], [ 'district' ], true);
				row[0].val('address', jsonstr.receiptaddr.district);
				row[0].val('adcode', jsonstr.receiptaddr.adcode);
				row[0].val('isselect', 0);

				var row = maindata.find([ 'level' ], [ 'street' ], true);
				row[0].val('address', jsonstr.receiptaddr.street);
				if (jsonstr.receiptaddr.street == '') {
					row[0].val('address', '暂不选择');
				}
				row[0].val('adcode', jsonstr.receiptaddr.adcode);
				row[0].val('isselect', 1);

				self.comp('textarea1').val(jsonstr.receiptaddr.address);
				if (jsonstr.receiptaddr.isdefault == 1) {
					self.comp('toggle1').set({
						'checked' : true
					});
				}

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_amapkey",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				amapkey = jsonstr.amapkey;
				receiptaddrcount = jsonstr.receiptaddrcount;
				if (receiptaddrcount == 0) {
					self.comp('toggle1').set({
						'checked' : true,
						'disabled' : true
					});
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

		var maindata = this.comp('mainData');
		maindata.clear();
		var option = {
			defaultValues : [ {
				id : 1,
				address : '收货地址',
				adcode : '',
				level : 'province',
				isselect : 1
			} ]
		}
		maindata.newData(option);
		var option = {
			defaultValues : [ {
				id : 2,
				address : '',
				adcode : '',
				level : 'city',
				isselect : 0
			} ]
		}
		maindata.newData(option);
		var option = {
			defaultValues : [ {
				id : 3,
				address : '',
				adcode : '',
				level : 'district',
				isselect : 0
			} ]
		}
		maindata.newData(option);
		var option = {
			defaultValues : [ {
				id : 4,
				address : '',
				adcode : '',
				level : 'street',
				isselect : 0
			} ]
		}
		maindata.newData(option);
	};

	Model.prototype.modelLoad = function(event) {
		this.refreshdata();
	};

	Model.prototype.row3Click = function(event) {
		this.comp('popOver1').show();
		this.getareadata();
	};

	Model.prototype.getareadata = function() {
		var self = this;
		var keywords = '';
		var maindata = self.comp('mainData');
		var rows = maindata.find([ 'isselect' ], [ '1' ], true);
		if (rows[0].val('level') == 'province') {
			keywords = '';
		}
		if (rows[0].val('level') == 'city') {
			var currentrow = maindata.find([ 'level' ], [ 'province' ], true);
			keywords = currentrow[0].val('adcode');
		}
		if (rows[0].val('level') == 'district') {
			var currentrow = maindata.find([ 'level' ], [ 'city' ], true);
			keywords = currentrow[0].val('adcode');
		}
		if (rows[0].val('level') == 'street') {
			var currentrow = maindata.find([ 'level' ], [ 'district' ], true);
			keywords = currentrow[0].val('adcode');
			if (keywords == '') {
				var currentrow = maindata.find([ 'level' ], [ 'city' ], true);
				keywords = currentrow[0].val('adcode');
			}
		}

		$.ajax({
			async : true,
			url : 'https://restapi.amap.com/v3/config/district',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				key : amapkey,
				keywords : keywords,
				subdistrict : 1,
				extensions : 'base'
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				self.firstpinyin(jsonstr);
				$(self.getElementByXid("panel2")).css('marginTop', $(self.getElementByXid("list1")).height() + 50);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.firstpinyin = function(jsonstr) {
		var districtdata = this.comp('districtData');
		districtdata.clear();
		if (jsonstr.districts[0].districts[0].level == 'street') {
			var option = {
				defaultValues : [ {
					id : -1,
					adcode : jsonstr.districts[0].adcode,
					level : 'street',
					name : '暂不选择',
					myorder : ''
				} ]
			}
			districtdata.newData(option);
		}
		var pinyin_list = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ];
		var result = [];
		$.each(pinyin_list, function(i, item) {
			$.each(jsonstr.districts[0].districts, function(si, sitem) {
				var sp = makePy(sitem.name.trim().substr(0, 1))[0];
				if (sitem.name == '重庆市') {
					sp = 'C';
				}
				if (sp == item) {
					var option = {
						myorder : item,
						id : i,
						adcode : sitem.adcode,
						level : sitem.level,
						name : sitem.name
					}
					result.push(option);
				}
			});
		});

		$.each(result, function(i, item) {
			inarr = $.inArray(item.myorder, pinyin_list);
			myorder = '';
			if (inarr >= 0) {
				myorder = item.myorder;
				pinyin_list = $.grep(pinyin_list, function(value) {
					return value != item.myorder;
				});
			}
			var option = {
				defaultValues : [ {
					id : i,
					adcode : item.adcode,
					level : item.level,
					name : item.name,
					myorder : myorder
				} ]
			}
			districtdata.newData(option);
		});
	};

	Model.prototype.span6Click = function(event) {

	};

	Model.prototype.row8Click = function(event) {
		var maindata = this.comp('mainData');
		maindata.each(function(params) {
			params.row.val('isselect', 0);
		});
		var row = event.bindingContext.$object;
		row.val('isselect', 1);
		this.getareadata();
	};

	Model.prototype.i4Click = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.row9Click = function(event) {
		var row = event.bindingContext.$object;
		var maindata = this.comp('mainData');
		var currentrow = maindata.find([ 'level' ], [ row.val('level') ], true);
		currentrow[0].val('address', row.val('name'));
		currentrow[0].val('adcode', row.val('adcode'));
		maindata.each(function(params) {
			params.row.val('isselect', 0);
		});
		if (row.val('level') == 'province') {
			var currentrow = maindata.find([ 'level' ], [ 'city' ], true);
			currentrow[0].val('isselect', 1);
		}
		if (row.val('level') == 'city') {
			var currentrow = maindata.find([ 'level' ], [ 'district' ], true);
			currentrow[0].val('isselect', 1);
		}
		if (row.val('level') == 'district') {
			var currentrow = maindata.find([ 'level' ], [ 'street' ], true);
			currentrow[0].val('isselect', 1);
		}
		if (row.val('level') == 'street') {
			var currentrow = maindata.find([ 'level' ], [ 'street' ], true);
			currentrow[0].val('isselect', 1);
			this.comp('popOver1').hide();
			return false;
		}
		this.getareadata();
	};

	Model.prototype.contrastdata = function(str) {
		var row = this.comp('mainData').find([ 'address' ], [ str ], true);
		if (row.length > 0) {
			return true;
		} else {
			return false;
		}
	};

	Model.prototype.savebtnClick = function(event) {
		var msg = '';
		msgflag = false;
		if (!this.comp('input1').val()) {
			msg = '收货人不能为空！';
			msgflag = true;
		}
		if (!this.comp('input2').val()) {
			msg = '收货人电话不能为空！';
			msgflag = true;
		}
		var row = this.comp('mainData').find([ 'level' ], [ 'city' ], true);
		if (row[0].val('address') == '') {
			msg = '地址不能为空！';
			msflag = true;
		}
		if (!this.comp('textarea1').val()) {
			msg = '详细地址不能为空！';
			msgflag = true;
		}
		if (msgflag) {
			justep.Util.hint(msg, {
				"tyep" : "info",
				"position" : "middle",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
			return false;
		}

		var row = this.comp('mainData').find([ 'level' ], [ 'province' ], true);
		var province = row[0].val('address');
		var row = this.comp('mainData').find([ 'level' ], [ 'city' ], true);
		var city = row[0].val('address');
		var row = this.comp('mainData').find([ 'level' ], [ 'district' ], true);
		var district = row[0].val('address');
		var row = this.comp('mainData').find([ 'level' ], [ 'street' ], true);
		var street = row[0].val('address');
		if (street == '暂不选择') {
			street = '';
		}
		var adcode = '';
		this.comp('mainData').each(function(params) {
			if (params.row.val('adcode') != '') {
				adcode = params.row.val('adcode');
			}
		});
		var isdefault = 0;
		if (this.comp('toggle1').get('checked')) {
			isdefault = 1;
		}

		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/set_address',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				contact : self.comp('input1').val(),
				contactphone : self.comp('input2').val(),
				address : self.comp('textarea1').val(),
				province : province,
				city : city,
				district : district,
				street : street,
				isdefault : isdefault,
				formtype : formtype,
				adcode : adcode,
				address_id : address_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				justep.Shell.fireEvent("receiptaddress_refreshdata", this);
				self.close();

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.delbtnClick = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/del_address',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				address_id : address_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				justep.Shell.fireEvent("receiptaddress_refreshdata", this);
				self.close();

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	return Model;
});