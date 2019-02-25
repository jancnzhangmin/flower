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
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cf2iuye" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cf2iuye" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/menu/menu,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/panel/panel,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/popMenu/popMenu,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/button/buttonGroup,">
  <style>.x-flower.btn-group.cf2iuye{background-color: transparent; border-top: 0} .x-flower.btn-group.cf2iuye .btn.cf2iuye{border-top: 0; height: 45px; border-color: transparent} .x-flower.btn-group.cf2iuye .btn.cf2iuye span.cf2iuye{font-size: 14px; font-weight: normal; color: rgb(153, 153, 153)} .x-card.btn-group.cf2iuye .btn.active.cf2iuye{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; border-bottom: 1px solid rgb(255, 66, 86)} .x-popOver-content.cf2iuye{bottom: 0px !important} .smartradius.cf2iuye{border-radius: 10px 10px 0px 0px} .noselect.cf2iuye{padding: 10px; background: rgb(245, 245, 245); color: rgb(0, 0, 0); border-radius: 8px} .hasselect.cf2iuye{padding: 10px; color: rgb(254, 46, 35); border-radius: 8px} .movefont.cf2iuye{color: rgb(246, 246, 246)} .moveback.cf2iuye{width: 35px; height: 35px; background: rgba(85, 85, 85, 0.65); position: relative; border-radius: 50%; margin-top: -38px; padding: 9px; padding-left: 12px} .popback.cf2iuye{background: rgba(85, 85, 85, 0.65)} .addbtn.cf2iuye{background: transparent; border-radius: 50%; border: 1px solid rgb(255, 66, 86); color: rgb(255, 66, 86); padding: 2px; padding-left: 5px; padding-right: 5px} .surebtn.cf2iuye{border-radius: 18px; border: 0px; background: linear-gradient(to right, rgb(255, 108, 160), rgb(255, 66, 86))} .popaddcar.cf2iuye{border-radius: 18px 0px 0px 18px; border: 0px; background: linear-gradient(to right, rgb(255, 203, 122), rgb(255, 156, 80))} .popbuy.cf2iuye{border-radius: 0px 18px 18px 0px; border: 0px; background: linear-gradient(to right, rgb(255, 108, 160), rgb(255, 66, 86))}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad;onParamsReceive:modelParamsReceive" __cid="cf2iuye" class="cf2iuye"></div>  
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcvMvymu-iosstatusbar cf2iuye" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'},event:{touchend:$model._callModelFn.bind($model, 'panel1Touchend')}" __cid="cf2iuye"> 
    <div class="x-panel-top cf2iuye" xid="top1" style="z-index:10;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cf2iuye"> 
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row1" style="padding:0px;background-color:white;opacity:0;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
        <div class="x-col x-col-fixed cf2iuye" xid="col1" style="padding:0px;width:50px;padding-top:5px;" __cid="cf2iuye"></div>  
        <div class="x-col cf2iuye" xid="col2" style="padding:0px;" __cid="cf2iuye">
          <div component="$model/UI2/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower cf2iuye" xid="buttonGroup1" data-bind="component:{name:'$model/UI2/system/components/justep/button/buttonGroup'}" data-config="{&#34;tabbed&#34;:true}" __cid="cf2iuye"> 
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cf2iuye" xid="button2" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:button2Click" data-config="{&#34;label&#34;:&#34;产品&#34;}" __cid="cf2iuye"> 
              <i xid="i2" __cid="cf2iuye" class="cf2iuye"></i>  
              <span xid="span2" __cid="cf2iuye" class="cf2iuye">产品</span>
            </a>  
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cf2iuye" xid="button3" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:button3Click" data-config="{&#34;label&#34;:&#34;详情&#34;}" __cid="cf2iuye"> 
              <i xid="i3" __cid="cf2iuye" class="cf2iuye"></i>  
              <span xid="span3" __cid="cf2iuye" class="cf2iuye">详情</span>
            </a>  
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cf2iuye" xid="button5" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;评价&#34;}" __cid="cf2iuye"> 
              <i xid="i5" __cid="cf2iuye" class="cf2iuye"></i>  
              <span xid="span5" __cid="cf2iuye" class="cf2iuye">评价</span>
            </a>  
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cf2iuye" xid="button6" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;推荐&#34;}" __cid="cf2iuye"> 
              <i xid="i6" __cid="cf2iuye" class="cf2iuye"></i>  
              <span xid="span6" __cid="cf2iuye" class="cf2iuye">推荐</span>
            </a>
          </div>
        </div>  
        <div class="x-col x-col-fixed cf2iuye" xid="col3" style="width:50px;padding-top:6px;" __cid="cf2iuye"></div>
      </div>  
      <div xid="div15" class="moveback cf2iuye" style="margin-left:8px;" __cid="cf2iuye" data-bind="event:{click:$model._callModelFn.bind($model, {operation:'window.close'})}">
        <i xid="i16" class="icon-chevron-left cf2iuye" style="color:#f0f0f0;font-size:medium;" __cid="cf2iuye" data-bind="event:{click:$model._callModelFn.bind($model, {operation:'window.close'})}"></i>
      </div>  
      <div xid="div12" class="moveback pull-right cf2iuye" style="margin-top:-34px;margin-right:8px;padding-left:8px;" __cid="cf2iuye">
        <i xid="i1" class="my my-ziyuan cf2iuye" style="color:#f0f0f0;font-size:medium;" __cid="cf2iuye" data-bind="event:{click:$model._callModelFn.bind($model, 'i1Click')}"></i>
      </div>
    </div>  
    <div class="x-panel-content x-cards cf2iuye" xid="content1" style="padding-top:0px;margin-top:-45px;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'},event:{touchmove:$model._callModelFn.bind($model, 'content1Touchmove'),touchend:$model._callModelFn.bind($model, 'content1Touchend')}" __cid="cf2iuye">
      <a xid="a1" name="product" __cid="cf2iuye" class="cf2iuye"></a>
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cf2iuye" xid="productSmartContainer" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cf2iuye">
        <div xid="div1" class="swiper-container cf2iuye" __cid="cf2iuye">
          <div xid="div2" class="swiper-wrapper cf2iuye" __cid="cf2iuye"></div>
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row2" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col x-col-fixed cf2iuye" xid="col4" style="width:110px;" __cid="cf2iuye"> 
            <div xid="div3" style="margin-left:-5px;" __cid="cf2iuye" class="cf2iuye">
              <span xid="span7" style="color:#fe2e23;font-size:x-large;" __cid="cf2iuye" class="cf2iuye" data-bind="text:'￥' + $model.productData.val(&#34;price&#34;),visible:$model.productData.val(&#34;price&#34;) != undefined"></span>
            </div>  
            <div xid="div4" style="margin-top:-5px;" __cid="cf2iuye" class="cf2iuye" data-bind="visible:$model.productData.val(&#34;discount&#34;) &gt; 0">
              <span xid="span9" style="font-size:small;" class="text-muted cf2iuye" __cid="cf2iuye">价格</span>  
              <span xid="span10" class="text-muted cf2iuye" style="text-decoration:line-through ;" __cid="cf2iuye" data-bind="text:'￥' + (parseFloat($model.productData.val(&#34;price&#34;)) + parseFloat($model.productData.val(&#34;discount&#34;)))"></span>
            </div>
          </div>  
          <div class="x-col cf2iuye" xid="col6" style="padding-top:12px;" __cid="cf2iuye">
            <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activetypeData&#34;}" __cid="cf2iuye"> 
              <ul class="x-list-template hide cf2iuye" xid="listTemplateUl1" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
                <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;active&#34;)"></span>
              </ul> 
            </div>
          </div>
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row3" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col9" __cid="cf2iuye">
            <span xid="span11" style="font-size:medium;" __cid="cf2iuye" class="cf2iuye" data-bind="text:$model.productData.val(&#34;name&#34;)"></span>
          </div>
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row4" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col10" __cid="cf2iuye">
            <span xid="span12" class="text-muted cf2iuye" __cid="cf2iuye" data-bind="text:'重量：' + $model.productData.val(&#34;weight&#34;)"></span>
          </div>  
          <div class="x-col text-center cf2iuye" xid="col11" __cid="cf2iuye" data-bind="event:{click:$model._callModelFn.bind($model, 'col11Click')}">
            <span xid="span13" class="text-muted cf2iuye" __cid="cf2iuye">快递：免邮</span>  
            <i xid="i7" class="icon-ios7-help-outline text-muted cf2iuye" style="font-size:medium;" __cid="cf2iuye"></i>
          </div>  
          <div class="x-col text-right cf2iuye" xid="col12" __cid="cf2iuye">
            <span xid="span14" class="text-muted cf2iuye" __cid="cf2iuye">已售：100件</span>
          </div>
        </div>  
        <div xid="div5" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;margin-left:10px;" __cid="cf2iuye" class="cf2iuye"></div>
        <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list2" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activetypeData&#34;}" __cid="cf2iuye"> 
          <ul class="x-list-template hide cf2iuye" xid="listTemplateUl2" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list2($element),afterRender:$model.foreach_afterRender_list2.bind($model,$element)}"> 
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row5" style="padding-top:0px;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
              <div class="x-col x-col-fixed cf2iuye" xid="col13" style="width:20px;" __cid="cf2iuye">
                <i xid="i8" style="color:#ff4256;" __cid="cf2iuye" class="cf2iuye" data-bind="css:val(&#34;icon&#34;)"></i>
              </div>  
              <div class="x-col cf2iuye" xid="col15" __cid="cf2iuye">
                <span xid="span15" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;summary&#34;)"></span>
              </div>
            </div>
          </ul> 
        </div>  
        <div xid="div6" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;margin-left:10px;" __cid="cf2iuye" class="cf2iuye"></div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row6" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col5" __cid="cf2iuye">
            <span xid="span16" class="text-muted cf2iuye" __cid="cf2iuye">品牌：</span>
            <span xid="span8" __cid="cf2iuye" class="cf2iuye" data-bind="text:$model.productData.val(&#34;brand&#34;)"></span> 
          </div>  
          <div class="x-col text-right cf2iuye" xid="col7" __cid="cf2iuye">
            <span xid="span17" class="text-muted cf2iuye" __cid="cf2iuye">包装种类：</span>  
            <span xid="span18" __cid="cf2iuye" class="cf2iuye" data-bind="text:$model.productData.val(&#34;pack&#34;)"></span>
          </div> 
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row7" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col16" __cid="cf2iuye"> 
            <span xid="span22" class="text-muted cf2iuye" __cid="cf2iuye">规格：</span>  
            <span xid="span21" __cid="cf2iuye" class="cf2iuye" data-bind="text:$model.productData.val(&#34;spec&#34;)"></span>
          </div>  
          <div class="x-col text-right cf2iuye" xid="col14" __cid="cf2iuye"> 
            <span xid="span20" class="text-muted cf2iuye" __cid="cf2iuye">适合季节：</span>  
            <span xid="span19" __cid="cf2iuye" class="cf2iuye" data-bind="text:$model.productData.val(&#34;season&#34;)"></span>
          </div> 
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="chooserow" style="margin-top:10px;background-color:white;padding-top:10px;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},event:{click:$model._callModelFn.bind($model, 'chooserowClick')}" __cid="cf2iuye"> 
        <div class="x-col x-col-fixed cf2iuye" xid="col17" style="width:45px;" __cid="cf2iuye">
          <span xid="span23" class="text-muted cf2iuye" __cid="cf2iuye">选择</span>
        </div>  
        <div class="x-col cf2iuye" xid="col19" __cid="cf2iuye">
          <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list3" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;}" __cid="cf2iuye"> 
            <ul class="x-list-template hide cf2iuye" xid="listTemplateUl3" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list3($element),afterRender:$model.foreach_afterRender_list3.bind($model,$element)}"> 
              <span xid="span25" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;selectcondition_name&#34;)"></span>
            </ul> 
          </div>
        </div>  
        <div class="x-col x-col-fixed text-right cf2iuye" xid="col20" style="width:20px;" __cid="cf2iuye">
          <i xid="i9" class="linear linear-chevronright text-muted cf2iuye" __cid="cf2iuye"></i>
        </div>
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cf2iuye" xid="smartContainer2" style="background-color:white;margin-top:10px;padding-bottom:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cf2iuye">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row11" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col29" __cid="cf2iuye"> 
            <span xid="span36" __cid="cf2iuye" class="cf2iuye">买家相册(10)</span>
          </div>  
          <div class="x-col cf2iuye" xid="col30" __cid="cf2iuye"></div>  
          <div class="x-col text-right cf2iuye" xid="col31" style="padding-right:0px;" __cid="cf2iuye">
            <span xid="span38" style="color:#ff4256;" __cid="cf2iuye" class="cf2iuye">查看全部</span>  
            <i xid="i14" class="linear linear-chevronright cf2iuye" style="color:#ff4256;" __cid="cf2iuye"></i>
          </div>
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row12" style="padding:0px;padding-left:9px;padding-right:9px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col32" style="padding:1px;border-radius: 10px 0px 0px 10px;overflow: hidden;" __cid="cf2iuye">
            <img src="../../flowerfront/image/p4.png" alt="" xid="image2" style="width:100%;" __cid="cf2iuye" class="cf2iuye">
          </div>  
          <div class="x-col cf2iuye" xid="col33" style="padding:1px;" __cid="cf2iuye">
            <img src="../../flowerfront/image/p6.png" alt="" xid="image3" style="width:100%;" __cid="cf2iuye" class="cf2iuye">
          </div>  
          <div class="x-col cf2iuye" xid="col34" style="padding:1px;" __cid="cf2iuye"> 
            <img src="../../flowerfront/image/p7.png" alt="" xid="image4" style="width:100%;" __cid="cf2iuye" class="cf2iuye">
          </div>
          <div class="x-col cf2iuye" xid="col35" style="padding:1px;border-radius: 0px 10px 10px 0px;overflow: hidden;" __cid="cf2iuye">
            <img src="../../flowerfront/image/p10.png" alt="" xid="image5" style="width:100%;" __cid="cf2iuye" class="cf2iuye">
          </div>
        </div>
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row13" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
        <div class="x-col cf2iuye" xid="col36" __cid="cf2iuye">
          <span xid="span40" __cid="cf2iuye" class="cf2iuye"></span>
        </div>  
        <div class="x-col text-center cf2iuye" xid="col37" __cid="cf2iuye">
          <span xid="span39" class="text-muted cf2iuye" __cid="cf2iuye">商品详情</span>
        </div>  
        <div class="x-col cf2iuye" xid="col38" __cid="cf2iuye"></div>
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cf2iuye" xid="smartContainer3" style="background-color:white;padding:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cf2iuye">
        <div xid="contentdiv" __cid="cf2iuye" class="cf2iuye"></div>
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cf2iuye" xid="explain_smartContainer" style="background-color:white;margin-top:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cf2iuye">
        <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list7" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;explainData&#34;}" __cid="cf2iuye"> 
          <ul class="x-list-template hide cf2iuye" xid="listTemplateUl7" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list7($element),afterRender:$model.foreach_afterRender_list7.bind($model,$element)}"> 
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row14" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
              <div class="x-col cf2iuye" xid="col27" __cid="cf2iuye">
                <span xid="span1" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;name&#34;)"></span>
              </div> 
            </div>
            <div xid="explain_div" style="padding:10px;" __cid="cf2iuye" class="cf2iuye" data-bind="html:val(&#34;explain&#34;)"></div>
          </ul> 
        </div>
      </div>
    </div>  
    <div class="x-panel-bottom cf2iuye" xid="bottom1" style="border-top-style:solid;border-top-width:1px;border-top-color:#f6f6f6;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" data-config="{&#34;height&#34;:50}" __cid="cf2iuye">
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row9" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
        <div class="x-col x-col-20 text-center cf2iuye" xid="col21" style="padding:0px;" __cid="cf2iuye">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cf2iuye" xid="button7" style="font-size:small;color:#555555;margin-top:-8px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-shouhou1&#34;,&#34;label&#34;:&#34;客服&#34;}" __cid="cf2iuye"> 
            <i xid="i10" class="my my-shouhou1 cf2iuye" style="font-size:x-large;color:#fe2e23;" __cid="cf2iuye"></i>  
            <span xid="span27" __cid="cf2iuye" class="cf2iuye">客服</span>
          </a>  
          <label xid="label1" style="height:30px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:10px;" class="pull-right cf2iuye" __cid="cf2iuye"></label>
        </div>  
        <div class="x-col x-col-20 text-center cf2iuye" xid="col22" style="padding:0px;" __cid="cf2iuye">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-icon-top cf2iuye" xid="collectionBtn" style="font-size:small;color:#555555;margin-top:-8px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:collectionBtnClick" data-config="{&#34;icon&#34;:&#34;my my-xinxingxian&#34;,&#34;label&#34;:&#34;收藏&#34;}" __cid="cf2iuye"> 
            <i xid="i11" class="my my-xinxingxian cf2iuye" style="font-size:x-large;color:#fe2e23;" __cid="cf2iuye"></i>  
            <span xid="span28" __cid="cf2iuye" class="cf2iuye">收藏</span>
          </a>
        </div>  
        <div class="x-col text-center cf2iuye" xid="col23" style="background: linear-gradient(to bottom,#ffcb7a,#ff9c50);padding:0px;padding-top:13px;" __cid="cf2iuye" data-bind="event:{click:$model._callModelFn.bind($model, 'col23Click')}">
          <span xid="span29" style="color:#FFFFFF;font-size:medium;" __cid="cf2iuye" class="cf2iuye">加入购物车</span>
        </div>  
        <div class="x-col text-center cf2iuye" xid="col24" style="background: linear-gradient(to bottom,#ff6ca0,#ff4256);padding:0px;padding-top:13px;" __cid="cf2iuye" data-bind="event:{click:$model._callModelFn.bind($model, 'col24Click')}">
          <span xid="span30" style="color:#FFFFFF;font-size:medium;" __cid="cf2iuye" class="cf2iuye">立即购买</span>
        </div>
      </div>
    </div>
    <style __cid="cf2iuye" class="cf2iuye">.x-panel.pcvMvymu-iosstatusbar >.x-panel-top {height: 45px;}.x-panel.pcvMvymu-iosstatusbar >.x-panel-content { top: 45px;bottom: 50px;}.x-panel.pcvMvymu-iosstatusbar >.x-panel-bottom {height: 50px;}.iosstatusbar .x-panel.pcvMvymu-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcvMvymu-iosstatusbar >.x-panel-top {height: 65px;}.iosstatusbar .x-panel.pcvMvymu-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcvMvymu-iosstatusbar >.x-panel-content { top: 65px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcvMvymu-iosstatusbar >.x-panel-top {height: 45px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcvMvymu-iosstatusbar >.x-panel-content {top: 45px;}</style>
  </div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver cf2iuye" xid="choosepop" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;position&#34;:&#34;bottom&#34;}" __cid="cf2iuye"> 
    <div class="x-popOver-overlay cf2iuye" xid="div7" __cid="cf2iuye"></div>  
    <div class="x-popOver-content cf2iuye" xid="div8" style="height:70%;" __cid="cf2iuye">
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer smartradius cf2iuye" xid="smartContainer1" style="background-color:white;height:100%;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cf2iuye">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row8" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col x-col-33 cf2iuye" xid="col8" __cid="cf2iuye">
            <img src=" " alt="" xid="image1" style="width:100%;" __cid="cf2iuye" class="cf2iuye" data-bind="attr:{src:$model.productData.val(&#34;cover&#34;)}">
          </div>  
          <div class="x-col x-col-bottom cf2iuye" xid="col18" __cid="cf2iuye"> 
            <div xid="div10" __cid="cf2iuye" class="cf2iuye">
              <span xid="span26" style="color:#fe2e23;font-size:x-large;margin-left:-5px;" __cid="cf2iuye" class="cf2iuye" data-bind="text:'￥' + $model.productData.val(&#34;price&#34;)"></span>
            </div>
            <div xid="div11" __cid="cf2iuye" class="cf2iuye"> 
              <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row10" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
                <div class="x-col x-col-fixed cf2iuye" xid="col26" style="padding:0px;width:40px;" __cid="cf2iuye">
                  <span xid="span31" __cid="cf2iuye" class="cf2iuye">选择</span>
                </div>  
                <div class="x-col cf2iuye" xid="col28" style="padding:0px;" __cid="cf2iuye">
                  <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list4" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;}" __cid="cf2iuye"> 
                    <ul class="x-list-template hide cf2iuye" xid="listTemplateUl4" style="margin-bottom:0px;" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list4($element),afterRender:$model.foreach_afterRender_list4.bind($model,$element)}"> 
                      <span xid="span32" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;selectcondition_name&#34;)"></span>
                    </ul> 
                  </div>
                </div>
              </div>
            </div>
          </div>  
          <div class="x-col x-col-fixed cf2iuye" xid="col25" style="width:40px;padding-top:0px;padding-left:0px;" __cid="cf2iuye">
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cf2iuye" xid="closepopbtn" style="margin-top:-10px;color:#C0C0C0;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:closepopbtnClick" data-config="{&#34;icon&#34;:&#34;linear linear-crosscircle&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cf2iuye"> 
              <i xid="i12" class="linear linear-crosscircle cf2iuye" style="font-size:x-large;" __cid="cf2iuye"></i>  
              <span xid="span33" __cid="cf2iuye" class="cf2iuye"></span>
            </a>
          </div>
        </div>  
        <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list5" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;}" __cid="cf2iuye"> 
          <ul class="x-list-template hide cf2iuye" xid="listTemplateUl5" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list5($element),afterRender:$model.foreach_afterRender_list5.bind($model,$element)}"> 
            <div xid="div13" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;margin-left:10px;margin-bottom:5px;margin-top:10px;" __cid="cf2iuye" class="cf2iuye"></div>
            <span xid="span34" style="margin-left:10px;font-size:medium;" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;name&#34;)"></span>
            <div component="$model/UI2/system/components/justep/list/list" class="x-list cf2iuye" xid="list6" style="margin-top:5px;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;$model.conditionData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;optional_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cf2iuye"> 
              <ul class="x-list-template hide cf2iuye" xid="listTemplateUl6" style="padding-top:10px;padding-bottom:10px;" __cid="cf2iuye" data-bind="foreach:{data:$model.foreach_list6($element),afterRender:$model.foreach_afterRender_list6.bind($model,$element)}"> 
                <span xid="span35" style="margin-left:10px;font-size:small;" __cid="cf2iuye" class="cf2iuye" data-bind="text:val(&#34;name&#34;),css:val(&#34;isselect&#34;) == 1 ? &#34;hasselect&#34; : &#34;noselect&#34;,event:{click:$model._callModelFn.bind($model, 'span35Click')}"></span>
              </ul> 
            </div>
          </ul> 
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row15" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
          <div class="x-col cf2iuye" xid="col39" __cid="cf2iuye">
            <span xid="span37" __cid="cf2iuye" class="cf2iuye">购买数量</span>
          </div>  
          <div class="x-col text-right cf2iuye" xid="col40" __cid="cf2iuye">
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cf2iuye" xid="subBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:subBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-remove&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cf2iuye"> 
              <i xid="i4" class="icon-android-remove cf2iuye" __cid="cf2iuye"></i>  
              <span xid="span41" __cid="cf2iuye" class="cf2iuye"></span>
            </a>  
            <label xid="numberlabel" style="font-weight:normal;width:30px;" class="text-center cf2iuye" __cid="cf2iuye">1</label>  
            <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cf2iuye" xid="addBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:addBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-add&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cf2iuye"> 
              <i xid="i13" class="icon-android-add cf2iuye" __cid="cf2iuye"></i>  
              <span xid="span42" __cid="cf2iuye" class="cf2iuye"></span>
            </a>
          </div> 
        </div>  
        <div xid="popdiv" style="position:absolute;left:0px;bottom:0px;width:100%;" __cid="cf2iuye" class="cf2iuye">
          <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row16" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
            <div class="x-col cf2iuye" xid="col42" __cid="cf2iuye">
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block surebtn cf2iuye" xid="popBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:popBtnClick" data-config="{&#34;label&#34;:&#34;确定&#34;}" __cid="cf2iuye"> 
                <i xid="i15" __cid="cf2iuye" class="cf2iuye"></i>  
                <span xid="span43" __cid="cf2iuye" class="cf2iuye">确定</span>
              </a>
            </div> 
          </div>  
          <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row17" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
            <div class="x-col cf2iuye" xid="col45" style="padding-right:0px;" __cid="cf2iuye">
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block popaddcar cf2iuye" xid="popaddcarBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;加入购物车&#34;}" __cid="cf2iuye"> 
                <i xid="i17" __cid="cf2iuye" class="cf2iuye"></i>  
                <span xid="span44" __cid="cf2iuye" class="cf2iuye">加入购物车</span>
              </a>
            </div>  
            <div class="x-col cf2iuye" xid="col46" style="padding-left:0px;" __cid="cf2iuye">
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block popbuy cf2iuye" xid="popbuyBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:popbuyBtnClick" data-config="{&#34;label&#34;:&#34;立即购买&#34;}" __cid="cf2iuye"> 
                <i xid="i18" __cid="cf2iuye" class="cf2iuye"></i>  
                <span xid="span45" __cid="cf2iuye" class="cf2iuye">立即购买</span>
              </a>
            </div> 
          </div>
        </div>
      </div>
    </div>
  </div>  
  <div component="$model/UI2/system/components/justep/popMenu/popMenu" class="x-popMenu cf2iuye" xid="popMenu1" data-bind="component:{name:'$model/UI2/system/components/justep/popMenu/popMenu'}" data-config="{&#34;direction&#34;:&#34;auto&#34;}" __cid="cf2iuye"> 
    <div class="x-popMenu-overlay cf2iuye" xid="div9" __cid="cf2iuye"></div>  
    <ul component="$model/UI2/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content cf2iuye" xid="menu1" data-bind="component:{name:'$model/UI2/system/components/justep/menu/menu'}" __cid="cf2iuye"></ul>
  </div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver cf2iuye" xid="ems_popOver" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;opacity&#34;:0}" __cid="cf2iuye"> 
    <div class="x-popOver-overlay cf2iuye" xid="div16" __cid="cf2iuye"></div>  
    <div class="x-popOver-content cf2iuye" xid="div17" __cid="cf2iuye"> 
      <div xid="div19" style="padding:20px;" __cid="cf2iuye" class="cf2iuye">
        <div xid="div18" class="popback text-center cf2iuye" style="padding:10px;" __cid="cf2iuye">
          <span xid="span4" style="color:#FFFFFF;" __cid="cf2iuye" class="cf2iuye">免费包邮北京、青海、新疆地区等需要增加邮费，其它地区包邮，可能香港、台湾也不会包邮的，亲</span>
        </div>
      </div>
    </div>
  </div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver cf2iuye" xid="subscribe_popOver" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;}" __cid="cf2iuye"> 
    <div class="x-popOver-overlay cf2iuye" xid="div14" __cid="cf2iuye"></div>  
    <div class="x-popOver-content text-center cf2iuye" xid="div20" style="width:100%;top:10%;height:80%;" __cid="cf2iuye">
      <img src=" " alt="" xid="sysqrimg" style="width:60%;" __cid="cf2iuye" class="cf2iuye">  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cf2iuye" xid="row18" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cf2iuye"> 
        <div class="x-col text-center cf2iuye" xid="col41" __cid="cf2iuye">
          <span xid="span46" __cid="cf2iuye" class="cf2iuye">长按二维码识别关注公众号后继续</span>
        </div> 
      </div>
    </div>
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
    				baseUrl: window.__justep.__ResourceEngine.contextPath + '/flowerfront/product',
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
    				context.model = '$model/UI2/flowerfront/product/productdetail.w' + (document.location.search || "");
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