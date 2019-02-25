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
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cb6V7ve" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cb6V7ve" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/scrollView/scrollView,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/button/toggle,$model/UI2/system/components/justep/messageDialog/messageDialog,$model/UI2/system/components/justep/panel/panel,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,">
  <style>.givebackcolor.cb6V7ve{background: rgb(246, 246, 246)} .process-btn.cb6V7ve{background: transparent; color: rgb(153, 153, 153); border-radius: 20px; border-color: rgb(240, 240, 240); margin-left: 5px} .Yes.cb6V7ve{} .x-modal-button.cb6V7ve{color: rgb(85, 85, 85)} .surebtn.cb6V7ve{border-radius: 0px; border: 0px; background: linear-gradient(to bottom, rgb(255, 108, 160), rgb(255, 66, 86))} .x-popOver-content.cb6V7ve{bottom: 0px !important} .x-toggle.cb6V7ve input.cb6V7ve:checked + label.cb6V7ve{background-color: rgb(255, 70, 101); line-height: -1em} .wxcolor.cb6V7ve{background: rgb(68, 181, 73); border-color: rgb(68, 181, 73)} .input-class.cb6V7ve{border: 0px} .input-class.cb6V7ve:focus{box-shadow: 0 0 0px rgba(102, 175, 233, 0)} .row-class.cb6V7ve{border-bottom: solid 1px rgb(246, 246, 246); padding-top: 5px; padding-bottom: 0px}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="cb6V7ve" class="cb6V7ve"></div>  
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcV77ryy-iosstatusbar cb6V7ve" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cb6V7ve"> 
    <div class="x-panel-top cb6V7ve" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cb6V7ve"> 
      <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cb6V7ve" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;待评价&#34;}" __cid="cb6V7ve"> 
        <div class="x-titlebar-left cb6V7ve" style="color:#333333;" __cid="cb6V7ve"> 
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cb6V7ve" xid="backBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:{operation:'window.close'}" data-config="{&#34;icon&#34;:&#34;icon-chevron-left&#34;,&#34;label&#34;:&#34;&#34;}" __cid="cb6V7ve"> 
            <i class="icon-chevron-left cb6V7ve" __cid="cb6V7ve"></i>  
            <span __cid="cb6V7ve" class="cb6V7ve"></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title cb6V7ve" style="font-weight:normal;color:#333333;" __cid="cb6V7ve">待评价</div>  
        <div class="x-titlebar-right  cb6V7ve" __cid="cb6V7ve">
          <div class="empty cb6V7ve" __cid="cb6V7ve"></div>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards  x-scroll-view cb6V7ve" xid="content1" _xid="C848A2A98F600001FA32D660193017DC" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cb6V7ve"> 
      <div class="x-scroll cb6V7ve" component="$model/UI2/system/components/justep/scrollView/scrollView" xid="scrollView1" data-bind="component:{name:'$model/UI2/system/components/justep/scrollView/scrollView'}" data-events="onPullDown:scrollView1PullDown;onPullUp:scrollView1PullUp" data-config="{&#34;noMoreLoadLabel&#34;:&#34;　&#34;}" __cid="cb6V7ve"> 
        <div class="x-content-center x-pull-down container cb6V7ve" xid="div4" __cid="cb6V7ve"> 
          <i class="x-pull-down-img glyphicon x-icon-pull-down cb6V7ve" xid="i5" __cid="cb6V7ve"></i>  
          <span class="x-pull-down-label cb6V7ve" xid="span17" __cid="cb6V7ve">下拉刷新...</span>
        </div>  
        <div class="x-scroll-content cb6V7ve" xid="div5" __cid="cb6V7ve">
          <div component="$model/UI2/system/components/justep/list/list" class="x-list cb6V7ve" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;orderData&#34;}" __cid="cb6V7ve"> 
            <ul class="x-list-template hide cb6V7ve" xid="listTemplateUl1" style="padding:5px;" __cid="cb6V7ve" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
              <div xid="div1" style="background-color:white;border-radius:5px;margin-bottom:10px;" __cid="cb6V7ve" class="cb6V7ve">
                <div component="$model/UI2/system/components/justep/list/list" class="x-list cb6V7ve" xid="list2" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;orderdetailData&#34;,&#34;disableInfiniteLoad&#34;:true,&#34;disablePullToRefresh&#34;:true,&#34;filter&#34;:&#34; $row.val(\&#34;order_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cb6V7ve"> 
                  <ul class="x-list-template hide cb6V7ve" xid="listTemplateUl2" __cid="cb6V7ve" data-bind="foreach:{data:$model.foreach_list2($element),afterRender:$model.foreach_afterRender_list2.bind($model,$element)}"> 
                    <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row1" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},css:val(&#34;producttype&#34;) == 1 ? 'givebackcolor' : ''" __cid="cb6V7ve"> 
                      <div class="x-col x-col-25 cb6V7ve" xid="col1" __cid="cb6V7ve">
                        <img src=" " alt="" xid="image1" style="width:100%;" __cid="cb6V7ve" class="cb6V7ve" data-bind="attr:{src:val(&#34;cover&#34;)}">
                      </div>  
                      <div class="x-col cb6V7ve" xid="col2" __cid="cb6V7ve">
                        <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row2" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                          <div class="x-col cb6V7ve" xid="col4" style="padding:0px;" __cid="cb6V7ve">
                            <span xid="span1" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:val(&#34;name&#34;)"></span>  
                            <span xid="span2" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:val(&#34;subtitle&#34;)"></span>
                          </div> 
                        </div>  
                        <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row4" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                          <div class="x-col cb6V7ve" xid="col5" style="padding:0px;padding-top:5px;" __cid="cb6V7ve">
                            <div component="$model/UI2/system/components/justep/list/list" class="x-list cb6V7ve" xid="list3" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;,&#34;disableInfiniteLoad&#34;:true,&#34;disablePullToRefresh&#34;:true,&#34;filter&#34;:&#34; $row.val(\&#34;orderdetail_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cb6V7ve"> 
                              <ul class="x-list-template hide cb6V7ve" xid="listTemplateUl3" __cid="cb6V7ve" data-bind="foreach:{data:$model.foreach_list3($element),afterRender:$model.foreach_afterRender_list3.bind($model,$element)}"> 
                                <span xid="span4" class="text-muted cb6V7ve" style="font-size:small;" __cid="cb6V7ve" data-bind="text:val(&#34;selectcondition_name&#34;)"></span>
                              </ul> 
                            </div>
                          </div> 
                        </div>  
                        <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row5" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                          <div class="x-col cb6V7ve" xid="col9" style="padding:0px;padding:5px;" __cid="cb6V7ve">
                            <div component="$model/UI2/system/components/justep/list/list" class="x-list cb6V7ve" xid="list5" style="margin-left:-4px;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activeData&#34;,&#34;disableInfiniteLoad&#34;:true,&#34;disablePullToRefresh&#34;:true,&#34;filter&#34;:&#34; $row.val(\&#34;orderdetail_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cb6V7ve"> 
                              <ul class="x-list-template hide cb6V7ve" xid="listTemplateUl5" __cid="cb6V7ve" data-bind="foreach:{data:$model.foreach_list5($element),afterRender:$model.foreach_afterRender_list5.bind($model,$element)}"> 
                                <span xid="span24" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:val(&#34;active&#34;)"></span>
                              </ul> 
                            </div>
                          </div> 
                        </div>
                      </div>  
                      <div class="x-col x-col-fixed cb6V7ve" xid="col3" style="width:80px;" __cid="cb6V7ve">
                        <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row3" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                          <div class="x-col text-right cb6V7ve" xid="col7" style="padding:0px;" __cid="cb6V7ve">
                            <span xid="span3" style="color:#ff9c50;" __cid="cb6V7ve" class="cb6V7ve" data-bind="visible:$index() == 0,text:val(&#34;ordermessage&#34;)">交易成功</span>  
                            <span xid="span7" __cid="cb6V7ve" class="cb6V7ve" data-bind="visible:$index() != 0">　</span>
                          </div> 
                        </div>  
                        <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row7" style="padding-top:5px;padding-right:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                          <div class="x-col text-right cb6V7ve" xid="col15" style="padding-right:0px;" __cid="cb6V7ve">
                            <span xid="span6" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:'￥' + val(&#34;price&#34;)"></span>
                          </div> 
                        </div>  
                        <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row8" style="padding:0px;padding-right:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                          <div class="x-col text-right cb6V7ve" xid="col18" style="padding:0px;padding-right:0px;" __cid="cb6V7ve">
                            <span xid="span8" class="text-muted cb6V7ve" __cid="cb6V7ve" data-bind="text:'×' + val(&#34;number&#34;)"></span>
                          </div> 
                        </div>
                      </div>
                    </div>
                  </ul> 
                </div>  
                <div component="$model/UI2/system/components/justep/row/row" class="x-row text-muted cb6V7ve" xid="row9" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'},visible:val(&#34;discount&#34;) &gt; 0  ||  val(&#34;owerprofit&#34;) &gt; 0" __cid="cb6V7ve"> 
                  <div class="x-col cb6V7ve" xid="col6" __cid="cb6V7ve">
                    <i xid="i6" class="my my-shouyi cb6V7ve" __cid="cb6V7ve" data-bind="visible:val(&#34;discount&#34;) &gt; 0"></i>  
                    <span xid="span10" style="margin-right:10px;" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:'节省￥' + val(&#34;discount&#34;) + '元',visible:val(&#34;discount&#34;) &gt; 0"></span>  
                    <i xid="i7" class="my my-tixian1 cb6V7ve" __cid="cb6V7ve" data-bind="visible:val(&#34;owerprofit&#34;) &gt; 0"></i>  
                    <span xid="span11" style="margin-right:10px;" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:'获得￥' + val(&#34;owerprofit&#34;) + '元返现',visible:val(&#34;owerprofit&#34;) &gt; 0"></span>
                  </div> 
                </div>
                <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row6" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                  <div class="x-col text-right cb6V7ve" xid="col12" __cid="cb6V7ve">
                    <span xid="span5" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:'共计' +   val(&#34;detailcount&#34;) + '件商品 合计：￥'">共计1件商品</span>  
                    <span xid="span9" style="font-size:medium;" __cid="cb6V7ve" class="cb6V7ve" data-bind="text:val(&#34;paysum&#34;)"></span>
                  </div> 
                </div>  
                <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row10" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
                  <div class="x-col text-right cb6V7ve" xid="col11" __cid="cb6V7ve">
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm process-btn cb6V7ve" xid="expressBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:val(&#34;orderstatus&#34;) == 2" data-events="onClick:expressBtnClick" data-config="{&#34;label&#34;:&#34;查看物流&#34;}" __cid="cb6V7ve"> 
                      <i xid="i8" __cid="cb6V7ve" class="cb6V7ve"></i>  
                      <span xid="span19" __cid="cb6V7ve" class="cb6V7ve">查看物流</span>
                    </a>
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm process-btn cb6V7ve" xid="commentBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:val(&#34;orderstatus&#34;) == 3" data-events="onClick:commentBtnClick" data-config="{&#34;label&#34;:&#34;评价商品&#34;}" __cid="cb6V7ve"> 
                      <i xid="i1" __cid="cb6V7ve" class="cb6V7ve"></i>  
                      <span xid="span12" __cid="cb6V7ve" class="cb6V7ve">评价商品</span>
                    </a>  
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm process-btn cb6V7ve" xid="receiptBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:val(&#34;orderstatus&#34;) == 2" data-events="onClick:receiptBtnClick" data-config="{&#34;label&#34;:&#34;确认收货&#34;}" __cid="cb6V7ve"> 
                      <i xid="i2" __cid="cb6V7ve" class="cb6V7ve"></i>  
                      <span xid="span13" __cid="cb6V7ve" class="cb6V7ve">确认收货</span>
                    </a>  
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm process-btn cb6V7ve" xid="paynowBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:val(&#34;orderstatus&#34;) == 0" data-events="onClick:paynowBtnClick" data-config="{&#34;label&#34;:&#34;立即支付&#34;}" __cid="cb6V7ve"> 
                      <i xid="i3" __cid="cb6V7ve" class="cb6V7ve"></i>  
                      <span xid="span14" __cid="cb6V7ve" class="cb6V7ve">立即支付</span>
                    </a>  
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm process-btn cb6V7ve" xid="deleteBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:val(&#34;orderstatus&#34;) == 0" data-events="onClick:deleteBtnClick" data-config="{&#34;label&#34;:&#34;删除订单&#34;}" __cid="cb6V7ve"> 
                      <i xid="i4" __cid="cb6V7ve" class="cb6V7ve"></i>  
                      <span xid="span15" __cid="cb6V7ve" class="cb6V7ve">删除订单</span>
                    </a> 
                  </div> 
                </div>
              </div>
            </ul> 
          </div>
        </div>  
        <div class="x-content-center x-pull-up cb6V7ve" xid="div6" __cid="cb6V7ve"> 
          <span class="x-pull-up-label cb6V7ve" xid="span18" __cid="cb6V7ve">加载更多...</span>
        </div> 
      </div>
    </div>  
    <style __cid="cb6V7ve" class="cb6V7ve">.x-panel.pcV77ryy-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pcV77ryy-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pcV77ryy-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcV77ryy-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcV77ryy-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pcV77ryy-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcV77ryy-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcV77ryy-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcV77ryy-iosstatusbar >.x-panel-content {top: 48px;}</style>
  </div>  
  <span component="$model/UI2/system/components/justep/messageDialog/messageDialog" xid="deletemessageDialog" data-bind="component:{name:'$model/UI2/system/components/justep/messageDialog/messageDialog'}" data-events="onNo:deletemessageDialogNo" data-config="{&#34;message&#34;:&#34;确认删除订单？&#34;,&#34;type&#34;:&#34;YesNo&#34;}" __cid="cb6V7ve" class="cb6V7ve">
    <div class="x-modal-overlay cb6V7ve" __cid="cb6V7ve"></div>
    <div class="x-modal cb6V7ve" __cid="cb6V7ve">
      <div class="x-modal-inner cb6V7ve" __cid="cb6V7ve">
        <div class="x-modal-title cb6V7ve" __cid="cb6V7ve"></div>
        <div class="x-modal-text cb6V7ve" __cid="cb6V7ve">确认删除订单？</div>
        <input class="x-modal-prompt-input cb6V7ve" type="text" __cid="cb6V7ve">
      </div>
      <div class="x-modal-buttons cb6V7ve" __cid="cb6V7ve">
        <a class="x-modal-button x-modal-button-bold OK cb6V7ve" value="ok" __cid="cb6V7ve">确定</a>
        <a class="x-modal-button x-modal-button-bold Yes cb6V7ve" value="yes" __cid="cb6V7ve">是</a>
        <a class="x-modal-button x-modal-button-bold No cb6V7ve" value="no" __cid="cb6V7ve">否</a>
        <a class="x-modal-button x-modal-button-bold Cancel cb6V7ve" value="cancel" __cid="cb6V7ve">取消</a>
      </div>
    </div>
  </span>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver cb6V7ve" xid="popOver1" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;position&#34;:&#34;bottom&#34;}" __cid="cb6V7ve"> 
    <div class="x-popOver-overlay cb6V7ve" xid="div2" __cid="cb6V7ve"></div>  
    <div class="x-popOver-content cb6V7ve" xid="div3" style="background-color:white;width:100%;height:70%;" __cid="cb6V7ve"> 
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row14" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
        <div class="x-col cb6V7ve" xid="col23" __cid="cb6V7ve"></div>  
        <div class="x-col text-center cb6V7ve" xid="col24" __cid="cb6V7ve"> 
          <span xid="span20" style="font-size:medium;" __cid="cb6V7ve" class="cb6V7ve">确认付款</span>
        </div>  
        <div class="x-col text-right cb6V7ve" xid="col25" __cid="cb6V7ve"> 
          <i xid="i9" class="linear linear-cross text-muted cb6V7ve" __cid="cb6V7ve" data-bind="event:{click:$model._callModelFn.bind($model, 'i9Click')}"></i>
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row15" style="margin-top:20px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
        <div class="x-col cb6V7ve" xid="col26" __cid="cb6V7ve"></div>  
        <div class="x-col text-center cb6V7ve" xid="col27" __cid="cb6V7ve"> 
          <span xid="span23" style="color:#fe2e23;font-size:x-large;" __cid="cb6V7ve" class="cb6V7ve">￥0.00</span>
        </div>  
        <div class="x-col cb6V7ve" xid="col28" __cid="cb6V7ve"></div>
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row16" style="margin-top:20px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
        <div class="x-col x-col-25 cb6V7ve" xid="col29" __cid="cb6V7ve"> 
          <span xid="span16" __cid="cb6V7ve" class="cb6V7ve">余额抵扣</span>
        </div>  
        <div class="x-col text-center cb6V7ve" xid="col30" __cid="cb6V7ve"> 
          <span xid="span25" __cid="cb6V7ve" class="cb6V7ve">可用余额：￥0.00</span>
        </div>  
        <div class="x-col x-col-25 text-right cb6V7ve" xid="col31" __cid="cb6V7ve"> 
          <span component="$model/UI2/system/components/justep/button/toggle" class="x-toggle cb6V7ve" xid="toggle1" style="display: inline-block;padding:0px;" ON="　" OFF="　" data-config="{&#34;checked&#34;:false,&#34;disabled&#34;:false,&#34;label&#34;:{&#34;off&#34;:&#34;　&#34;,&#34;on&#34;:&#34;　&#34;}}" data-bind="component:{name:'$model/UI2/system/components/justep/button/toggle'}" data-events="onChange:toggle1Change" __cid="cb6V7ve">
            <input type="checkbox" __cid="cb6V7ve" class="cb6V7ve">
            <label data-on="　" data-off="　" __cid="cb6V7ve" class="cb6V7ve">
              <span __cid="cb6V7ve" class="cb6V7ve"></span>
            </label>
          </span>
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cb6V7ve" xid="row17" style="position:absolute;bottom:20px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cb6V7ve"> 
        <div class="x-col cb6V7ve" xid="col32" __cid="cb6V7ve"> 
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block wxcolor cb6V7ve" xid="payBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;立即支付&#34;}" __cid="cb6V7ve"> 
            <i xid="i10" __cid="cb6V7ve" class="cb6V7ve"></i>  
            <span xid="span26" __cid="cb6V7ve" class="cb6V7ve">立即支付</span>
          </a> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$model/UI2/system/components/justep/messageDialog/messageDialog" xid="receiptmessageDialog" data-bind="component:{name:'$model/UI2/system/components/justep/messageDialog/messageDialog'}" data-events="onNo:receiptmessageDialogNo;onYes:receiptmessageDialogYes" data-config="{&#34;message&#34;:&#34;确认已收到此订单商品&#34;,&#34;type&#34;:&#34;YesNo&#34;}" __cid="cb6V7ve" class="cb6V7ve">
    <div class="x-modal-overlay cb6V7ve" __cid="cb6V7ve"></div>
    <div class="x-modal cb6V7ve" __cid="cb6V7ve">
      <div class="x-modal-inner cb6V7ve" __cid="cb6V7ve">
        <div class="x-modal-title cb6V7ve" __cid="cb6V7ve"></div>
        <div class="x-modal-text cb6V7ve" __cid="cb6V7ve">确认已收到此订单商品</div>
        <input class="x-modal-prompt-input cb6V7ve" type="text" __cid="cb6V7ve">
      </div>
      <div class="x-modal-buttons cb6V7ve" __cid="cb6V7ve">
        <a class="x-modal-button x-modal-button-bold OK cb6V7ve" value="ok" __cid="cb6V7ve">确定</a>
        <a class="x-modal-button x-modal-button-bold Yes cb6V7ve" value="yes" __cid="cb6V7ve">是</a>
        <a class="x-modal-button x-modal-button-bold No cb6V7ve" value="no" __cid="cb6V7ve">否</a>
        <a class="x-modal-button x-modal-button-bold Cancel cb6V7ve" value="cancel" __cid="cb6V7ve">取消</a>
      </div>
    </div>
  </span>
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
    				context.model = '$model/UI2/flowerfront/ower/uncomment.w' + (document.location.search || "");
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