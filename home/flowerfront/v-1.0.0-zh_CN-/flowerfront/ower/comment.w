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
    <link rel="stylesheet" href="../../system/components/bootstrap.min.css" include="$model/UI2/system/components/bootstrap/lib/css/bootstrap,$model/UI2/system/components/bootstrap/lib/css/bootstrap-theme"><link rel="stylesheet" href="../../system/components/comp.min.css" include="$model/UI2/system/components/justep/lib/css2/dataControl,$model/UI2/system/components/justep/input/css/datePickerPC,$model/UI2/system/components/justep/messageDialog/css/messageDialog,$model/UI2/system/components/justep/lib/css3/round,$model/UI2/system/components/justep/input/css/datePicker,$model/UI2/system/components/justep/row/css/row,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/attachment/css/attachment,$model/UI2/system/components/justep/barcode/css/barcodeImage,$model/UI2/system/components/bootstrap/dropdown/css/dropdown,$model/UI2/system/components/justep/contents/css/contents,$model/UI2/system/components/justep/common/css/forms,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/locker/css/locker,$model/UI2/system/components/justep/menu/css/menu,$model/UI2/system/components/justep/scrollView/css/scrollView,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/dialog/css/dialog,$model/UI2/system/components/justep/bar/css/bar,$model/UI2/system/components/justep/popMenu/css/popMenu,$model/UI2/system/components/justep/lib/css/icons,$model/UI2/system/components/justep/lib/css4/e-commerce,$model/UI2/system/components/justep/toolBar/css/toolBar,$model/UI2/system/components/justep/popOver/css/popOver,$model/UI2/system/components/justep/panel/css/panel,$model/UI2/system/components/bootstrap/carousel/css/carousel,$model/UI2/system/components/justep/wing/css/wing,$model/UI2/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/UI2/system/components/justep/titleBar/css/titleBar,$model/UI2/system/components/justep/lib/css1/linear,$model/UI2/system/components/justep/numberSelect/css/numberList,$model/UI2/system/components/justep/list/css/list,$model/UI2/system/components/justep/dataTables/css/dataTables"></head>
	
    <body style="width:100%;height:100%;margin: 0;">
        <script intro="none"></script>
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cjiErqy" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cjiErqy" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/textarea/textarea,$model/UI2/system/components/justep/panel/panel,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/button/buttonGroup,">
  <style>.fileinput.cjiErqy input.cjiErqy{position: absolute; top: 30%; left: 0px; opacity: 0; -ms-filter: "alpha(opacity=0)"; font-size: 40px} .x-popOver-content.cjiErqy{bottom: 0px !important} .popclose.cjiErqy{background: rgba(85, 85, 85, 0.65); z-index: 1; border-radius: 50%; border: 0px; top: 2px; right: 2px} .delimg.cjiErqy{background: rgba(85, 85, 85, 0.65); border: 0px} .imagediv.cjiErqy{display: -webkit-flex; -webkit-justify-content: center; -webkit-align-items: center} .slidediv.cjiErqy{display: -webkit-flex; -webkit-justify-content: center; -webkit-align-items: center} .input-class.cjiErqy{border: 0px} .input-class.cjiErqy:focus{box-shadow: 0 0 0px rgba(102, 175, 233, 0)} .surebtn.cjiErqy{border: 0px; background: linear-gradient(to bottom, rgb(255, 108, 160), rgb(255, 66, 86))} .x-flower.btn-group.cjiErqy{background-color: rgb(255, 255, 255)} .x-flower.btn-group.cjiErqy .btn.cjiErqy span.cjiErqy{font-weight: normal} .x-card.btn-group.cjiErqy .btn.active.cjiErqy{background: linear-gradient(to bottom, rgb(255, 66, 86), rgb(254, 89, 147)); -webkit-background-clip: text; -webkit-text-fill-color: transparent} .anonymous-active.cjiErqy{color: rgb(254, 89, 147)}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad;onParamsReceive:modelParamsReceive" __cid="cjiErqy" class="cjiErqy"></div>  
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcueqmiq-iosstatusbar cjiErqy" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cjiErqy"> 
    <div class="x-panel-top cjiErqy" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cjiErqy"> 
      <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cjiErqy" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;评价&#34;}" __cid="cjiErqy"> 
        <div class="x-titlebar-left cjiErqy" style="color:#333333;" __cid="cjiErqy"> 
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cjiErqy" xid="backBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:{operation:'window.close'}" data-config="{&#34;icon&#34;:&#34;icon-chevron-left&#34;,&#34;label&#34;:&#34;&#34;}" __cid="cjiErqy"> 
            <i class="icon-chevron-left cjiErqy" __cid="cjiErqy"></i>  
            <span __cid="cjiErqy" class="cjiErqy"></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title cjiErqy" style="font-weight:normal;color:#333333;" __cid="cjiErqy">评价</div>  
        <div class="x-titlebar-right  cjiErqy" __cid="cjiErqy">
          <div class="empty cjiErqy" __cid="cjiErqy"></div>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards cjiErqy" xid="content1" style="overflow: hidden" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cjiErqy">
      <div component="$model/UI2/system/components/justep/list/list" class="x-list cjiErqy" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;imageData&#34;}" __cid="cjiErqy"> 
        <ul class="x-list-template hide cjiErqy" xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1" __cid="cjiErqy" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
          <div xid="div2" class="col-xs-3 col-sm-3 cjiErqy" style="padding:2px;" __cid="cjiErqy">
            <div xid="imagediv" style="background-color: white;overflow: hidden;" class="imagediv cjiErqy" componentname="div(html)" id="undefined_div1" __cid="cjiErqy" data-bind="event:{click:$model._callModelFn.bind($model, 'imagedivClick')}">
              <img src=" " alt="" xid="image1" style="width:100%;" __cid="cjiErqy" class="cjiErqy" data-bind="attr:{src:val(&#34;image&#34;)}">  
              <i xid="i1" class="e-commerce e-commerce-jiahao addi text-muted cjiErqy" style="position:absolute;left:50%;top:50%;" __cid="cjiErqy" data-bind="visible:val(&#34;isnull&#34;) == 1"></i>  
              <span xid="span1" class="fileinput cjiErqy" __cid="cjiErqy" data-bind="visible:val(&#34;isnull&#34;) == 1">
                <input type="file" value="" xid="upload_file" __cid="cjiErqy" class="cjiErqy" data-bind="event:{change:$model._callModelFn.bind($model, 'upload_fileChange')}">
              </span> 
            </div>
          </div>
        </ul> 
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cjiErqy" xid="row3" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col cjiErqy" xid="col5" __cid="cjiErqy"></div>  
        <div class="x-col cjiErqy" xid="col6" __cid="cjiErqy"></div>  
        <div class="x-col cjiErqy" xid="col7" __cid="cjiErqy"></div>
      </div>  
      <div xid="div6" style="background-color:white;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" __cid="cjiErqy" class="cjiErqy">
        <div component="$model/UI2/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified x-flower cjiErqy" xid="buttonGroup1" data-bind="component:{name:'$model/UI2/system/components/justep/button/buttonGroup'}" data-config="{&#34;tabbed&#34;:true}" __cid="cjiErqy"> 
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-left cjiErqy" xid="goodBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:goodBtnClick" data-config="{&#34;icon&#34;:&#34;my2 my2-haoping&#34;,&#34;label&#34;:&#34;好评&#34;}" __cid="cjiErqy"> 
            <i xid="i5" class="my2 my2-haoping cjiErqy" __cid="cjiErqy"></i>  
            <span xid="span6" __cid="cjiErqy" class="cjiErqy">好评</span>
          </a>  
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-left cjiErqy" xid="normalBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:normalBtnClick" data-config="{&#34;icon&#34;:&#34;my2 my2-zhongping&#34;,&#34;label&#34;:&#34;中评&#34;}" __cid="cjiErqy"> 
            <i xid="i6" class="my2 my2-zhongping cjiErqy" __cid="cjiErqy"></i>  
            <span xid="span7" __cid="cjiErqy" class="cjiErqy">中评</span>
          </a>  
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-left cjiErqy" xid="badBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:badBtnClick" data-config="{&#34;icon&#34;:&#34;my2 my2-chaping&#34;,&#34;label&#34;:&#34;差评&#34;}" __cid="cjiErqy"> 
            <i xid="i7" class="my2 my2-chaping cjiErqy" __cid="cjiErqy"></i>  
            <span xid="span9" __cid="cjiErqy" class="cjiErqy">差评</span>
          </a>
        </div>
      </div>
      <div xid="div7" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" __cid="cjiErqy" class="cjiErqy">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cjiErqy" xid="row2" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
          <div class="x-col cjiErqy" xid="col2" __cid="cjiErqy">
            <textarea component="$model/UI2/system/components/justep/textarea/textarea" class="form-control input-class cjiErqy" xid="commenttextarea" data-bind="component:{name:'$model/UI2/system/components/justep/textarea/textarea'}" data-config="{&#34;placeHolder&#34;:&#34;评价内容&#34;}" __cid="cjiErqy"></textarea>
          </div> 
        </div>
      </div>
      <div xid="div8" style="background-color:white;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" __cid="cjiErqy" class="cjiErqy">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center text-muted cjiErqy" xid="anonymousrow" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},event:{click:$model._callModelFn.bind($model, 'anonymousrowClick')}" __cid="cjiErqy"> 
          <div class="x-col x-col-fixed cjiErqy" xid="col19" style="width:20px;" __cid="cjiErqy">
            <i xid="i8" class="my2 my2-niming cjiErqy" style="font-size:medium;" __cid="cjiErqy"></i>
          </div>  
          <div class="x-col cjiErqy" xid="col20" __cid="cjiErqy">
            <span xid="span11" __cid="cjiErqy" class="cjiErqy">匿名</span>
          </div>  
          <div class="x-col text-right cjiErqy" xid="col21" __cid="cjiErqy">
            <i xid="anonymousi" class="my2 my2-xuanzhong cjiErqy" style="display:none;" __cid="cjiErqy"></i>
          </div>
        </div>
      </div>
      <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center cjiErqy" xid="row4" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col x-col-fixed cjiErqy" xid="col10" style="width:80px;" __cid="cjiErqy">
          <span xid="span5" __cid="cjiErqy" class="cjiErqy">描述相符</span>
        </div>  
        <div class="x-col cjiErqy" xid="col8" __cid="cjiErqy">
          <div xid="xiangfudiv" __cid="cjiErqy" class="cjiErqy"></div>
        </div>  
        <div class="x-col x-col-fixed cjiErqy" xid="col9" style="width:80px;" __cid="cjiErqy">
          <span xid="xiangfuspan" __cid="cjiErqy" class="cjiErqy"></span>
        </div>
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center cjiErqy" xid="row6" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col x-col-fixed cjiErqy" xid="col12" style="width:80px;" __cid="cjiErqy"> 
          <span xid="span8" __cid="cjiErqy" class="cjiErqy">物流服务</span>
        </div>  
        <div class="x-col cjiErqy" xid="col3" __cid="cjiErqy"> 
          <div xid="wuliudiv" __cid="cjiErqy" class="cjiErqy"></div>
        </div>  
        <div class="x-col x-col-fixed cjiErqy" xid="col4" style="width:80px;" __cid="cjiErqy"> 
          <span xid="wuliuspan" __cid="cjiErqy" class="cjiErqy"></span>
        </div> 
      </div>
      <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center cjiErqy" xid="row7" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col x-col-fixed cjiErqy" xid="col15" style="width:80px;" __cid="cjiErqy"> 
          <span xid="span10" __cid="cjiErqy" class="cjiErqy">服务态度</span>
        </div>  
        <div class="x-col cjiErqy" xid="col13" __cid="cjiErqy"> 
          <div xid="fuwudiv" __cid="cjiErqy" class="cjiErqy"></div>
        </div>  
        <div class="x-col x-col-fixed cjiErqy" xid="col14" style="width:80px;" __cid="cjiErqy"> 
          <span xid="fuwuspan" __cid="cjiErqy" class="cjiErqy"></span>
        </div> 
      </div>
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cjiErqy" xid="row8" style="height:30px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col cjiErqy" xid="col18" __cid="cjiErqy"></div>  
        <div class="x-col cjiErqy" xid="col16" __cid="cjiErqy"></div>  
        <div class="x-col cjiErqy" xid="col17" __cid="cjiErqy"></div>
      </div>
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cjiErqy" xid="row5" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col cjiErqy" xid="col11" __cid="cjiErqy">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block surebtn cjiErqy" xid="submitBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},event:{click:$model._callModelFn.bind($model, 'submitBtnClick')}" data-config="{&#34;label&#34;:&#34;提交&#34;}" __cid="cjiErqy"> 
            <i xid="i4" __cid="cjiErqy" class="cjiErqy"></i>  
            <span xid="span4" __cid="cjiErqy" class="cjiErqy">提交</span>
          </a>
        </div> 
      </div> 
    </div>  
    <style __cid="cjiErqy" class="cjiErqy">.x-panel.pcueqmiq-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pcueqmiq-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pcueqmiq-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcueqmiq-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcueqmiq-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pcueqmiq-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcueqmiq-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcueqmiq-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcueqmiq-iosstatusbar >.x-panel-content {top: 48px;}</style>
  </div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver cjiErqy" xid="popOver1" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;opacity&#34;:0.9}" __cid="cjiErqy"> 
    <div class="x-popOver-overlay cjiErqy" xid="div1" style="background-color:black;" __cid="cjiErqy"></div>  
    <div class="x-popOver-content cjiErqy" xid="div3" style="width:100%;overflow-y: unset;" __cid="cjiErqy">
      <div xid="div4" class="swiper-container cjiErqy" style="width:100%;" __cid="cjiErqy">
        <div xid="div5" class="swiper-wrapper cjiErqy" __cid="cjiErqy"></div>
      </div>  
      <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-only-icon popclose cjiErqy" xid="closepop" style="position:absolute;color:#ffffff;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:closepopClick" data-config="{&#34;icon&#34;:&#34;linear linear-cross&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cjiErqy"> 
        <i xid="i2" class="linear linear-cross cjiErqy" __cid="cjiErqy"></i>  
        <span xid="span2" __cid="cjiErqy" class="cjiErqy"></span>
      </a>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cjiErqy" xid="row1" style="z-index:1;position:absolute;bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cjiErqy"> 
        <div class="x-col cjiErqy" xid="col1" __cid="cjiErqy">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block delimg cjiErqy" xid="delectimgBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:delectimgBtnClick" data-config="{&#34;label&#34;:&#34;删除照片&#34;}" __cid="cjiErqy"> 
            <i xid="i3" __cid="cjiErqy" class="cjiErqy"></i>  
            <span xid="span3" __cid="cjiErqy" class="cjiErqy">删除照片</span>
          </a>
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
        <script src="../../system/core.min.js"></script><script src="../../system/common.min.js"></script><script src="../../system/components/comp.min.js"></script><script id="_mainScript">
        
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
    				context.model = '$model/UI2/flowerfront/ower/comment.w' + (document.location.search || "");
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