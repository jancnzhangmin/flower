define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.button3Click = function(event){
//justep.Shell.on("buycar_change", this.buycar_change, this);
this.comp('windowContainer2').refresh();
	};
	
	Model.prototype.buycar_change_buynumber = function(params){
	if(params.number > 0){
	$(this.getElementByXid("label2")).text(params.number);
	$(this.getElementByXid("label2")).show();
	}else{
	$(this.getElementByXid("label2")).hide();
	}
	}

	Model.prototype.modelLoad = function(event){
justep.Shell.on("buycar_change_buynumber", this.buycar_change_buynumber, this);
	};

	Model.prototype.topsalecontentActive = function(event){

	};

	return Model;
});