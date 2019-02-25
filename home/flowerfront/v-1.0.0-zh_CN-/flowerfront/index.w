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
        <script src="../system/lib/base/modernizr-2.8.3.min.js"></script>
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
    <link rel="stylesheet" href="../system/components/bootstrap.min.css" include="$model/UI2/system/components/bootstrap/lib/css/bootstrap,$model/UI2/system/components/bootstrap/lib/css/bootstrap-theme"><link rel="stylesheet" href="../system/components/comp.min.css" include="$model/UI2/system/components/justep/lib/css2/dataControl,$model/UI2/system/components/justep/input/css/datePickerPC,$model/UI2/system/components/justep/messageDialog/css/messageDialog,$model/UI2/system/components/justep/lib/css3/round,$model/UI2/system/components/justep/input/css/datePicker,$model/UI2/system/components/justep/row/css/row,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/attachment/css/attachment,$model/UI2/system/components/justep/barcode/css/barcodeImage,$model/UI2/system/components/bootstrap/dropdown/css/dropdown,$model/UI2/system/components/justep/contents/css/contents,$model/UI2/system/components/justep/common/css/forms,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/locker/css/locker,$model/UI2/system/components/justep/menu/css/menu,$model/UI2/system/components/justep/scrollView/css/scrollView,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/dialog/css/dialog,$model/UI2/system/components/justep/bar/css/bar,$model/UI2/system/components/justep/popMenu/css/popMenu,$model/UI2/system/components/justep/lib/css/icons,$model/UI2/system/components/justep/lib/css4/e-commerce,$model/UI2/system/components/justep/toolBar/css/toolBar,$model/UI2/system/components/justep/popOver/css/popOver,$model/UI2/system/components/justep/panel/css/panel,$model/UI2/system/components/bootstrap/carousel/css/carousel,$model/UI2/system/components/justep/wing/css/wing,$model/UI2/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/UI2/system/components/justep/titleBar/css/titleBar,$model/UI2/system/components/justep/lib/css1/linear,$model/UI2/system/components/justep/numberSelect/css/numberList,$model/UI2/system/components/justep/list/css/list,$model/UI2/system/components/justep/dataTables/css/dataTables"><link rel="stylesheet" href="../system/components/pc.addon.min.css" include="$model/UI2/system/components/justep/pagerBar/css/pagerBar,$model/UI2/system/components/justep/widgets/css/widgets,$model/UI2/system/components/justep/absoluteLayout/css/absoluteLayout,$model/UI2/system/components/justep/pagerLimitSelect/css/pagerLimitSelect,$model/UI2/system/components/justep/cellLayout/css/cellLayout,$model/UI2/system/components/justep/richTextarea/css/richTextarea,$model/UI2/system/components/justep/smartContainer/css/smartContainer"></head>
	
    <body style="width:100%;height:100%;margin: 0;">
        <script intro="none"></script>
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div xid="window" class="window caeimEb" component="$model/UI2/system/components/justep/window/window" design="device:m;" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="caeimEb" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/input/input,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,,$model/UI2/system/components/bootstrap/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/contents/content,$model/UI2/system/components/justep/windowContainer/windowContainer,$model/UI2/system/components/justep/contents/contents,$model/UI2/system/components/justep/button/buttonGroup,,">
  <style>null</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="caeimEb" class="caeimEb"></div>  
  <div component="$model/UI2/system/components/justep/contents/contents" class="x-contents x-full caeimEb" xid="pages" data-bind="component:{name:'$model/UI2/system/components/justep/contents/contents'}" data-config="{&#34;active&#34;:0,&#34;swipe&#34;:false}" __cid="caeimEb">
    <div class="x-contents-content active caeimEb" xid="main" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="caeimEb">
      <div component="$model/UI2/system/components/justep/windowContainer/windowContainer" class="x-window-container caeimEb" xid="mainContainer" __component-context__="block" data-bind="component:{name:'$model/UI2/system/components/justep/windowContainer/windowContainer'}" data-config="{&#34;src&#34;:&#34;$model/UI2/flowerfront/main.w&#34;}" __cid="caeimEb">
        <div xid="window" class="window cnAbMrm" component="$model/UI2/system/components/justep/window/window" design="device:m;" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cnAbMrm" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/input/input,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,,$model/UI2/system/components/bootstrap/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/contents/content,$model/UI2/system/components/justep/windowContainer/windowContainer,$model/UI2/system/components/justep/contents/contents,$model/UI2/system/components/justep/button/buttonGroup,">  
          <style>.x-titlebar.cnAbMrm{background-color: rgba(0, 0, 0, 0)} .x-titlebar.cnAbMrm .x-titlebar-title.cnAbMrm{padding: 6px 0} .x-titlebar.cnAbMrm .x-titlebar-right.cnAbMrm .btn.cnAbMrm{padding-left: 0} .x-inputText.cnAbMrm{background-color: rgba(255, 255, 255, 0.8)} .form-control-feedback.cnAbMrm{height: 34px; line-height: 34px} .x-cards.cnAbMrm{padding-top: 0px} .top-trans.cnAbMrm .x-panel-top.cnAbMrm{z-index: 100} .top-trans.cnAbMrm .text-success.cnAbMrm{color: white} .top-trans.x-panel.cnAbMrm > .x-panel-content.cnAbMrm{top: 0 !important} .top-trans.x-panel.cnAbMrm .no-iosstatusbar.cnAbMrm > .x-panel-content.cnAbMrm{top: -20px !important} .x-flower.btn-group.cnAbMrm{background-color: rgb(255, 255, 255); border-top: 1px solid rgb(246, 246, 246)} .x-flower.btn-group.cnAbMrm .btn.cnAbMrm{border-top: 0} .x-flower.btn-group.cnAbMrm .btn.cnAbMrm span.cnAbMrm{font-size: 14px; font-weight: normal} .x-card.btn-group.cnAbMrm .btn.active.cnAbMrm{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent} .angleBox.cnAbMrm{width: 50px; position: relative} .angle.cnAbMrm{position: absolute; right: 30%; top: 1px; background-color: rgb(255, 255, 255); border: 1px solid rgb(255, 66, 86); font-weight: lighter; font-size: x-small; color: rgb(255, 66, 86); -webkit-background-clip: none; -webkit-text-fill-color: rgb(255, 66, 86); border-radius: 10px; padding-left: 6px; padding-right: 6px; padding-top: 2px; padding-bottom: 1px}</style>  
          <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="cnAbMrm" class="cnAbMrm"></div>  
          <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcRvMfae-iosstatusbar cnAbMrm" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cnAbMrm">  
            <div class="x-panel-content cnAbMrm" xid="content1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cnAbMrm"> 
              <div component="$model/UI2/system/components/justep/contents/contents" class="x-contents x-full cnAbMrm" xid="contents1" data-bind="component:{name:'$model/UI2/system/components/justep/contents/contents'}" data-config="{&#34;active&#34;:0,&#34;slidable&#34;:false}" __cid="cnAbMrm"> 
                <div class="x-contents-content active cnAbMrm" xid="topsalecontent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" data-events="onActive:topsalecontentActive" __cid="cnAbMrm"> 
                  <div component="$model/UI2/system/components/justep/windowContainer/windowContainer" class="x-window-container cnAbMrm" xid="windowContainer1" __component-context__="block" data-bind="component:{name:'$model/UI2/system/components/justep/windowContainer/windowContainer'}" data-config="{&#34;src&#34;:&#34;$model/UI2/flowerfront/topsale/topsale.w&#34;}" __cid="cnAbMrm"> 
                    <div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window ciMZr6b" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="ciMZr6b" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/input/input,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,"> 
                      <style>.x-titlebar.ciMZr6b{background-color: rgba(0, 0, 0, 0)} .x-titlebar.ciMZr6b .x-titlebar-title.ciMZr6b{padding: 6px 0} .x-titlebar.ciMZr6b .x-titlebar-right.ciMZr6b .btn.ciMZr6b{padding-left: 0} .x-inputText.ciMZr6b{border-radius: 20px; background-color: rgba(255, 255, 255, 0.8); height: 34px; text-indent: 20px} .x-inputText.ciMZr6b:focus{border-color: rgb(255, 66, 86); box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(255, 66, 86, 0.6)} .form-control-feedback.ciMZr6b{height: 34px; line-height: 34px} .x-cards.ciMZr6b{padding-top: 0px} .top-trans.ciMZr6b .x-panel-top.ciMZr6b{z-index: 100} .top-trans.ciMZr6b .text-success.ciMZr6b{color: white} .top-trans.x-panel.ciMZr6b > .x-panel-content.ciMZr6b{top: 0 !important} .top-trans.x-panel.ciMZr6b .no-iosstatusbar.ciMZr6b > .x-panel-content.ciMZr6b{top: -20px !important} .ev.ciMZr6b{padding: 10px; padding-right: 5px} .od.ciMZr6b{padding: 10px; padding-left: 5px} .btnclass.ciMZr6b{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent} .x-popOver-content.ciMZr6b{bottom: 0px !important}</style>  
                      <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="ciMZr6b" class="ciMZr6b"></div>  
                      <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full  x-card top-trans pcYv2Ej2-iosstatusbar ciMZr6b" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="ciMZr6b"> 
                        <div class="x-panel-content ciMZr6b" xid="content1" style="background-color:#f6f6f6;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="ciMZr6b"> 
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row5" style="position:absolute;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                            <div class="x-col ciMZr6b" xid="col17" __cid="ciMZr6b"> 
                              <div class="form-group has-feedback text-muted ciMZr6b" xid="formGroup1" __cid="ciMZr6b"> 
                                <i class="icon-ios7-search-strong form-control-feedback ciMZr6b" xid="col1" style="left:0;font-size:large;" __cid="ciMZr6b"></i>  
                                <input component="$model/UI2/system/components/justep/input/input" class="form-control x-inputText ciMZr6b" xid="key" data-bind="component:{name:'$model/UI2/system/components/justep/input/input'},event:{click:$model._callModelFn.bind($model, 'keyClick')}" data-config="{&#34;placeHolder&#34;:&#34;玫瑰花茶&#34;}" __cid="ciMZr6b"> 
                              </div> 
                            </div>  
                            <div class="x-col x-col-fixed ciMZr6b" xid="col18" style="padding-left:0px;width:38px;" __cid="ciMZr6b"> 
                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-sm btn-only-icon ciMZr6b" xid="button1" style="padding-top:4px;margin-left:-5px;color:#fff;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-liaotian&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="ciMZr6b"> 
                                <i xid="i1" class="my my-liaotian ciMZr6b" style="font-size:x-large;" __cid="ciMZr6b"></i>  
                                <span xid="span1" __cid="ciMZr6b" class="ciMZr6b"></span> 
                              </a> 
                            </div> 
                          </div>  
                          <img src="../flowerfront/image/top01.png" alt="" xid="image1" style="width:100%;" class="iBanner ciMZr6b" __cid="ciMZr6b">  
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row1" style="border-bottom-style:dashed;border-bottom-width:1px;border-bottom-color:#dddddd;padding-top:10px;padding-bottom:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                            <div class="x-col text-center ciMZr6b" xid="col2" __cid="ciMZr6b"> 
                              <i xid="i2" class="my my-tubiao_dagou ciMZr6b" style="color:#fe2d29;" __cid="ciMZr6b"></i>  
                              <span xid="span2" style="font-size:small;color:#fe2d29;" __cid="ciMZr6b" class="ciMZr6b">正品茶叶直销</span> 
                            </div>  
                            <div class="x-col text-center ciMZr6b" xid="col3" __cid="ciMZr6b"> 
                              <i xid="i3" class="my my-tubiao_dagou ciMZr6b" style="color:#fe2d29;" __cid="ciMZr6b"></i>  
                              <span xid="span3" style="font-size:small;color:#fe2d29;" __cid="ciMZr6b" class="ciMZr6b">超值正品优惠</span> 
                            </div>  
                            <div class="x-col text-center ciMZr6b" xid="col4" __cid="ciMZr6b"> 
                              <i xid="i4" class="my my-tubiao_dagou ciMZr6b" style="color:#fe2d29;" __cid="ciMZr6b"></i>  
                              <span xid="span4" style="font-size:small;color:#fe2d29;" __cid="ciMZr6b" class="ciMZr6b">畅享健康生活</span> 
                            </div> 
                          </div>  
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row2" style="padding-top:20px;padding-bottom:20px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                            <div class="x-col text-center ciMZr6b" xid="yjmhcol" __cid="ciMZr6b" data-bind="event:{click:$model._callModelFn.bind($model, 'yjmhcolClick')}"> 
                              <div xid="div1" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/yjmh_logo.png" alt="" xid="image2" style="width:50px;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div>  
                              <div xid="div2" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span5" style="color:#333333;" __cid="ciMZr6b" class="ciMZr6b">遇见玫好</span> 
                              </div> 
                            </div>  
                            <div class="x-col text-center ciMZr6b" xid="col6" __cid="ciMZr6b"> 
                              <div xid="div4" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/azl_logo.png" alt="" xid="image3" style="width:50px;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div>  
                              <div xid="div3" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span6" style="color:#333333;" __cid="ciMZr6b" class="ciMZr6b">啊咱哩</span> 
                              </div> 
                            </div>  
                            <div class="x-col text-center ciMZr6b" xid="col7" __cid="ciMZr6b"> 
                              <div xid="div6" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/cysy_logo.png" alt="" xid="image4" style="width:50px;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div>  
                              <div xid="div5" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span7" style="color:#333333;" __cid="ciMZr6b" class="ciMZr6b">茶言水语</span> 
                              </div> 
                            </div>  
                            <div class="x-col text-center ciMZr6b" xid="col8" __cid="ciMZr6b"> 
                              <div xid="div8" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/pec_logo.png" alt="" xid="image5" style="width:50px;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div>  
                              <div xid="div7" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span8" style="color:#333333;" __cid="ciMZr6b" class="ciMZr6b">普洱茶</span> 
                              </div> 
                            </div>  
                            <div class="x-col text-center ciMZr6b" xid="col9" __cid="ciMZr6b"> 
                              <div xid="div10" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/cpqm_logo.png" alt="" xid="image6" style="width:50px;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div>  
                              <div xid="div9" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span9" style="color:#333333;" __cid="ciMZr6b" class="ciMZr6b">冲泡器皿</span> 
                              </div> 
                            </div> 
                          </div>  
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row3" style="background-color:white;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                            <div class="x-col x-col-fixed ciMZr6b" xid="col10" style="width:110px;" __cid="ciMZr6b"> 
                              <img src="../flowerfront/image/hot_logo.png" alt="" xid="image7" style="width:40px;" __cid="ciMZr6b" class="ciMZr6b">  
                              <span xid="span10" style="margin-left:5px;" __cid="ciMZr6b" class="ciMZr6b">花当家</span>  
                              <img src="../flowerfront/image/vertical_line.png" alt="" xid="image8" height="25px" class="pull-right ciMZr6b" style="margin-top:8px;" __cid="ciMZr6b"> 
                            </div>  
                            <div class="x-col ciMZr6b" xid="col11" __cid="ciMZr6b"> 
                              <div xid="div11" class="swiper-container ciMZr6b" style="height:40px;" __cid="ciMZr6b"> 
                                <div xid="div12" class="swiper-wrapper ciMZr6b" __cid="ciMZr6b"> 
                                  <div xid="div13" class="swiper-slide ciMZr6b" style="padding-top:10px;" __cid="ciMZr6b"> 
                                    <span xid="span11" __cid="ciMZr6b" class="ciMZr6b">霞** 成功购买禾言清茶</span>  
                                    <span xid="span12" class="pull-right text-muted ciMZr6b" __cid="ciMZr6b">刚刚</span> 
                                  </div>  
                                  <div xid="div14" class="swiper-slide ciMZr6b" style="padding-top:10px;" __cid="ciMZr6b"> 
                                    <span xid="span14" __cid="ciMZr6b" class="ciMZr6b">*敏 成功购买遇见玫好系列普洱茶</span>  
                                    <span xid="span13" class="pull-right text-muted ciMZr6b" __cid="ciMZr6b">5分钟前</span> 
                                  </div> 
                                </div> 
                              </div> 
                            </div> 
                          </div>  
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row text-center ciMZr6b" xid="row4" style="margin-top:15px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                            <div class="x-col ciMZr6b" xid="col13" style="background-color:white;border-radius: 5px;margin-left:5px;margin-right:5px;" __cid="ciMZr6b"> 
                              <div xid="div15" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span15" style="color:#333333;font-size:medium;font-weight:bold;" __cid="ciMZr6b" class="ciMZr6b">好茶推荐</span> 
                              </div>  
                              <div xid="div16" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span16" class="text-muted ciMZr6b" style="font-size:small;" __cid="ciMZr6b">热卖好茶任你挑</span> 
                              </div>  
                              <div xid="div17" style="padding-top:15px;padding-bottom:15px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/hctj.png" alt="" xid="image9" style="width:80%;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div> 
                            </div>  
                            <div class="x-col ciMZr6b" xid="col14" style="background-color:white;border-radius: 5px;margin-left:5px;margin-right:5px;" __cid="ciMZr6b"> 
                              <div xid="div20" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span18" style="color:#333333;font-size:medium;font-weight:bold;" __cid="ciMZr6b" class="ciMZr6b">超值优惠</span> 
                              </div>  
                              <div xid="div18" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span17" class="text-muted ciMZr6b" style="font-size:small;" __cid="ciMZr6b">每日优惠帮你省</span> 
                              </div>  
                              <div xid="div19" style="padding-top:15px;padding-bottom:15px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/czyh.png" alt="" xid="image10" style="width:80%;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div> 
                            </div>  
                            <div class="x-col ciMZr6b" xid="col15" style="background-color:white;border-radius: 5px;margin-left:5px;margin-right:5px;" __cid="ciMZr6b"> 
                              <div xid="div23" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span20" style="color:#333333;font-size:medium;font-weight:bold;" __cid="ciMZr6b" class="ciMZr6b">茶具推荐</span> 
                              </div>  
                              <div xid="div21" __cid="ciMZr6b" class="ciMZr6b"> 
                                <span xid="span19" class="text-muted ciMZr6b" __cid="ciMZr6b">精品茶具好看不贵</span> 
                              </div>  
                              <div xid="div22" style="padding-top:15px;padding-bottom:15px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                <img src="../flowerfront/image/cjtj.png" alt="" xid="image11" style="width:90%;" __cid="ciMZr6b" class="ciMZr6b"> 
                              </div> 
                            </div> 
                          </div>  
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row6" style="margin-top:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                            <div class="x-col ciMZr6b" xid="col12" __cid="ciMZr6b"></div>  
                            <div class="x-col text-center ciMZr6b" xid="col16" __cid="ciMZr6b"> 
                              <img src="../flowerfront/image/mxcp_title.png" alt="" xid="image12" style="width:120px;" __cid="ciMZr6b" class="ciMZr6b"> 
                            </div>  
                            <div class="x-col ciMZr6b" xid="col19" __cid="ciMZr6b"></div> 
                          </div>  
                          <div component="$model/UI2/system/components/justep/list/list" class="x-list ciMZr6b" xid="list1" style="margin-top:-10px;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-events="onAfterRender:list1AfterRender" data-config="{&#34;data&#34;:&#34;productData&#34;}" __cid="ciMZr6b"> 
                            <ul class="x-list-template hide ciMZr6b" xid="listTemplateUl1" __cid="ciMZr6b" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
                              <div xid="div25" class="col-xs-6 col-sm-4 ciMZr6b" style="padding-top:5px;padding-bottom:5px;" __cid="ciMZr6b" data-bind="css:val(&#34;odd&#34;) == 0 ? 'ev' : 'od',event:{click:$model._callModelFn.bind($model, 'div25Click')}"> 
                                <div xid="div24" style="border-radius:5px 5px 0px 0px;overflow: hidden;background-color:#eaeaea;" class="imagediv ciMZr6b" __cid="ciMZr6b"> 
                                  <i xid="i5" style="position:absolute;font-size:x-large;" class="follow btnclass ciMZr6b" __cid="ciMZr6b" data-bind="css:val(&#34;collection&#34;) == 1 ? &#34;my my-xinxingshi&#34; : &#34;my my-xinxingxian&#34;,event:{click:$model._callModelFn.bind($model, 'i5Click')}"></i>  
                                  <img src=" " alt="" xid="image13" style="width:100%;" __cid="ciMZr6b" class="ciMZr6b" data-bind="attr:{src:val(&#34;cover&#34;)}"> 
                                </div>  
                                <div xid="div28" style="background-color:white;padding-bottom:5px;border-radius: 0 0 5px 5px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                  <div xid="div26" style="padding-top:10px;padding-left:10px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                    <span xid="span21" style="font-size:medium;" __cid="ciMZr6b" class="ciMZr6b" data-bind="text:val(&#34;name&#34;)"></span> 
                                  </div>  
                                  <div xid="div27" style="padding-left:10px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                    <span xid="span22" style="background-color:white;font-size:small;" class="text-muted ciMZr6b" __cid="ciMZr6b" data-bind="text:val(&#34;subtitle&#34;)"></span> 
                                  </div>  
                                  <div xid="div29" style="padding-left:10px;padding-right:5px;" __cid="ciMZr6b" class="ciMZr6b"> 
                                    <span xid="span23" style="font-size:large;color:#fe2e23;" __cid="ciMZr6b" class="ciMZr6b" data-bind="text:'￥' + val(&#34;price&#34;)"></span>  
                                    <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="ciMZr6b" class="ciMZr6b" data-bind="text:'省' + val(&#34;discount&#34;) + '元',visible:val(&#34;discount&#34;) &gt; 0"></span>  
                                    <span xid="span25" class="pull-right text-muted ciMZr6b" style="font-size:x-small;font-weight:lighter;margin-top:9px;" __cid="ciMZr6b">已售100件</span> 
                                  </div> 
                                </div> 
                              </div> 
                            </ul> 
                          </div> 
                        </div>  
                        <style __cid="ciMZr6b" class="ciMZr6b">.x-panel.pcYv2Ej2-iosstatusbar >.x-panel-top {height: 0px;}.x-panel.pcYv2Ej2-iosstatusbar >.x-panel-content { top: 0px;bottom: nullpx;}.x-panel.pcYv2Ej2-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcYv2Ej2-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcYv2Ej2-iosstatusbar >.x-panel-top {height: 0px;}.iosstatusbar .x-panel.pcYv2Ej2-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcYv2Ej2-iosstatusbar >.x-panel-content { top: 0px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcYv2Ej2-iosstatusbar >.x-panel-top {height: 0px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcYv2Ej2-iosstatusbar >.x-panel-content {top: 0px;}</style> 
                      </div>  
                      <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver ciMZr6b" xid="serachpopOver" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;opacity&#34;:1}" __cid="ciMZr6b"> 
                        <div class="x-popOver-overlay ciMZr6b" xid="div30" style="background-color:#f6f6f6;" __cid="ciMZr6b"></div>  
                        <div class="x-popOver-content ciMZr6b" xid="div31" style="width:100%;height:100%;" __cid="ciMZr6b"> 
                          <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcue2IZv-iosstatusbar ciMZr6b" xid="panel2" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="ciMZr6b"> 
                            <div class="x-panel-top ciMZr6b" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="ciMZr6b"> 
                              <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row7" style="position:absolute;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                                <div class="x-col ciMZr6b" xid="col21" __cid="ciMZr6b"> 
                                  <div class="form-group has-feedback text-muted ciMZr6b" xid="formGroup2" __cid="ciMZr6b"> 
                                    <i class="icon-ios7-search-strong form-control-feedback ciMZr6b" xid="col22" style="left:0;font-size:large;" __cid="ciMZr6b"></i>  
                                    <input component="$model/UI2/system/components/justep/input/input" class="form-control x-inputText ciMZr6b" xid="searchinput" data-bind="component:{name:'$model/UI2/system/components/justep/input/input'},event:{keyup:$model._callModelFn.bind($model, 'searchinputKeyup')}" __cid="ciMZr6b"> 
                                  </div> 
                                </div>  
                                <div class="x-col x-col-fixed ciMZr6b" xid="col20" style="padding-left:0px;width:60px;" __cid="ciMZr6b"> 
                                  <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link ciMZr6b" xid="cancelsearchBtn" style="color:#333333;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:cancelsearchBtnClick" data-config="{&#34;label&#34;:&#34;取消&#34;}" __cid="ciMZr6b"> 
                                    <i xid="i7" __cid="ciMZr6b" class="ciMZr6b"></i>  
                                    <span xid="span27" __cid="ciMZr6b" class="ciMZr6b">取消</span> 
                                  </a> 
                                </div> 
                              </div> 
                            </div>  
                            <div class="x-panel-content x-cards ciMZr6b" xid="content2" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="ciMZr6b"> 
                              <div component="$model/UI2/system/components/justep/list/list" class="x-list ciMZr6b" xid="list2" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;searchData&#34;}" __cid="ciMZr6b"> 
                                <ul class="x-list-template hide ciMZr6b" xid="listTemplateUl2" __cid="ciMZr6b" data-bind="foreach:{data:$model.foreach_list2($element),afterRender:$model.foreach_afterRender_list2.bind($model,$element)}"> 
                                  <div xid="div33" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" __cid="ciMZr6b" class="ciMZr6b" data-bind="event:{click:$model._callModelFn.bind($model, 'div33Click')}"> 
                                    <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row8" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                                      <div class="x-col x-col-25 ciMZr6b" xid="col23" __cid="ciMZr6b"> 
                                        <div xid="div32" style="border-radius:5px;    overflow: hidden;" __cid="ciMZr6b" class="ciMZr6b"> 
                                          <img src=" " alt="" xid="image14" style="width:100%;" __cid="ciMZr6b" class="ciMZr6b" data-bind="attr:{src:val(&#34;cover&#34;)}"> 
                                        </div> 
                                      </div>  
                                      <div class="x-col ciMZr6b" xid="col24" style="padding:0px;" __cid="ciMZr6b"> 
                                        <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row9" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                                          <div class="x-col ciMZr6b" xid="col26" __cid="ciMZr6b"> 
                                            <span xid="span26" __cid="ciMZr6b" class="ciMZr6b" data-bind="text:val(&#34;name&#34;)"></span>  
                                            <span xid="span28" __cid="ciMZr6b" class="ciMZr6b" data-bind="text:val(&#34;subtitle&#34;)"></span> 
                                          </div> 
                                        </div>  
                                        <div component="$model/UI2/system/components/justep/row/row" class="x-row ciMZr6b" xid="row10" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="ciMZr6b"> 
                                          <div class="x-col ciMZr6b" xid="col29" __cid="ciMZr6b"> 
                                            <span xid="span29" style="font-size:large;color: #fe2e23;" __cid="ciMZr6b" class="ciMZr6b" data-bind="text:'￥' + val(&#34;price&#34;)"></span> 
                                          </div> 
                                        </div> 
                                      </div> 
                                    </div> 
                                  </div> 
                                </ul> 
                              </div> 
                            </div>  
                            <style __cid="ciMZr6b" class="ciMZr6b">.x-panel.pcue2IZv-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pcue2IZv-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pcue2IZv-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcue2IZv-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcue2IZv-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pcue2IZv-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcue2IZv-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcue2IZv-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcue2IZv-iosstatusbar >.x-panel-content {top: 48px;}</style> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div class="x-contents-content cnAbMrm" xid="productcontent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cnAbMrm"> 
                  <div component="$model/UI2/system/components/justep/windowContainer/windowContainer" class="x-window-container cnAbMrm" xid="windowContainer4" __component-context__="block" data-bind="component:{name:'$model/UI2/system/components/justep/windowContainer/windowContainer'}" data-config="{&#34;src&#34;:&#34;$model/UI2/flowerfront/product/product.w&#34;}" __cid="cnAbMrm"> 
                    <div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cfQzuq2" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cfQzuq2" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/input/input,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/bootstrap/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,"> 
                      <style>.x-inputText.cfQzuq2{border-radius: 20px; background-color: rgba(255, 255, 255, 0.8); height: 34px; text-indent: 20px} .form-control-feedback.cfQzuq2{height: 34px; line-height: 34px} .hasselect.cfQzuq2{background: rgb(255, 255, 255)} .noselect.cfQzuq2{color: rgb(255, 255, 255)} .tb-box.cfQzuq2, .tb-box.cfQzuq2 > .col.cfQzuq2{height: 100%; margin: 0; padding: 0} .tb-box.cfQzuq2 > .col.cfQzuq2{overflow: auto} .tb-box.cfQzuq2 > .col.cfQzuq2:first-child{padding-right: 10px} .ev.cfQzuq2{padding: 10px; padding-right: 5px} .od.cfQzuq2{padding: 10px; padding-left: 5px} .btnclass.cfQzuq2{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent}</style>  
                      <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="cfQzuq2" class="cfQzuq2"></div>  
                      <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pc7fqMra-iosstatusbar cfQzuq2" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cfQzuq2"> 
                        <div class="x-panel-top cfQzuq2" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cfQzuq2"> 
                          <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cfQzuq2" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;全部商品&#34;}" __cid="cfQzuq2"> 
                            <div class="x-titlebar-left cfQzuq2" __cid="cfQzuq2"> 
                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cfQzuq2" xid="backBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:{operation:'window.close'}" data-config="{&#34;icon&#34;:&#34;icon-chevron-left&#34;,&#34;label&#34;:&#34;&#34;}" __cid="cfQzuq2"> 
                                <i class="icon-chevron-left cfQzuq2" __cid="cfQzuq2"></i>  
                                <span __cid="cfQzuq2" class="cfQzuq2"></span> 
                              </a> 
                            </div>  
                            <div class="x-titlebar-title cfQzuq2" style="font-weight:normal;color:#333333;" __cid="cfQzuq2">全部商品</div>  
                            <div class="x-titlebar-right  cfQzuq2" __cid="cfQzuq2"> 
                              <div class="empty cfQzuq2" __cid="cfQzuq2"></div> 
                            </div> 
                          </div> 
                        </div>  
                        <div class="x-panel-content x-cards cfQzuq2" xid="content1" style="padding-top:0px;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cfQzuq2"> 
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row cfQzuq2" xid="row5" style="padding-top:0px;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cfQzuq2"> 
                            <div class="x-col cfQzuq2" xid="col17" __cid="cfQzuq2"> 
                              <div class="form-group has-feedback text-muted cfQzuq2" xid="formGroup1" style="margin-bottom:0px;" __cid="cfQzuq2"> 
                                <i class="icon-ios7-search-strong form-control-feedback cfQzuq2" xid="col1" style="left:0;font-size:large;" __cid="cfQzuq2"></i>  
                                <input component="$model/UI2/system/components/justep/input/input" class="form-control x-inputText cfQzuq2" xid="key" data-bind="component:{name:'$model/UI2/system/components/justep/input/input'}" data-config="{&#34;placeHolder&#34;:&#34;玫瑰花茶&#34;}" __cid="cfQzuq2"> 
                              </div> 
                            </div> 
                          </div>  
                          <div component="$model/UI2/system/components/bootstrap/row/row" class="row tb-box cfQzuq2" xid="row1" style="height:100%;" data-bind="component:{name:'$model/UI2/system/components/bootstrap/row/row'}" __cid="cfQzuq2"> 
                            <div class="col col-xs-3 text-center cfQzuq2" xid="col2" style="background-color:#ff5b7a;padding-right:0px;" __cid="cfQzuq2"> 
                              <div component="$model/UI2/system/components/justep/list/list" class="x-list cfQzuq2" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;claData&#34;}" __cid="cfQzuq2"> 
                                <ul class="x-list-template hide cfQzuq2" xid="listTemplateUl1" __cid="cfQzuq2" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
                                  <li xid="li1" style="padding-top:15px;padding-bottom:15px;" __cid="cfQzuq2" class="cfQzuq2" data-bind="css:val(&#34;isselect&#34;) == 1 ? 'hasselect' : 'noselect',event:{click:$model._callModelFn.bind($model, 'li1Click')}"> 
                                    <span xid="span1" __cid="cfQzuq2" class="cfQzuq2" data-bind="text:val(&#34;name&#34;)"></span> 
                                  </li> 
                                </ul> 
                              </div> 
                            </div>  
                            <div class="col col-xs-9 cfQzuq2" xid="col3" __cid="cfQzuq2"> 
                              <div component="$model/UI2/system/components/justep/row/row" class="x-row cfQzuq2" xid="row2" style="padding-top:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cfQzuq2"> 
                                <div class="x-col cfQzuq2" xid="col4" style="padding-top:0px;" __cid="cfQzuq2"> 
                                  <img src="../flowerfront/image/product_top.png" alt="" xid="image1" style="width:100%;" __cid="cfQzuq2" class="cfQzuq2"> 
                                </div> 
                              </div>  
                              <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center cfQzuq2" xid="row3" style="padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cfQzuq2"> 
                                <div class="x-col text-right cfQzuq2" xid="col7" __cid="cfQzuq2"> 
                                  <label xid="label1" style="width:70%;height:1px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#C0C0C0;" __cid="cfQzuq2" class="cfQzuq2"></label> 
                                </div>  
                                <div class="x-col text-center cfQzuq2" xid="col8" __cid="cfQzuq2"> 
                                  <span xid="span2" class="text-muted cfQzuq2" __cid="cfQzuq2"></span> 
                                </div>  
                                <div class="x-col cfQzuq2" xid="col9" __cid="cfQzuq2"> 
                                  <label xid="label2" style="width:70%;height:1px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#C0C0C0;" __cid="cfQzuq2" class="cfQzuq2"></label> 
                                </div> 
                              </div>  
                              <div component="$model/UI2/system/components/justep/list/list" class="x-list cfQzuq2" xid="list2" style="margin-top:-10px;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-events="onAfterRender:list1AfterRender" data-config="{&#34;data&#34;:&#34;productData&#34;}" __cid="cfQzuq2"> 
                                <ul class="x-list-template hide cfQzuq2" xid="listTemplateUl2" __cid="cfQzuq2" data-bind="foreach:{data:$model.foreach_list2($element),afterRender:$model.foreach_afterRender_list2.bind($model,$element)}"> 
                                  <div xid="div25" class="col-xs-6 col-sm-4 cfQzuq2" style="padding-top:5px;padding-bottom:5px;" __cid="cfQzuq2" data-bind="css:val(&#34;odd&#34;) == 0 ? 'ev' : 'od',event:{click:$model._callModelFn.bind($model, 'div25Click')}"> 
                                    <div xid="div24" style="border-radius:5px 5px 0px 0px;overflow: hidden;background-color:#eaeaea;" class="imagediv cfQzuq2" __cid="cfQzuq2"> 
                                      <img src=" " alt="" xid="image13" style="width:100%;" __cid="cfQzuq2" class="cfQzuq2" data-bind="attr:{src:val(&#34;cover&#34;)}">  
                                      <i xid="i5" style="position:relative;font-size:x-large;margin-top:-30px;margin-right:10px;" class="follow pull-right btnclass cfQzuq2" __cid="cfQzuq2" data-bind="css:val(&#34;collection&#34;) == 1 ? &#34;my my-xinxingshi&#34; : &#34;my my-xinxingxian&#34;,event:{click:$model._callModelFn.bind($model, 'i5Click')}"></i> 
                                    </div>  
                                    <div xid="div28" style="background-color:white;padding-bottom:5px;border-radius: 0 0 5px 5px;" __cid="cfQzuq2" class="cfQzuq2"> 
                                      <div xid="div26" style="padding-top:10px;padding-left:10px;" __cid="cfQzuq2" class="cfQzuq2"> 
                                        <span xid="span21" style="font-size:medium;" __cid="cfQzuq2" class="cfQzuq2" data-bind="text:val(&#34;name&#34;)"></span> 
                                      </div>  
                                      <div xid="div27" style="padding-left:10px;" __cid="cfQzuq2" class="cfQzuq2"> 
                                        <span xid="span22" style="background-color:white;font-size:small;" class="text-muted cfQzuq2" __cid="cfQzuq2" data-bind="text:val(&#34;subtitle&#34;),visible:false"></span> 
                                      </div>  
                                      <div xid="div29" style="padding-left:10px;padding-right:5px;" __cid="cfQzuq2" class="cfQzuq2"> 
                                        <span xid="span23" style="font-size:large;color:#fe2e23;" __cid="cfQzuq2" class="cfQzuq2" data-bind="text:'￥' + val(&#34;price&#34;)"></span>  
                                        <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cfQzuq2" class="cfQzuq2" data-bind="text:'省' + val(&#34;discount&#34;) + '元',visible:val(&#34;discount&#34;) &gt; 0"></span>  
                                        <span xid="span25" class="pull-right text-muted cfQzuq2" style="font-size:x-small;font-weight:lighter;margin-top:9px;" __cid="cfQzuq2">已售100件</span> 
                                      </div> 
                                    </div> 
                                  </div> 
                                </ul> 
                              </div> 
                            </div> 
                          </div> 
                        </div>  
                        <style __cid="cfQzuq2" class="cfQzuq2">.x-panel.pc7fqMra-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pc7fqMra-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pc7fqMra-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pc7fqMra-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pc7fqMra-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pc7fqMra-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pc7fqMra-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pc7fqMra-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pc7fqMra-iosstatusbar >.x-panel-content {top: 48px;}</style> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div class="x-contents-content cnAbMrm" xid="buycarcontent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cnAbMrm"> 
                  <div component="$model/UI2/system/components/justep/windowContainer/windowContainer" class="x-window-container cnAbMrm" xid="windowContainer2" __component-context__="block" data-bind="component:{name:'$model/UI2/system/components/justep/windowContainer/windowContainer'}" data-config="{&#34;src&#34;:&#34;$model/UI2/flowerfront/buy/buycar.w&#34;}" __cid="cnAbMrm"> 
                    <div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cbUfAVz" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cbUfAVz" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,"> 
                      <style>.imageradius.cbUfAVz{border-radius: 5px; overflow: hidden} .lastborder.cbUfAVz{border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: rgb(246, 246, 246)} .lastborder.cbUfAVz div.cbUfAVz:last{border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: rgb(246, 246, 246)} .addbtn.cbUfAVz{background: transparent; border-radius: 50%; border: 1px solid rgb(255, 66, 86); color: rgb(255, 66, 86); padding: 2px; padding-left: 5px; padding-right: 5px} .surebtn.cbUfAVz{border-radius: 18px; border: 0px; background: linear-gradient(to right, rgb(255, 108, 160), rgb(255, 66, 86))}</style>  
                      <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onActive:modelActive;onLoad:modelLoad;onParamsReceive:modelParamsReceive" __cid="cbUfAVz" class="cbUfAVz"></div>  
                      <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcbQf2I3-iosstatusbar cbUfAVz" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cbUfAVz"> 
                        <div class="x-panel-top cbUfAVz" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cbUfAVz"> 
                          <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cbUfAVz" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;购物车&#34;}" __cid="cbUfAVz"> 
                            <div class="x-titlebar-left cbUfAVz" __cid="cbUfAVz"> 
                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cbUfAVz" xid="backBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:{operation:'window.close'}" data-config="{&#34;icon&#34;:&#34;icon-chevron-left&#34;,&#34;label&#34;:&#34;&#34;}" __cid="cbUfAVz"> 
                                <i class="icon-chevron-left cbUfAVz" xid="backi" __cid="cbUfAVz"></i>  
                                <span __cid="cbUfAVz" class="cbUfAVz"></span> 
                              </a> 
                            </div>  
                            <div class="x-titlebar-title cbUfAVz" style="color:#333333;font-weight:normal;" __cid="cbUfAVz">购物车</div>  
                            <div class="x-titlebar-right  cbUfAVz" __cid="cbUfAVz"> 
                              <div class="empty cbUfAVz" __cid="cbUfAVz"></div> 
                            </div> 
                          </div> 
                        </div>  
                        <div class="x-panel-content x-cards cbUfAVz" xid="content1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cbUfAVz"> 
                          <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cbUfAVz" xid="smartContainer1" style="background-color:white;overflow-x: unset;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cbUfAVz"> 
                            <div component="$model/UI2/system/components/justep/list/list" class="x-list cbUfAVz" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;buycarData&#34;,&#34;filter&#34;:&#34;$row.val(\&#34;number\&#34;) &gt; 0  &amp;&amp;  $row.val(\&#34;producttype\&#34;) == 0&#34;}" __cid="cbUfAVz"> 
                              <ul class="x-list-template hide cbUfAVz" xid="listTemplateUl1" style="overflow:hidden;" __cid="cbUfAVz" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
                                <div xid="div1" class="swiper-container cbUfAVz" __cid="cbUfAVz"> 
                                  <div xid="div5" class="swiper-wrapper cbUfAVz" __cid="cbUfAVz"> 
                                    <div xid="div6" class="swiper-slide cbUfAVz" __cid="cbUfAVz"> 
                                      <div component="$model/UI2/system/components/justep/row/row" class="x-row movrow cbUfAVz" xid="row1" style="padding-bottom:0px;padding-top:5px;z-index:10;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},event:{click:$model._callModelFn.bind($model, 'row1Click'),touchstart:$model._callModelFn.bind($model, 'row1Touchstart')}" __cid="cbUfAVz"> 
                                        <div class="x-col x-col-25 cbUfAVz" xid="col1" __cid="cbUfAVz"> 
                                          <img src=" " alt="" xid="image1" style="width:100%;" class="imageradius cbUfAVz" __cid="cbUfAVz" data-bind="attr:{src:val(&#34;cover&#34;)}"> 
                                        </div>  
                                        <div class="x-col lastborder cbUfAVz" xid="col2" style="padding:0px;" __cid="cbUfAVz"> 
                                          <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row2" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                            <div class="x-col cbUfAVz" xid="col6" __cid="cbUfAVz"> 
                                              <span xid="span1" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:val(&#34;name&#34;)"></span>  
                                              <span xid="span2" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:val(&#34;subtitle&#34;)"></span> 
                                            </div> 
                                          </div>  
                                          <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row3" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                            <div class="x-col cbUfAVz" xid="col3" style="padding-top:0px;padding-bottom:0px;" __cid="cbUfAVz"> 
                                              <div component="$model/UI2/system/components/justep/list/list" class="x-list cbUfAVz" xid="list2" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activeData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cbUfAVz"> 
                                                <ul class="x-list-template hide cbUfAVz" xid="listTemplateUl2" __cid="cbUfAVz" data-bind="foreach:{data:$model.foreach_list2($element),afterRender:$model.foreach_afterRender_list2.bind($model,$element)}"> 
                                                  <span xid="span3" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:val(&#34;active&#34;)"></span> 
                                                </ul> 
                                              </div> 
                                            </div> 
                                          </div>  
                                          <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row4" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                            <div xid="col4" style="padding:5px;" __cid="cbUfAVz" class="cbUfAVz"> 
                                              <div component="$model/UI2/system/components/justep/list/list" class="x-list cbUfAVz" xid="list3" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cbUfAVz"> 
                                                <ul class="x-list-template hide cbUfAVz" xid="listTemplateUl3" __cid="cbUfAVz" data-bind="foreach:{data:$model.foreach_list3($element),afterRender:$model.foreach_afterRender_list3.bind($model,$element)}"> 
                                                  <span xid="span4" style="font-size:small;" class="text-muted cbUfAVz" __cid="cbUfAVz" data-bind="text:val(&#34;selectcondition_name&#34;)"></span> 
                                                </ul> 
                                              </div> 
                                            </div>  
                                            <div class="x-col cbUfAVz" xid="col15" __cid="cbUfAVz"> 
                                              <i xid="i1" class="linear linear-chevrondown text-muted cbUfAVz" style="font-size:x-small;" __cid="cbUfAVz" data-bind="visible:val(&#34;hasoptional&#34;) &gt; 0"></i> 
                                            </div> 
                                          </div>  
                                          <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row5" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                            <div class="x-col cbUfAVz" xid="col5" __cid="cbUfAVz"> 
                                              <span xid="span5" style="color:#fe2e23;font-size:large;" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:'￥' + val(&#34;price&#34;)"></span>  
                                              <span xid="span10" class="text-muted cbUfAVz" style="text-decoration:line-through;margin-left:5px;" __cid="cbUfAVz" data-bind="text:'￥' + (parseFloat(val(&#34;price&#34;)) + parseFloat(val(&#34;discount&#34;))),visible:val(&#34;discount&#34;) &gt; 0"></span> 
                                            </div>  
                                            <div class="x-col text-right cbUfAVz" xid="col7" __cid="cbUfAVz"> 
                                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cbUfAVz" xid="subBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:subBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-remove&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cbUfAVz"> 
                                                <i xid="i4" class="icon-android-remove cbUfAVz" __cid="cbUfAVz"></i>  
                                                <span xid="span41" __cid="cbUfAVz" class="cbUfAVz"></span> 
                                              </a>  
                                              <label xid="numberlabel" style="font-weight:normal;width:30px;" class="text-center cbUfAVz" __cid="cbUfAVz" data-bind="text:val(&#34;number&#34;)">1</label>  
                                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cbUfAVz" xid="addBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:addBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-add&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cbUfAVz"> 
                                                <i xid="i13" class="icon-android-add cbUfAVz" __cid="cbUfAVz"></i>  
                                                <span xid="span42" __cid="cbUfAVz" class="cbUfAVz"></span> 
                                              </a> 
                                            </div> 
                                          </div> 
                                        </div> 
                                      </div> 
                                    </div>  
                                    <div xid="div7" class="swiper-slide menu cbUfAVz" style="width:160px;" __cid="cbUfAVz"> 
                                      <div xid="div2" style="width:160px;z-index:0;position:relative;display: flex;height:100%;" class="mov pull-right cbUfAVz" __cid="cbUfAVz"> 
                                        <div xid="collcetiondiv" style="background-color:#ff9c50;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center cbUfAVz" __cid="cbUfAVz" data-bind="event:{click:$model._callModelFn.bind($model, 'collcetiondivClick')}"> 
                                          <br __cid="cbUfAVz" class="cbUfAVz">  
                                          <span xid="span22" style="white-space:nowrap;width:100%;color:#FFFFFF;" __cid="cbUfAVz" class="cbUfAVz">移入收藏夹</span> 
                                        </div>  
                                        <div xid="deletediv" style="background-color:#ff4256;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center cbUfAVz" __cid="cbUfAVz" data-bind="event:{click:$model._callModelFn.bind($model, 'deletedivClick')}"> 
                                          <span xid="span21" style="white-space:nowrap;width:100%;color:#FFFFFF;" __cid="cbUfAVz" class="cbUfAVz">删除</span> 
                                        </div> 
                                      </div> 
                                    </div> 
                                  </div> 
                                </div> 
                              </ul> 
                            </div> 
                          </div>  
                          <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cbUfAVz" xid="smartContainer2" style="background-color:white;overflow-x: unset;padding-bottom:0px;border-radius:5px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cbUfAVz"> 
                            <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row11" style="color:#ff4665;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                              <div class="x-col x-col-fixed cbUfAVz" xid="col17" style="width:30px;" __cid="cbUfAVz"> 
                                <i xid="i6" class="my my-shouyi cbUfAVz" __cid="cbUfAVz"></i> 
                              </div>  
                              <div class="x-col cbUfAVz" xid="col18" __cid="cbUfAVz"> 
                                <span xid="span15" __cid="cbUfAVz" class="cbUfAVz">节省了35.32元</span> 
                              </div> 
                            </div>  
                            <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row12" style="color:#ff4665;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                              <div class="x-col x-col-fixed cbUfAVz" xid="col21" style="width:30px;" __cid="cbUfAVz"> 
                                <i xid="i7" class="my my-tixian1 cbUfAVz" __cid="cbUfAVz"></i> 
                              </div>  
                              <div class="x-col cbUfAVz" xid="col20" __cid="cbUfAVz"> 
                                <span xid="span16" __cid="cbUfAVz" class="cbUfAVz">获得35.32元返现</span> 
                              </div> 
                            </div>  
                            <div component="$model/UI2/system/components/justep/list/list" class="x-list cbUfAVz" xid="list4" style="border-top-style:solid;border-top-width:1px;border-top-color:#f6f6f6;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;buycarData&#34;,&#34;filter&#34;:&#34;$row.val(\&#34;number\&#34;) &gt; 0  &amp;&amp;  $row.val(\&#34;producttype\&#34;) == 1&#34;}" __cid="cbUfAVz"> 
                              <ul class="x-list-template hide cbUfAVz" xid="listTemplateUl6" __cid="cbUfAVz" data-bind="foreach:{data:$model.foreach_list4($element),afterRender:$model.foreach_afterRender_list4.bind($model,$element)}"> 
                                <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row6" style="padding-bottom:0px;padding-top:5px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                  <div class="x-col x-col-25 cbUfAVz" xid="col16" __cid="cbUfAVz"> 
                                    <img src=" " alt="" xid="image2" style="width:100%;" class="imageradius cbUfAVz" __cid="cbUfAVz" data-bind="attr:{src:val(&#34;cover&#34;)}"> 
                                  </div>  
                                  <div class="x-col lastborder cbUfAVz" xid="col13" style="padding:0px;" __cid="cbUfAVz"> 
                                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row8" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                      <div class="x-col cbUfAVz" xid="col9" __cid="cbUfAVz"> 
                                        <span xid="span13" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:val(&#34;name&#34;)"></span>  
                                        <span xid="span8" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:val(&#34;subtitle&#34;)"></span> 
                                      </div> 
                                    </div>  
                                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row7" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                      <div class="x-col cbUfAVz" xid="col14" style="padding-top:0px;padding-bottom:0px;" __cid="cbUfAVz"> 
                                        <div component="$model/UI2/system/components/justep/list/list" class="x-list cbUfAVz" xid="list6" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activeData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cbUfAVz"> 
                                          <ul class="x-list-template hide cbUfAVz" xid="listTemplateUl5" __cid="cbUfAVz" data-bind="foreach:{data:$model.foreach_list6($element),afterRender:$model.foreach_afterRender_list6.bind($model,$element)}"> 
                                            <span xid="span9" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cbUfAVz" class="cbUfAVz" data-bind="text:val(&#34;active&#34;)"></span> 
                                          </ul> 
                                        </div> 
                                      </div> 
                                    </div>  
                                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row10" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                      <div xid="col11" style="padding:5px;" __cid="cbUfAVz" class="cbUfAVz"> 
                                        <div component="$model/UI2/system/components/justep/list/list" class="x-list cbUfAVz" xid="list5" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cbUfAVz"> 
                                          <ul class="x-list-template hide cbUfAVz" xid="listTemplateUl4" __cid="cbUfAVz" data-bind="foreach:{data:$model.foreach_list5($element),afterRender:$model.foreach_afterRender_list5.bind($model,$element)}"> 
                                            <span xid="span11" style="font-size:small;" class="text-muted cbUfAVz" __cid="cbUfAVz" data-bind="text:val(&#34;selectcondition_name&#34;)"></span> 
                                          </ul> 
                                        </div> 
                                      </div>  
                                      <div class="x-col cbUfAVz" xid="col8" __cid="cbUfAVz"> 
                                        <i xid="i3" class="linear linear-chevrondown text-muted cbUfAVz" style="font-size:x-small;" __cid="cbUfAVz" data-bind="visible:val(&#34;hasoptional&#34;) &gt; 0"></i> 
                                      </div> 
                                    </div>  
                                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row9" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                                      <div class="x-col cbUfAVz" xid="col12" __cid="cbUfAVz"> 
                                        <span xid="span12" style="font-size:large;" class="text-muted cbUfAVz" __cid="cbUfAVz">￥0</span>  
                                        <span xid="span14" class="text-muted cbUfAVz" style="text-decoration:line-through;margin-left:5px;" __cid="cbUfAVz" data-bind="text:'￥' + (parseFloat(val(&#34;price&#34;)) + parseFloat(val(&#34;discount&#34;))),visible:false"></span> 
                                      </div>  
                                      <div class="x-col text-right cbUfAVz" xid="col10" __cid="cbUfAVz"> 
                                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cbUfAVz" xid="button2" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:false" data-events="onClick:subBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-remove&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cbUfAVz"> 
                                          <i xid="i5" class="icon-android-remove cbUfAVz" __cid="cbUfAVz"></i>  
                                          <span xid="span6" __cid="cbUfAVz" class="cbUfAVz"></span> 
                                        </a>  
                                        <label xid="label1" style="font-weight:normal;width:30px;" class="text-center cbUfAVz" __cid="cbUfAVz" data-bind="text:'×' + val(&#34;number&#34;)">1</label>  
                                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cbUfAVz" xid="button1" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:false" data-events="onClick:addBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-add&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cbUfAVz"> 
                                          <i xid="i2" class="icon-android-add cbUfAVz" __cid="cbUfAVz"></i>  
                                          <span xid="span7" __cid="cbUfAVz" class="cbUfAVz"></span> 
                                        </a> 
                                      </div> 
                                    </div> 
                                  </div> 
                                </div> 
                              </ul> 
                            </div> 
                          </div> 
                        </div>  
                        <div class="x-panel-bottom cbUfAVz" xid="bottom1" style="border-top-style:solid;border-top-color:#f6f6f6;border-top-width:1px;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cbUfAVz"> 
                          <div component="$model/UI2/system/components/justep/row/row" class="x-row cbUfAVz" xid="row13" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cbUfAVz"> 
                            <div class="x-col x-col-20 text-center cbUfAVz" xid="col22" style="padding-top:0px;" __cid="cbUfAVz"> 
                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link cbUfAVz" xid="button4" style="color:#555555;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;glyphicon glyphicon-trash&#34;,&#34;label&#34;:&#34;清空&#34;}" __cid="cbUfAVz"> 
                                <i xid="i9" class="glyphicon glyphicon-trash cbUfAVz" __cid="cbUfAVz"></i>  
                                <span xid="span20" __cid="cbUfAVz" class="cbUfAVz">清空</span> 
                              </a> 
                            </div>  
                            <div class="x-col text-right cbUfAVz" xid="col23" style="padding-top:9px;" __cid="cbUfAVz"> 
                              <label xid="label2" style="height:30px;border-right-style:solid;border-right-width:1px;border-right-color:#f6f6f6;margin-top:-5px;" class="pull-left cbUfAVz" __cid="cbUfAVz"></label>  
                              <span xid="span18" __cid="cbUfAVz" class="cbUfAVz">合计：</span>  
                              <span xid="span19" style="color:#fe2e23;" __cid="cbUfAVz" class="cbUfAVz"></span> 
                            </div>  
                            <div class="x-col cbUfAVz" xid="col24" style="padding-top:0px;" __cid="cbUfAVz"> 
                              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block surebtn cbUfAVz" xid="settleBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:settleBtnClick" data-config="{&#34;label&#34;:&#34;结算&#34;}" __cid="cbUfAVz"> 
                                <i xid="i8" __cid="cbUfAVz" class="cbUfAVz"></i>  
                                <span xid="span17" __cid="cbUfAVz" class="cbUfAVz">结算</span> 
                              </a> 
                            </div> 
                          </div> 
                        </div>  
                        <style __cid="cbUfAVz" class="cbUfAVz">.x-panel.pcbQf2I3-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pcbQf2I3-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pcbQf2I3-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcbQf2I3-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcbQf2I3-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pcbQf2I3-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcbQf2I3-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcbQf2I3-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcbQf2I3-iosstatusbar >.x-panel-content {top: 48px;}</style> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div class="x-contents-content cnAbMrm" xid="owercontent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cnAbMrm"> 
                  <div component="$model/UI2/system/components/justep/windowContainer/windowContainer" class="x-window-container cnAbMrm" xid="windowContainer3" __component-context__="block" data-bind="component:{name:'$model/UI2/system/components/justep/windowContainer/windowContainer'}" data-config="{&#34;src&#34;:&#34;$model/UI2/flowerfront/ower/ower.w&#34;}" __cid="cnAbMrm"> 
                    <div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cY7NN7z" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cY7NN7z" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/panel/panel,"> 
                      <style>.topimg.cY7NN7z{background-image: url(../flowerfront/image/ower_back.png); background-repeat: no-repeat; background-size: 100% 100%; -moz-background-size: 100% 100%} .fronthead.cY7NN7z{border-radius: 50%; width: 50px} .backhead.cY7NN7z{border-radius: 50%; border: solid 1px rgb(255, 255, 255); width: 60px; height: 60px; padding-top: 4px} .angle.cY7NN7z{position: absolute; top: 0px; margin-top: 12px; border: 1px solid rgb(255, 66, 86); font-weight: lighter; font-size: x-small; color: rgb(255, 66, 86); background: rgb(255, 255, 255); -webkit-background-clip: none; -webkit-text-fill-color: rgb(255, 66, 86); border-radius: 10px; padding-left: 6px; padding-right: 6px; padding-top: 2px; padding-bottom: 1px} .btnclass.cY7NN7z{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent} .btnangleBox.cY7NN7z{width: 55px; position: relative} .btnangle.cY7NN7z{position: absolute; top: 5px; right: 0px; border: 1px solid rgb(255, 66, 86); font-weight: lighter; font-size: x-small; color: rgb(255, 66, 86); background: rgb(255, 255, 255); -webkit-background-clip: none; -webkit-text-fill-color: rgb(255, 66, 86); border-radius: 10px; padding-left: 6px; padding-right: 6px; padding-top: 2px; padding-bottom: 1px} .bottom-line.cY7NN7z{border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: rgb(246, 246, 246)}</style>  
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
                                  <img src="../flowerfront/image/user-192.png" alt="" xid="image1" class="fronthead cY7NN7z" __cid="cY7NN7z"> 
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
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="x-panel-bottom cnAbMrm" xid="bottom1" style="border-top-style:solid;border-top-width:0px;border-top-color:#f6f6f6;" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cnAbMrm"> 
              <div component="$model/UI2/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower cnAbMrm" xid="buttonGroup1" data-bind="component:{name:'$model/UI2/system/components/justep/button/buttonGroup'}" data-config="{&#34;tabbed&#34;:true}" __cid="cnAbMrm"> 
                <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cnAbMrm" xid="button1" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-songhua&#34;,&#34;label&#34;:&#34;首页&#34;,&#34;target&#34;:&#34;topsalecontent&#34;}" __cid="cnAbMrm"> 
                  <i xid="i1" class="my my-songhua cnAbMrm" __cid="cnAbMrm"></i>  
                  <span xid="span1" __cid="cnAbMrm" class="cnAbMrm">首页</span> 
                </a>  
                <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cnAbMrm" xid="button2" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-fenlei&#34;,&#34;label&#34;:&#34;全部商品&#34;,&#34;target&#34;:&#34;productcontent&#34;}" __cid="cnAbMrm"> 
                  <i xid="i2" class="my my-fenlei cnAbMrm" __cid="cnAbMrm"></i>  
                  <span xid="span2" __cid="cnAbMrm" class="cnAbMrm">全部商品</span> 
                </a>  
                <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cnAbMrm" xid="button3" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:button3Click" data-config="{&#34;icon&#34;:&#34;my my-gouwuche&#34;,&#34;label&#34;:&#34;购物车&#34;,&#34;target&#34;:&#34;buycarcontent&#34;}" __cid="cnAbMrm"> 
                  <i xid="i3" class="my my-gouwuche cnAbMrm" __cid="cnAbMrm"></i>  
                  <span xid="span3" __cid="cnAbMrm" class="cnAbMrm">购物车</span>  
                  <div xid="div2" class="text-center displaynone cnAbMrm" __cid="cnAbMrm"> 
                    <label xid="label2" class="angle cnAbMrm" style="display:none;" __cid="cnAbMrm">0</label> 
                  </div> 
                </a>  
                <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cnAbMrm" xid="button4" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;my my-gerenzhongxin1&#34;,&#34;label&#34;:&#34;个人中心&#34;,&#34;target&#34;:&#34;owercontent&#34;}" __cid="cnAbMrm"> 
                  <i xid="i4" class="my my-gerenzhongxin1 cnAbMrm" __cid="cnAbMrm"></i>  
                  <span xid="span4" __cid="cnAbMrm" class="cnAbMrm">个人中心</span> 
                </a> 
              </div> 
            </div>  
            <style __cid="cnAbMrm" class="cnAbMrm">.x-panel.pcRvMfae-iosstatusbar >.x-panel-top {height: 0px;}.x-panel.pcRvMfae-iosstatusbar >.x-panel-content { top: 0px;bottom: nullpx;}.x-panel.pcRvMfae-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcRvMfae-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcRvMfae-iosstatusbar >.x-panel-top {height: 0px;}.iosstatusbar .x-panel.pcRvMfae-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcRvMfae-iosstatusbar >.x-panel-content { top: 0px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcRvMfae-iosstatusbar >.x-panel-top {height: 0px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcRvMfae-iosstatusbar >.x-panel-content {top: 0px;}</style> 
          </div> 
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
        
        <script id="_requireJS" src="../system/lib/require/require.2.1.10.js"> </script>
        <script src="../system/core.min.js"></script><script src="../system/common.min.js"></script><script src="../system/components/comp.min.js"></script><script id="_mainScript">
        
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
    				baseUrl: window.__justep.__ResourceEngine.contextPath + '/flowerfront',
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
    				context.model = '$model/UI2/flowerfront/index.w' + (document.location.search || "");
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