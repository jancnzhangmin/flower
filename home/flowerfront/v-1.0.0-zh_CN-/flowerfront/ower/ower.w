<!DOCTYPE HTML>
<html style="width:100%;height:100%" class="no-js">
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
        <script src="../../system/lib/base/modernizr-2.8.3.min.js"></script>
		<script id="__varReplace">
    	
    	    	window.__justep = window.__justep || {};
				window.__justep.isDebug = false;
				window.__justep.__packageMode = "1";
				window.__justep.__isPackage = true;;
				window.__justep.url = location.href;
				window.__justep.versionInfo = {};
		 
    	</script>
        <script id="__updateVersion">
        
				(function(url, mode){
					if (("@"+"mode@") === mode) mode = "3";
					if (("@"+"versionUrl@") === url) url = "system/service/common/app.j";
					if ((mode!=="1" && (mode!="2") && (mode!="3"))) return;
					var async = (mode=="1");
					var x5Version = "noApp";
					var x5AppAgents = /x5app\/([0-9.]*)/.exec(navigator.userAgent);
					if(x5AppAgents && x5AppAgents.length > 1){
					   	x5Version = x5AppAgents[1] || "";
					} 
					function createXhr(){
						try {	
							return new XMLHttpRequest();
						}catch (tryMS) {	
							var version = ["MSXML2.XMLHttp.6.0",
							               "MSXML2.XMLHttp.3.0",
							               "MSXML2.XMLHttp",
							               "Miscrosoft.XMLHTTP"];
							for(var i = 0; i < version.length; i++){
								try{
							    	return new ActiveXObject(version[i]);
								}catch(e){}
							}
						}
						throw new Error("您的系统或浏览器不支持XHR对象！");
					}
					
					function createGuid(){	
						var guid = '';	
						for (var i = 1; i <= 32; i++){		
							var n = Math.floor(Math.random()*16.0).toString(16);		
							guid += n;		
							if((i==8)||(i==12)||(i==16)||(i==20))			
								guid += '-';	
						}	
						return guid;
					}
					
					function parseUrl(href){
						href = href.split("#")[0];
						var items = href.split("?");
						href = items[0];
						var query = items[1] || "";
						items = href.split("/");
						var baseItems = [];
						var pathItems = [];
						var isPath = false;
						for (var i=0; i<items.length; i++){
							if (mode == "3"){
								if (items[i] && (items[i].indexOf("v_") === 0) 
										&& (items[i].indexOf("l_") !== -1)
										&& (items[i].indexOf("s_") !== -1)
										&& (items[i].indexOf("d_") !== -1)
										|| (items[i]=="v_")){
									isPath = true;
									continue;
								}
							}else{
								if (items[i] && (items[i].indexOf("v-")===0) && (items[i].charAt(items[i].length-1)=="-") ){
									isPath = true;
									continue;
								}
							}
							if (isPath){
								pathItems.push(items[i]);
							}else{
								baseItems.push(items[i]);	
							}
							
						}
						var base = baseItems.join("/");
						if (base.charAt(base.length-1)!=="/") base += "/";
						
						var path = pathItems.join("/");
						if (path.charAt(0) !== "/") path = "/" + path;
						return [base, path, query];
					}
					
					
					var items = parseUrl(window.location.href);
					var base = items[0];
					var path = items[1];
					var query = items[2];
					var xhr = createXhr();
					url += ((url.indexOf("?")!=-1) ? "&" : "?") +"_=" + createGuid();
					if (mode === "3"){
						url += "&url=" + path;
						if (query)
							url += "&" + query;
					}
					xhr.open('GET', base + url, async);
					
					if (async){
						xhr.onreadystatechange=function(){
							if((xhr.readyState == 4) && (xhr.status == 200) && xhr.responseText){
								var versionInfo = JSON.parse(xhr.responseText);
								window.__justep.versionInfo = versionInfo;
								window.__justep.versionInfo.baseUrl = base;
								if (query){
									path = path + "?" + query;
								}
								path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
								var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
								versionInfo.resourceInfo.indexPageURL = indexUrl;
								if(versionInfo.resourceInfo.resourceUpdateMode != "md5"){
									if (window.__justep.url.indexOf(versionInfo.resourceInfo.version) == -1){
										versionInfo.resourceInfo.isNewVersion = true;
									};
								}
							}
						}
					}
					
					try{
						xhr.send(null);
						if (!async && (xhr.status == 200) && xhr.responseText){
							var versionInfo = JSON.parse(xhr.responseText);
							window.__justep.versionInfo = versionInfo;
							window.__justep.versionInfo.baseUrl = base;
							if ((mode==="3") && window.__justep.isDebug){
								/* 模式3且是调试模式不重定向 */
							}else{
								if (query){
									path = path + "?" + query;
								}
								if(versionInfo.resourceInfo.resourceUpdateMode == "md5"){
									path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
									var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
									versionInfo.resourceInfo.indexPageURL = indexUrl; 
								}else if (versionInfo.resourceInfo && versionInfo.resourceInfo.version && (window.__justep.url.indexOf(versionInfo.resourceInfo.version) == -1)){
									path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
									var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
									window.location.href = indexUrl;
								}
							}
						}
					}catch(e2){}
				}("appMetadata_in_server.json", "1"));
                 
        </script>
    <link rel="stylesheet" href="../../system/components/bootstrap.min.css" include="$model/UI2/system/components/bootstrap/lib/css/bootstrap,$model/UI2/system/components/bootstrap/lib/css/bootstrap-theme"><link rel="stylesheet" href="../../system/components/comp.min.css" include="$model/UI2/system/components/justep/lib/css2/dataControl,$model/UI2/system/components/justep/input/css/datePickerPC,$model/UI2/system/components/justep/messageDialog/css/messageDialog,$model/UI2/system/components/justep/lib/css3/round,$model/UI2/system/components/justep/input/css/datePicker,$model/UI2/system/components/justep/row/css/row,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/attachment/css/attachment,$model/UI2/system/components/justep/barcode/css/barcodeImage,$model/UI2/system/components/bootstrap/dropdown/css/dropdown,$model/UI2/system/components/justep/contents/css/contents,$model/UI2/system/components/justep/common/css/forms,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/locker/css/locker,$model/UI2/system/components/justep/menu/css/menu,$model/UI2/system/components/justep/scrollView/css/scrollView,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/dialog/css/dialog,$model/UI2/system/components/justep/bar/css/bar,$model/UI2/system/components/justep/popMenu/css/popMenu,$model/UI2/system/components/justep/lib/css/icons,$model/UI2/system/components/justep/lib/css4/e-commerce,$model/UI2/system/components/justep/toolBar/css/toolBar,$model/UI2/system/components/justep/popOver/css/popOver,$model/UI2/system/components/justep/panel/css/panel,$model/UI2/system/components/bootstrap/carousel/css/carousel,$model/UI2/system/components/justep/wing/css/wing,$model/UI2/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/UI2/system/components/justep/titleBar/css/titleBar,$model/UI2/system/components/justep/lib/css1/linear,$model/UI2/system/components/justep/numberSelect/css/numberList,$model/UI2/system/components/justep/list/css/list,$model/UI2/system/components/justep/dataTables/css/dataTables"><link rel="stylesheet" href="../../system/components/pc.addon.min.css" include="$model/UI2/system/components/justep/pagerBar/css/pagerBar,$model/UI2/system/components/justep/widgets/css/widgets,$model/UI2/system/components/justep/absoluteLayout/css/absoluteLayout,$model/UI2/system/components/justep/pagerLimitSelect/css/pagerLimitSelect,$model/UI2/system/components/justep/cellLayout/css/cellLayout,$model/UI2/system/components/justep/richTextarea/css/richTextarea,$model/UI2/system/components/justep/smartContainer/css/smartContainer"></head>
	
    <body style="width:100%;height:100%;margin: 0;">
        <script intro="none"></script>
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cY7NN7z" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cY7NN7z" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,">
  <style>.topimg.cY7NN7z{background-image: url(../../flowerfront/image/ower_back.png); background-repeat: no-repeat; background-size: 100% 100%; -moz-background-size: 100% 100%} .fronthead.cY7NN7z{border-radius: 50%; width: 50px} .backhead.cY7NN7z{border-radius: 50%; border: solid 1px rgb(255, 255, 255); width: 60px; height: 60px; padding-top: 4px} .angle.cY7NN7z{position: absolute; top: 0px; margin-top: 12px; border: 1px solid rgb(255, 66, 86); font-weight: lighter; font-size: x-small; color: rgb(255, 66, 86); background: rgb(255, 255, 255); -webkit-background-clip: none; -webkit-text-fill-color: rgb(255, 66, 86); border-radius: 10px; padding-left: 6px; padding-right: 6px; padding-top: 2px; padding-bottom: 1px} .btnclass.cY7NN7z{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent} .btnangleBox.cY7NN7z{width: 55px; position: relative} .btnangle.cY7NN7z{position: absolute; top: 5px; right: 0px; border: 1px solid rgb(255, 66, 86); font-weight: lighter; font-size: x-small; color: rgb(255, 66, 86); background: rgb(255, 255, 255); -webkit-background-clip: none; -webkit-text-fill-color: rgb(255, 66, 86); border-radius: 10px; padding-left: 6px; padding-right: 6px; padding-top: 2px; padding-bottom: 1px} .bottom-line.cY7NN7z{border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: rgb(246, 246, 246)}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="cY7NN7z" class="cY7NN7z"></div>  
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcYNn6Vz-iosstatusbar cY7NN7z" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cY7NN7z"> 
    <div class="x-panel-content x-cards cY7NN7z" xid="content1" style="padding-top:0px;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cY7NN7z"> 
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer topimg cY7NN7z" xid="smartContainer1" style="position:relative;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cY7NN7z">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row1" style="z-index:1;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
          <div class="x-col cY7NN7z" xid="col1" __cid="cY7NN7z"></div>  
          <div class="x-col text-center cY7NN7z" xid="col2" __cid="cY7NN7z">
            <span xid="span1" style="font-size:large;color:#FFFFFF;" __cid="cY7NN7z" class="cY7NN7z">个人中心</span>
          </div>  
          <div class="x-col cY7NN7z" xid="col3" __cid="cY7NN7z"></div>
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row2" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
          <div class="x-col x-col-20 text-center cY7NN7z" xid="col4" __cid="cY7NN7z"> 
            <div xid="div1" class="backhead cY7NN7z" __cid="cY7NN7z" data-bind="event:{click:$model._callModelFn.bind($model, 'div1Click')}">
              <img src="../../flowerfront/image/user-192.png" alt="" xid="image1" class="fronthead cY7NN7z" __cid="cY7NN7z">
            </div>
          </div>  
          <div class="x-col cY7NN7z" xid="col5" style="padding:0px;" __cid="cY7NN7z">
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row3" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
              <div class="x-col cY7NN7z" xid="col6" __cid="cY7NN7z">
                <span xid="span2" style="font-size:x-large;color:#FFFFFF;" __cid="cY7NN7z" class="cY7NN7z">风信子</span>
              </div> 
            </div>  
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row4" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
              <div class="x-col cY7NN7z" xid="col9" __cid="cY7NN7z">
                <span xid="span3" style="color:#FFFFFF;" __cid="cY7NN7z" class="cY7NN7z">会员号：</span>  
                <span xid="span4" style="color:#FFFFFF;" __cid="cY7NN7z" class="cY7NN7z">10001</span>
              </div> 
            </div>
          </div> 
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row5" style="bottom:0px;position:absolute;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
          <div class="x-col text-center cY7NN7z" xid="col12" style="padding-right:0px;" __cid="cY7NN7z">
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button1" style="color:#FFFFFF;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-wodeleijishouyi&#34;,&#34;label&#34;:&#34;未入账&#34;}" __cid="cY7NN7z"> 
              <i xid="i1" class="my my-wodeleijishouyi cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
              <span xid="span5" __cid="cY7NN7z" class="cY7NN7z">未入账</span>
              <div xid="div2" class="text-center cY7NN7z" __cid="cY7NN7z"> 
                <label xid="label3" class="angle cY7NN7z" __cid="cY7NN7z">2</label>
              </div>
            </a>  
            <label xid="label1" style="height:40px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:15px;" class="pull-right cY7NN7z" __cid="cY7NN7z"></label> 
          </div>  
          <div class="x-col text-center cY7NN7z" xid="col13" style="padding-left:0px;padding-right:0px;" __cid="cY7NN7z">
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button2" style="color:#FFFFFF;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-shouyi1&#34;,&#34;label&#34;:&#34;收益&#34;}" __cid="cY7NN7z"> 
              <i xid="i2" class="my my-shouyi1 cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
              <span xid="span6" __cid="cY7NN7z" class="cY7NN7z">收益</span>
            </a>  
            <label xid="label2" style="height:40px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:15px;" class="pull-right cY7NN7z" __cid="cY7NN7z"></label>
          </div>  
          <div class="x-col text-center cY7NN7z" xid="col14" style="padding-left:0px;" __cid="cY7NN7z">
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button3" style="color:#FFFFFF;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-daifukuan&#34;,&#34;label&#34;:&#34;提现&#34;}" __cid="cY7NN7z"> 
              <i xid="i3" class="my my-daifukuan cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
              <span xid="span7" __cid="cY7NN7z" class="cY7NN7z">提现</span>
            </a>
          </div>
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cY7NN7z" xid="smartContainer2" style="margin-top:10px;background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cY7NN7z">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row6" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
          <div class="x-col cY7NN7z" xid="col15" style="border-bottom-style:solid;border-bottom-color:#f6f6f6;border-bottom-width:1px;" __cid="cY7NN7z">
            <span xid="span8" style="font-size:medium;" __cid="cY7NN7z" class="cY7NN7z">我的订单</span>
          </div>  
          <div class="x-col text-right cY7NN7z" xid="col16" style="border-bottom-style:solid;border-bottom-color:#f6f6f6;border-bottom-width:1px;" __cid="cY7NN7z">
            <span xid="span9" class="text-muted cY7NN7z" __cid="cY7NN7z">查看全部订单</span>  
            <i xid="i4" class="linear linear-chevronright text-muted cY7NN7z" __cid="cY7NN7z"></i>
          </div> 
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row7" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
          <div class="x-col text-center cY7NN7z" xid="col18" __cid="cY7NN7z"> 
            <div xid="unpaydiv" class="text-center btnangleBox cY7NN7z" __cid="cY7NN7z" data-bind="event:{click:$model._callModelFn.bind($model, 'unpaydivClick')}"> 
              <label xid="unpay_count_lable" class="btnangle cY7NN7z" style="display:none;" __cid="cY7NN7z">0</label>
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="unpaybtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my2 my2-daifukuan1&#34;,&#34;label&#34;:&#34;待侍款&#34;}" __cid="cY7NN7z"> 
                <i xid="i5" class="btnclass my2 my2-daifukuan1 cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
                <span xid="span10" class="text-muted cY7NN7z" __cid="cY7NN7z">待侍款</span>
              </a>
            </div>
          </div>  
          <div class="x-col text-center cY7NN7z" xid="col19" __cid="cY7NN7z">
            <div xid="undeliverdiv" class="text-center btnangleBox cY7NN7z" __cid="cY7NN7z" data-bind="event:{click:$model._callModelFn.bind($model, 'undeliverdivClick')}"> 
              <label xid="undeliver_count_lable" class="btnangle cY7NN7z" __cid="cY7NN7z">0</label>  
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button5" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my2 my2-daifahuo&#34;,&#34;label&#34;:&#34;待发货&#34;}" __cid="cY7NN7z"> 
                <i xid="i6" class="btnclass my2 my2-daifahuo cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
                <span xid="span11" class="text-muted cY7NN7z" __cid="cY7NN7z">待发货</span>
              </a> 
            </div>
          </div>  
          <div class="x-col text-center cY7NN7z" xid="col20" __cid="cY7NN7z">
            <div xid="unreceiptdiv" class="text-center btnangleBox cY7NN7z" __cid="cY7NN7z" data-bind="event:{click:$model._callModelFn.bind($model, 'unreceiptdivClick')}"> 
              <label xid="unreceipt_count_lable" class="btnangle cY7NN7z" __cid="cY7NN7z">0</label>  
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button6" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my2 my2-urbantubiao-&#34;,&#34;label&#34;:&#34;待收货&#34;}" __cid="cY7NN7z"> 
                <i xid="i7" class="btnclass my2 my2-urbantubiao- cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
                <span xid="span12" class="text-muted cY7NN7z" __cid="cY7NN7z">待收货</span>
              </a> 
            </div>
          </div>  
          <div class="x-col text-center cY7NN7z" xid="col21" __cid="cY7NN7z">
            <div xid="uncommentdiv" class="text-center btnangleBox cY7NN7z" __cid="cY7NN7z" data-bind="event:{click:$model._callModelFn.bind($model, 'uncommentdivClick')}"> 
              <label xid="uncomment_count_lable" class="btnangle cY7NN7z" __cid="cY7NN7z">0</label>  
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button7" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my2 my2-daipingjia&#34;,&#34;label&#34;:&#34;待评价&#34;}" __cid="cY7NN7z"> 
                <i xid="i8" class="btnclass my2 my2-daipingjia cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
                <span xid="span13" class="text-muted cY7NN7z" __cid="cY7NN7z">待评价</span>
              </a> 
            </div>
          </div>  
          <div class="x-col text-center cY7NN7z" xid="col22" __cid="cY7NN7z">
            <div xid="div7" class="text-center btnangleBox cY7NN7z" __cid="cY7NN7z"> 
              <label xid="label8" class="btnangle cY7NN7z" style="display:none;" __cid="cY7NN7z">12</label>  
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cY7NN7z" xid="button8" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my2 my2-shouhou&#34;,&#34;label&#34;:&#34;售后&#34;}" __cid="cY7NN7z"> 
                <i xid="i9" class="btnclass my2 my2-shouhou cY7NN7z" style="font-size:xx-large;" __cid="cY7NN7z"></i>  
                <span xid="span14" class="text-muted cY7NN7z" __cid="cY7NN7z">售后</span>
              </a> 
            </div>
          </div>
        </div>
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cY7NN7z" xid="smartContainer3" style="background-color:white;margin-top:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cY7NN7z">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row8" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cY7NN7z"> 
          <div class="x-col x-col-fixed cY7NN7z" xid="col7" style="width:40px;padding-top:11px;padding-left:10px;" __cid="cY7NN7z">
            <i xid="i10" class="my my-yemiantuiguang btnclass cY7NN7z" style="font-size:x-large;" __cid="cY7NN7z"></i>
          </div>  
          <div class="x-col bottom-line cY7NN7z" xid="col8" style="padding-top:11px;padding-bottom:10px;" __cid="cY7NN7z">
            <span xid="span15" style="font-size:medium;" __cid="cY7NN7z" class="cY7NN7z">我的分销</span>
          </div>  
          <div class="x-col text-right bottom-line cY7NN7z" xid="col10" style="padding-top:13px;padding-right:10px;" __cid="cY7NN7z">
            <i xid="i11" class="linear linear-chevronright text-muted cY7NN7z" __cid="cY7NN7z"></i>
          </div>
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row9" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},event:{click:$model._callModelFn.bind($model, 'row9Click')}" __cid="cY7NN7z"> 
          <div class="x-col x-col-fixed cY7NN7z" xid="col23" style="width:40px;padding-top:14px;padding-left:10px;" __cid="cY7NN7z"> 
            <i xid="i13" class="my my-xinxingshi btnclass cY7NN7z" style="font-size:x-large;" __cid="cY7NN7z"></i>
          </div>  
          <div class="x-col bottom-line cY7NN7z" xid="col11" style="padding-top:14px;padding-bottom:10px;" __cid="cY7NN7z"> 
            <span xid="span16" style="font-size:medium;" __cid="cY7NN7z" class="cY7NN7z">我的收藏</span>
          </div>  
          <div class="x-col text-right bottom-line cY7NN7z" xid="col17" style="padding-top:16px;padding-right:10px;" __cid="cY7NN7z"> 
            <span xid="span18" style="color:#ff4256;" __cid="cY7NN7z" class="cY7NN7z">0</span>
            <i xid="i12" class="linear linear-chevronright text-muted cY7NN7z" __cid="cY7NN7z"></i> 
          </div> 
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cY7NN7z" xid="row10" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},event:{click:$model._callModelFn.bind($model, 'row10Click')}" __cid="cY7NN7z"> 
          <div class="x-col x-col-fixed cY7NN7z" xid="col25" style="width:40px;padding-top:14px;padding-left:10px;" __cid="cY7NN7z"> 
            <i xid="i14" class="my my-shouhuodizhi1 btnclass cY7NN7z" style="font-size:x-large;" __cid="cY7NN7z"></i>
          </div>  
          <div class="x-col bottom-line cY7NN7z" xid="col26" style="padding-top:14px;padding-bottom:10px;" __cid="cY7NN7z"> 
            <span xid="span17" style="font-size:medium;" __cid="cY7NN7z" class="cY7NN7z">收货地址</span>
          </div>  
          <div class="x-col text-right bottom-line cY7NN7z" xid="col24" style="padding-top:16px;padding-right:10px;" __cid="cY7NN7z"> 
            <i xid="i15" class="linear linear-chevronright text-muted cY7NN7z" __cid="cY7NN7z"></i>
          </div> 
        </div>
      </div>
    </div>  
    <style __cid="cY7NN7z" class="cY7NN7z">.x-panel.pcYNn6Vz-iosstatusbar >.x-panel-top {height: 0px;}.x-panel.pcYNn6Vz-iosstatusbar >.x-panel-content { top: 0px;bottom: nullpx;}.x-panel.pcYNn6Vz-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcYNn6Vz-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcYNn6Vz-iosstatusbar >.x-panel-top {height: 0px;}.iosstatusbar .x-panel.pcYNn6Vz-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcYNn6Vz-iosstatusbar >.x-panel-content { top: 0px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcYNn6Vz-iosstatusbar >.x-panel-top {height: 0px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcYNn6Vz-iosstatusbar >.x-panel-content {top: 0px;}</style>
  </div> 
</div></div>
        
        <div id="downloadGCF" style="display:none;padding:50px;">
        	<span>您使用的浏览器需要下载插件才能使用, </span>
        	<a id="downloadGCFLink" href="#">下载地址</a>
        	<p>(安装后请重新打开浏览器)</p>
        </div>
    	<script>
    	
    	            //判断浏览器, 判断GCF
    	 			var browser = {
    			        isIe: function () {
    			            return navigator.appVersion.indexOf("MSIE") != -1;
    			        },
    			        navigator: navigator.appVersion,
    			        getVersion: function() {
    			            var version = 999; // we assume a sane browser
    			            if (navigator.appVersion.indexOf("MSIE") != -1)
    			                // bah, IE again, lets downgrade version number
    			                version = parseFloat(navigator.appVersion.split("MSIE")[1]);
    			            return version;
    			        }
    			    };
    				function isGCFInstalled(){
    			      try{
    			        var i = new ActiveXObject('ChromeTab.ChromeFrame');
    			        if (i) {
    			          return true;
    			        }
    			      }catch(e){}
    			      return false;
    				}
    	            //判断浏览器, 判断GCF
    	            var __continueRun = true;
    				if (browser.isIe() && (browser.getVersion() < 10) && !isGCFInstalled()) {
    					document.getElementById("applicationHost").style.display = 'none';
    					document.getElementById("downloadGCF").style.display = 'block';
    					var downloadLink = "/" + location.pathname.match(/[^\/]+/)[0] + "/v8.msi";
    					document.getElementById("downloadGCFLink").href = downloadLink; 
    					__continueRun = false;
    	            }
		 	
    	</script>
        
        <script id="_requireJS" src="../../system/lib/require/require.2.1.10.js"> </script>
        <script src="../../system/core.min.js"></script><script src="../../system/common.min.js"></script><script src="../../system/components/comp.min.js"></script><script src="../../system/components/pc.addon.min.js"></script><script id="_mainScript">
        
			if (__continueRun) {
                window.__justep.cssReady = function(fn){
                	var promises = [];
                	for (var p in window.__justep.__ResourceEngine.__loadingCss){
                		if(window.__justep.__ResourceEngine.__loadingCss.hasOwnProperty(p))
                			promises.push(window.__justep.__ResourceEngine.__loadingCss[p].promise());
                	}
                	$.when.apply($, promises).done(fn);
                };
                
            	window.__justep.__ResourceEngine = {
            		readyRegExp : navigator.platform === 'PLAYSTATION 3' ? /^complete$/ : /^(complete|loaded)$/,
            		url: window.location.href,	
            		/*contextPath: 不包括语言 */
            		contextPath: "",
            		serverPath: "",
            		__loadedJS: [],
            		__loadingCss: {},
            		onLoadCss: function(url, node){
            			if (!this.__loadingCss[url]){
            				this.__loadingCss[url] = $.Deferred();	
                			if (node.attachEvent &&
                                    !(node.attachEvent.toString && node.attachEvent.toString().indexOf('[native code') < 0) &&
                                    !(typeof opera !== 'undefined' && opera.toString() === '[object Opera]')) {
                                node.attachEvent('onreadystatechange', this.onLinkLoad.bind(this));
                            } else {
                                node.addEventListener('load', this.onLinkLoad.bind(this), false);
                                node.addEventListener('error', this.onLinkError.bind(this), false);
                            }
            			}
            		},
            		
            		onLinkLoad: function(evt){
            	        var target = (evt.currentTarget || evt.srcElement);
            	        if (evt.type === 'load' ||
                                (this.readyRegExp.test(target.readyState))) {
            	        	var url = target.getAttribute("href");
            	        	if (url && window.__justep.__ResourceEngine.__loadingCss[url]){
            	        		window.__justep.__ResourceEngine.__loadingCss[url].resolve(url);
            	        	}
                        }
            		},
            		
            		onLinkError: function(evt){
            	        var target = (evt.currentTarget || evt.srcElement);
        	        	var url = target.getAttribute("href");
        	        	if (url && window.__justep.__ResourceEngine.__loadingCss[url]){
        	        		window.__justep.__ResourceEngine.__loadingCss[url].resolve(url);
        	        	}
            		},
            		
            		initContextPath: function(){
            			var baseURL = document.getElementById("_requireJS").src;
            			var before = location.protocol + "//" + location.host;
            			var after = "/system/lib/require/require.2.1.10";
            			var i = baseURL.indexOf(after);
            			if (i !== -1){
    	        			var middle = baseURL.substring(before.length, i);
    						var items = middle.split("/");
    						
    						
    						if ((items[items.length-1].indexOf("v_") === 0) 
    								&& (items[items.length-1].indexOf("l_") !== -1)
    								&& (items[items.length-1].indexOf("s_") !== -1)
    								&& (items[items.length-1].indexOf("d_") !== -1)
    								|| (items[items.length-1]=="v_")){
    							items.splice(items.length-1, 1);
    						}
    						
    						
    						if (items.length !== 1){
    							window.__justep.__ResourceEngine.contextPath = items.join("/");
    						}else{
    							window.__justep.__ResourceEngine.contextPath = before;
    						}
    						var index = window.__justep.__ResourceEngine.contextPath.lastIndexOf("/");
    						if (index != -1){
    							window.__justep.__ResourceEngine.serverPath = window.__justep.__ResourceEngine.contextPath.substr(0, index);
    						}else{
    							window.__justep.__ResourceEngine.serverPath = window.__justep.__ResourceEngine.contextPath;
    						}
            			}else{
            				throw new Error(baseURL + " hasn't  " + after);
            			}
            		},
            	
            		loadJs: function(urls){
            			if (urls && urls.length>0){
            				var loadeds = this._getResources("script", "src").concat(this.__loadedJS);
    	       				for (var i=0; i<urls.length; i++){
								var url = urls[i];
    	        				if(!this._isLoaded(url, loadeds)){
    	        					this.__loadedJS[this.__loadedJS.length] = url;
    	        					/*
    	        					var script = document.createElement("script");
    	        					script.src = url;
    	        					document.head.appendChild(script);
    	        					*/
    	        					//$("head").append("<script  src='" + url + "'/>");
									var url = require.toUrl("$UI" + url);
    	        					$.ajax({
    	        						url: url,
    	        						dataType: "script",
    	        						cache: true,
    	        						async: false,
    	        						success: function(){}
    	        						});
    	        				} 
    	       				}
            			}
            		},
            		
            		loadCss: function(styles){
           				var loadeds = this._getResources("link", "href");
            			if (styles && styles.length>0){
            				for (var i=0; i<styles.length; i++){
    	       					var url = window.__justep.__ResourceEngine.contextPath + styles[i].url.replace("/UI2/", "/");
    	        				if(!this._isLoaded(url, loadeds)){
    	        					var include = styles[i].include || "";
    	        					var link = $("<link type='text/css' rel='stylesheet' href='" + url + "' include='" + include + "'/>");
    	        					this.onLoadCss(url, link[0]);
    	        					$("head").append(link);
    	        				} 
            				}
            			}
            			
            		},
            		
            		
            		_isLoaded: function(url, loadeds){
            			if (url){
            				var newUrl = "";
            				var items = url.split("/");
            				var isVls = false;
            				for (var i=0; i<items.length; i++){
            					if (isVls){
                					newUrl += "/" + items[i];
            					}else{
                					if (items[i] && (items[i].indexOf("v_")===0)
            								&& (items[i].indexOf("l_")!==-1)
            								&& (items[i].indexOf("s_")!==-1)
            								&& (items[i].indexOf("d_")!==-1)
            								|| (items[i]=="v_")){
                						isVls = true;
                					}
            					}
            				}
            				if (!newUrl)
            					newUrl = url;
            				
            				for (var i=0; i<loadeds.length; i++){
								var originUrl = this._getOriginUrl(loadeds[i]);
								if (originUrl && (originUrl.indexOf(newUrl)!==-1)){
									return true;
								}
    						}
            			}
    					return false;
            		},

					_getOriginUrl: function(url){
						var result = "";
						if (url && (url.indexOf(".md5_")!==-1)){
							url = url.split("#")[0];
							url = url.split("?")[0];
							var items = url.split(".");
							for (var i=0; i<items.length; i++){
								if ((i===items.length-2) && (items[i].indexOf("md5_")!==-1)){
									continue;
								}else{
									if (i>0) result += ".";
									result += items[i];
								}
							}
						}else{
							result = url;
						}
						return result;
					},
            		
            		_getResources: function(tag, attr){
    					var result = [];
    					var scripts = $(tag);
    					for (var i=0; i<scripts.length; i++){
    						var v = scripts[i][attr];
    						if (v){
    							result[result.length] = v;
    						}
    					}
    					return result;
            		}
            	};
            	
            	window.__justep.__ResourceEngine.initContextPath();
    			requirejs.config({
    				baseUrl: window.__justep.__ResourceEngine.contextPath + '/flowerfront/ower',
    			    paths: {
    			    	/* 解决require.normalizeName与require.toUrl嵌套后不一致的bug   */
    			    	'$model/UI2/v_': window.__justep.__ResourceEngine.contextPath + '',
    			    	'$model/UI2': window.__justep.__ResourceEngine.contextPath + '',
    			    	'$model': window.__justep.__ResourceEngine.serverPath,
    			        'text': window.__justep.__ResourceEngine.contextPath + '/system/lib/require/text.2.0.10',
    			        'bind': window.__justep.__ResourceEngine.contextPath + '/system/lib/bind/bind',
    			        'jquery': window.__justep.__ResourceEngine.contextPath + '/system/lib/jquery/jquery-1.11.1.min'
    			    },
    			    map: {
    				        '*': {
    				            res: '$model/UI2/system/lib/require/res',
    				            service: '$model/UI2/system/lib/require/service',
    				            cordova: '$model/UI2/system/lib/require/cordova',
    				            w: '$model/UI2/system/lib/require/w',
    				            css: '$model/UI2/system/lib/require/css'
    				        }
    				},
    				waitSeconds: 300
    			});
    			
    			requirejs(['require', 'jquery', '$model/UI2/system/lib/base/composition', '$model/UI2/system/lib/base/url', '$model/UI2/system/lib/route/hashbangParser', '$model/UI2/system/components/justep/versionChecker/versionChecker', '$model/UI2/system/components/justep/loadingBar/loadingBar', '$model/UI2/system/lib/jquery/domEvent',  '$model/UI2/system/lib/cordova/cordova'],  function (require, $, composition, URL, HashbangParser,versionChecker) { 
    				document.addEventListener('deviceready', function() {
    	                if (navigator && navigator.splashscreen && navigator.splashscreen.hide) {
    	                	/*延迟隐藏，视觉效果更理想*/
    	                	setTimeout(function() {navigator.splashscreen.hide();}, 800);
    	                }
    	            }, false);
					setTimeout(function(){
						versionChecker.check();
					},2000);
    				var context = {};
    				context.model = '$model/UI2/flowerfront/ower/ower.w' + (document.location.search || "");
    				context.view = $('#applicationHost').children()[0];
    				var element = document.getElementById('applicationHost');

					    				
    				
    				var ownerid = new URL(window.__justep.__ResourceEngine.url).getParam("$ownerid");
    				var pwindow = opener;
    				if (!pwindow && window.parent && window.parent.window){
    					pwindow = window.parent.window;
    				}
    				if(ownerid && pwindow 
    						&& pwindow.__justep && pwindow.__justep.windowOpeners
    						&& pwindow.__justep.windowOpeners[ownerid]
    						&& $.isFunction(pwindow.__justep.windowOpeners[ownerid].sendToWindow)){
    					window.__justep.setParams = function(params){
    						/* 给windowOpener提供再次传参数的接口  */
    						params = params || {};
    						composition.setParams(document.getElementById('applicationHost'), params);
    					};
    					var winOpener = pwindow.__justep.windowOpeners[ownerid];
    					if(winOpener) winOpener.window = window;
    					$(window).unload(function(event){
    						if(winOpener && winOpener.dispatchCloseEvent) winOpener.dispatchCloseEvent();
    					});
    					var params = winOpener.sendToWindow();
						context.owner = winOpener;
						context.params = params || {};
	        			composition.compose(element, context);
    				}else{
        				var params =  {};
    					var state = new HashbangParser(window.location.hash).parse().__state;
    					if (state){
    						params = state.get("");
    						try{
    							params = JSON.parse(params);
    							if (params.hasOwnProperty("__singleValue__")){
    								params = params.__singleValue__;
    							}
    						}catch(e1){}
    					}
    					context.noUpdateState = true;
        				context.params = params;
        				composition.compose(element, context);
    				}
    			});    
            }
		 	
        </script>
    </body>
</html>