window.__justep.__ResourceEngine.loadCss([{url: '/UI2/system/components/bootstrap.min.css', include: '$model/UI2/system/components/bootstrap/lib/css/bootstrap,$model/UI2/system/components/bootstrap/lib/css/bootstrap-theme'},{url: '/UI2/system/components/comp.min.css', include: '$model/UI2/system/components/justep/lib/css2/dataControl,$model/UI2/system/components/justep/input/css/datePickerPC,$model/UI2/system/components/justep/messageDialog/css/messageDialog,$model/UI2/system/components/justep/lib/css3/round,$model/UI2/system/components/justep/input/css/datePicker,$model/UI2/system/components/justep/row/css/row,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/attachment/css/attachment,$model/UI2/system/components/justep/barcode/css/barcodeImage,$model/UI2/system/components/bootstrap/dropdown/css/dropdown,$model/UI2/system/components/justep/contents/css/contents,$model/UI2/system/components/justep/common/css/forms,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/locker/css/locker,$model/UI2/system/components/justep/menu/css/menu,$model/UI2/system/components/justep/scrollView/css/scrollView,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/dialog/css/dialog,$model/UI2/system/components/justep/bar/css/bar,$model/UI2/system/components/justep/popMenu/css/popMenu,$model/UI2/system/components/justep/lib/css/icons,$model/UI2/system/components/justep/lib/css4/e-commerce,$model/UI2/system/components/justep/toolBar/css/toolBar,$model/UI2/system/components/justep/popOver/css/popOver,$model/UI2/system/components/justep/panel/css/panel,$model/UI2/system/components/bootstrap/carousel/css/carousel,$model/UI2/system/components/justep/wing/css/wing,$model/UI2/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/UI2/system/components/justep/titleBar/css/titleBar,$model/UI2/system/components/justep/lib/css1/linear,$model/UI2/system/components/justep/numberSelect/css/numberList,$model/UI2/system/components/justep/list/css/list,$model/UI2/system/components/justep/dataTables/css/dataTables'}]);window.__justep.__ResourceEngine.loadJs(['/system/core.min.js','/system/common.min.js','/system/components/comp.min.js']);define(function(require){
require('$model/UI2/system/components/justep/model/model');
require('$model/UI2/system/components/justep/loadingBar/loadingBar');
require('$model/UI2/system/components/justep/button/button');
require('$model/UI2/system/components/justep/scrollView/scrollView');
require('$model/UI2/system/components/justep/list/list');
require('$model/UI2/system/components/justep/panel/child');
require('$model/UI2/system/components/justep/button/toggle');
require('$model/UI2/system/components/justep/messageDialog/messageDialog');
require('$model/UI2/system/components/justep/panel/panel');
require('$model/UI2/system/components/justep/popOver/popOver');
require('$model/UI2/system/components/justep/row/row');
require('$model/UI2/system/components/justep/titleBar/titleBar');
require('$model/UI2/system/components/justep/data/data');
require('$model/UI2/system/components/justep/window/window');
var __parent1=require('$model/UI2/system/lib/base/modelBase'); 
var __parent0=require('$model/UI2/flowerfront/ower/undeliver'); 
var __result = __parent1._extend(__parent0).extend({
	constructor:function(contextUrl){
	this.__sysParam='true';
	this.__contextUrl=contextUrl;
	this.__id='';
	this.__cid='czyqYBn';
	this._flag_='61f8c322b91d7d9daf06a37ac1ccf8f2';
	this._wCfg_={};
	this._appCfg_={};
	this.callParent(contextUrl);
 require('css!$UI/flowerfront/icon/my.icons').load();
 require('css!$UI/flowerfront/icon2/my2.icons').load();
 var __Data__ = require("$UI/system/components/justep/data/data");new __Data__(this,{"autoLoad":true,"confirmDelete":false,"confirmRefresh":false,"defCols":{"adcode":{"define":"adcode","name":"adcode","relation":"adcode","type":"String"},"address":{"define":"address","name":"address","relation":"address","type":"String"},"autoreceipttime":{"define":"autoreceipttime","name":"autoreceipttime","relation":"autoreceipttime","type":"String"},"city":{"define":"city","name":"city","relation":"city","type":"String"},"commentstatus":{"define":"commentstatus","name":"commentstatus","relation":"commentstatus","type":"String"},"contact":{"define":"contact","name":"contact","relation":"contact","type":"String"},"contactphone":{"define":"contactphone","name":"contactphone","relation":"contactphone","type":"String"},"deduction":{"define":"deduction","name":"deduction","relation":"deduction","type":"String"},"deliverstatus":{"define":"deliverstatus","name":"deliverstatus","relation":"deliverstatus","type":"String"},"detailcount":{"define":"detailcount","name":"detailcount","relation":"detailcount","type":"String"},"discount":{"define":"discount","name":"discount","relation":"discount","type":"String"},"district":{"define":"district","name":"district","relation":"district","type":"String"},"frontuuid":{"define":"frontuuid","name":"frontuuid","relation":"frontuuid","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"ordermessage":{"define":"ordermessage","name":"ordermessage","relation":"ordermessage","type":"String"},"ordernumber":{"define":"ordernumber","name":"ordernumber","relation":"ordernumber","type":"String"},"orderstatus":{"define":"orderstatus","name":"orderstatus","relation":"orderstatus","type":"String"},"owerprofit":{"define":"owerprofit","name":"owerprofit","relation":"owerprofit","type":"String"},"payprice":{"define":"payprice","name":"payprice","relation":"payprice","type":"String"},"paystatus":{"define":"paystatus","name":"paystatus","relation":"paystatus","type":"String"},"paysum":{"define":"paysum","name":"paysum","relation":"paysum","type":"String"},"paytime":{"define":"paytime","name":"paytime","relation":"paytime","type":"String"},"province":{"define":"province","name":"province","relation":"province","type":"String"},"receiptstatus":{"define":"receiptstatus","name":"receiptstatus","relation":"receiptstatus","type":"String"},"status":{"define":"status","name":"status","relation":"status","type":"String"},"street":{"define":"street","name":"street","relation":"street","type":"String"},"summary":{"define":"summary","name":"summary","relation":"summary","type":"String"},"user_id":{"define":"user_id","name":"user_id","relation":"user_id","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"orderData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"brand":{"define":"brand","name":"brand","relation":"brand","type":"String"},"cover":{"define":"cover","name":"cover","relation":"cover","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"name":{"define":"name","name":"name","relation":"name","type":"String"},"number":{"define":"number","name":"number","relation":"number","type":"String"},"order_id":{"define":"order_id","name":"order_id","relation":"order_id","type":"String"},"ordermessage":{"define":"ordermessage","name":"ordermessage","relation":"ordermessage","type":"String"},"pack":{"define":"pack","name":"pack","relation":"pack","type":"String"},"price":{"define":"price","name":"price","relation":"price","type":"String"},"product_id":{"define":"product_id","name":"product_id","relation":"product_id","type":"String"},"producttype":{"define":"producttype","name":"producttype","relation":"producttype","type":"String"},"season":{"define":"season","name":"season","relation":"season","type":"String"},"spec":{"define":"spec","name":"spec","relation":"spec","type":"String"},"subtitle":{"define":"subtitle","name":"subtitle","relation":"subtitle","type":"String"},"unit":{"define":"unit","name":"unit","relation":"unit","type":"String"},"weight":{"define":"weight","name":"weight","relation":"weight","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"orderdetailData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"id":{"define":"id","name":"id","relation":"id","type":"String"},"orderdetail_id":{"define":"orderdetail_id","name":"orderdetail_id","relation":"orderdetail_id","type":"String"},"selectcondition_id":{"define":"selectcondition_id","name":"selectcondition_id","relation":"selectcondition_id","type":"String"},"selectcondition_name":{"define":"selectcondition_name","name":"selectcondition_name","relation":"selectcondition_name","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"optionalData"});
 new __Data__(this,{"autoLoad":true,"confirmDelete":true,"confirmRefresh":true,"defCols":{"active":{"define":"active","name":"active","relation":"active","type":"String"},"id":{"define":"id","name":"id","relation":"id","type":"String"},"keywords":{"define":"keywords","name":"keywords","relation":"keywords","type":"String"},"orderdetail_id":{"define":"orderdetail_id","name":"orderdetail_id","relation":"orderdetail_id","type":"String"},"showlable":{"define":"showlable","name":"showlable","relation":"showlable","type":"String"},"summary":{"define":"summary","name":"summary","relation":"summary","type":"String"}},"directDelete":false,"events":{},"idColumn":"id","isMain":false,"limit":20,"xid":"activeData"});
}}); 
return __result;});
