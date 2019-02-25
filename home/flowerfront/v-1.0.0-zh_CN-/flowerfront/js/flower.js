//buycar{id,product_id,user_id,number,price,cost,discount,cover,firstprofit,secondprofit,owerprofit,
//producttype,buycaroptional[id,buycar_id,select_optional,select_condition],activetype[id,buycar_id,active,showlable,summary,keywords],openid}
var AddToBuycar = function(buycardata){
	buycar = [];
	var buycarnum = 0;
	$.each(buycardata,function(i,item){
		if(item.producttype == 0){
			buycarnum += 1;
		}
		var buycaroptional = new Array();
		$.each(item.optional,function(oi,oitem){
			var optional={
					selectcondition_id:oitem.selectcondition_id,
					selectcondition_name:oitem.selectcondition_name
			};
			buycaroptional.push(optional);
		});
		var activetype = new Array();
		$.each(item.activetype,function(ai,aitem){
			var active={
					id:ai,
					buycar_id:item.id,
					active:aitem.active,
					showlable:aitem.showlable,
					summary:aitem.summary,
					keywords:aitem.keywords
			};
			activetype.push(active);
		});
		var option={
				id:item.id,
				product_id:item.id,
				number:item.number,
				price:item.price,
				cost:item.cost,
				discount:item.discount,
				cover:item.cover,
				firstprofit:item.firstprofit,
				secondprofit:item.secondprofit,
				owerprofit:item.owerprofit,
				producttype:item.producttype,
				buycaroptional:buycaroptional,
				activetype:activetype,
				name:item.name,
				subtitle:item.subtitle,
				spec:item.spec,
				unit:item.unit,
				cover:item.cover,
				pack:item.pack
		};
		
		buycar.push(option);
		
	});
	
	justep.Shell.fireEvent("buycar_change", this);
	var params={
			number:buycarnum
	}
	justep.Shell.fireEvent("buycar_change_buynumber", params);
};