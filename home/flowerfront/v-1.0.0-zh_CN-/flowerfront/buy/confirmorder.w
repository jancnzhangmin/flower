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
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div component="$model/UI2/system/components/justep/window/window" design="device:m;" xid="window" class="window cvMvqQv" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cvMvqQv" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/smartContainer/smartContainer,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/button/toggle,$model/UI2/system/components/justep/textarea/textarea,$model/UI2/system/components/justep/panel/panel,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,">
  <style>.letter.cvMvqQv{width: 100%; padding-bottom: 10px; border: 0px; background: white; border-bottom: 10px solid; border-image: repeating-linear-gradient(-225deg, rgba(255, 0, 0, 0.2) 0, rgba(255, 0, 0, 0.2) 10px, white 10px, white 20px, rgba(85, 136, 170, 0.2) 20px, rgba(85, 136, 170, 0.2) 30px, white 30px, white 40px) 20} .imageradius.cvMvqQv{border-radius: 5px; overflow: hidden} .lastborder.cvMvqQv{border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: rgb(246, 246, 246)} .lastborder.cvMvqQv div.cvMvqQv:last{border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: rgb(246, 246, 246)} .surebtn.cvMvqQv{border-radius: 0px; border: 0px; background: linear-gradient(to bottom, rgb(255, 108, 160), rgb(255, 66, 86))} .x-popOver-content.cvMvqQv{bottom: 0px !important} .x-toggle.cvMvqQv input.cvMvqQv:checked + label.cvMvqQv{background-color: rgb(255, 70, 101); line-height: -1em} .wxcolor.cvMvqQv{background: rgb(68, 181, 73); border-color: rgb(68, 181, 73)} .input-class.cvMvqQv{border: 0px} .input-class.cvMvqQv:focus{box-shadow: 0 0 0px rgba(102, 175, 233, 0)} .row-class.cvMvqQv{border-bottom: solid 1px rgb(246, 246, 246); padding-top: 5px; padding-bottom: 0px}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" data-events="onLoad:modelLoad" __cid="cvMvqQv" class="cvMvqQv"></div>  
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcERrQ3u-iosstatusbar cvMvqQv" xid="panel1" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cvMvqQv"> 
    <div class="x-panel-top cvMvqQv" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cvMvqQv"> 
      <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cvMvqQv" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;确认订单&#34;}" __cid="cvMvqQv"> 
        <div class="x-titlebar-left cvMvqQv" style="color:#333333;" __cid="cvMvqQv"> 
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cvMvqQv" xid="backBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:{operation:'window.close'}" data-config="{&#34;icon&#34;:&#34;icon-chevron-left&#34;,&#34;label&#34;:&#34;&#34;}" __cid="cvMvqQv"> 
            <i class="icon-chevron-left cvMvqQv" __cid="cvMvqQv"></i>  
            <span __cid="cvMvqQv" class="cvMvqQv"></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title cvMvqQv" style="font-weight:normal;color:#333333;" __cid="cvMvqQv">确认订单</div>  
        <div class="x-titlebar-right  cvMvqQv" __cid="cvMvqQv">
          <div class="empty cvMvqQv" __cid="cvMvqQv"></div>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards cvMvqQv" xid="content1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cvMvqQv">
      <div xid="letterdiv" class="letter cvMvqQv" __cid="cvMvqQv" data-bind="event:{click:$model._callModelFn.bind($model, 'letterdivClick')}">
        <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center cvMvqQv" xid="row1" style="padding-top:0px;padding-bottom:0px;margin-bottom:-10px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
          <div class="x-col x-col-fixed cvMvqQv" xid="col1" style="width:20px;" __cid="cvMvqQv">
            <i xid="i1" class="my my-shouhuodizhi1 cvMvqQv" style="font-size:large;" __cid="cvMvqQv"></i>
          </div>  
          <div class="x-col cvMvqQv" xid="col2" __cid="cvMvqQv">
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row2" style="padding-top:0px;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
              <div class="x-col cvMvqQv" xid="col4" __cid="cvMvqQv">
                <span xid="span1" __cid="cvMvqQv" class="cvMvqQv"></span>
              </div>  
              <div class="x-col text-right cvMvqQv" xid="col5" __cid="cvMvqQv">
                <span xid="span2" __cid="cvMvqQv" class="cvMvqQv"></span>
              </div> 
            </div>  
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row3" style="padding-top:0px;padding-bottom:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
              <div class="x-col cvMvqQv" xid="col7" __cid="cvMvqQv">
                <span xid="span3" __cid="cvMvqQv" class="cvMvqQv"></span>
              </div> 
            </div>
          </div>  
          <div class="x-col x-col-fixed text-right cvMvqQv" xid="col3" style="width:20px;" __cid="cvMvqQv">
            <i xid="i2" class="linear linear-chevronright text-muted cvMvqQv" __cid="cvMvqQv"></i>
          </div>
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cvMvqQv" xid="smartContainer1" style="background-color:white;overflow-x: unset;padding-bottom:0px;margin-top:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cvMvqQv"> 
        <div component="$model/UI2/system/components/justep/list/list" class="x-list cvMvqQv" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;buycarData&#34;,&#34;filter&#34;:&#34;$row.val(\&#34;number\&#34;) &gt; 0  &amp;&amp;  $row.val(\&#34;producttype\&#34;) == 0&#34;}" __cid="cvMvqQv"> 
          <ul class="x-list-template hide cvMvqQv" xid="listTemplateUl1" style="overflow:hidden;" __cid="cvMvqQv" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
            <div xid="div2" class="swiper-container cvMvqQv" __cid="cvMvqQv"> 
              <div xid="div5" class="swiper-wrapper cvMvqQv" __cid="cvMvqQv"> 
                <div xid="div6" class="swiper-slide cvMvqQv" __cid="cvMvqQv"> 
                  <div component="$model/UI2/system/components/justep/row/row" class="x-row movrow cvMvqQv" xid="row4" style="padding-bottom:0px;padding-top:5px;z-index:10;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                    <div class="x-col x-col-25 cvMvqQv" xid="col15" __cid="cvMvqQv"> 
                      <img src=" " alt="" xid="image1" style="width:100%;" class="imageradius cvMvqQv" __cid="cvMvqQv" data-bind="attr:{src:val(&#34;cover&#34;)}">
                    </div>  
                    <div class="x-col lastborder cvMvqQv" xid="col13" style="padding:0px;" __cid="cvMvqQv"> 
                      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row6" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                        <div class="x-col cvMvqQv" xid="col6" __cid="cvMvqQv"> 
                          <span xid="span6" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:val(&#34;name&#34;)"></span>  
                          <span xid="span4" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:val(&#34;subtitle&#34;)"></span>
                        </div> 
                      </div>  
                      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row5" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                        <div class="x-col cvMvqQv" xid="col14" style="padding-top:0px;padding-bottom:0px;" __cid="cvMvqQv"> 
                          <div component="$model/UI2/system/components/justep/list/list" class="x-list cvMvqQv" xid="list2" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activeData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cvMvqQv"> 
                            <ul class="x-list-template hide cvMvqQv" xid="listTemplateUl2" __cid="cvMvqQv" data-bind="foreach:{data:$model.foreach_list2($element),afterRender:$model.foreach_afterRender_list2.bind($model,$element)}"> 
                              <span xid="span5" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:val(&#34;active&#34;)"></span>
                            </ul> 
                          </div> 
                        </div> 
                      </div>  
                      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row4" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                        <div xid="col11" style="padding:5px;" __cid="cvMvqQv" class="cvMvqQv"> 
                          <div component="$model/UI2/system/components/justep/list/list" class="x-list cvMvqQv" xid="list3" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cvMvqQv"> 
                            <ul class="x-list-template hide cvMvqQv" xid="listTemplateUl3" __cid="cvMvqQv" data-bind="foreach:{data:$model.foreach_list3($element),afterRender:$model.foreach_afterRender_list3.bind($model,$element)}"> 
                              <span xid="span4" style="font-size:small;" class="text-muted cvMvqQv" __cid="cvMvqQv" data-bind="text:val(&#34;selectcondition_name&#34;)"></span>
                            </ul> 
                          </div> 
                        </div>  
                        <div class="x-col cvMvqQv" xid="col15" __cid="cvMvqQv"> 
                          <i xid="i3" class="linear linear-chevrondown text-muted cvMvqQv" style="font-size:x-small;" __cid="cvMvqQv" data-bind="visible:false"></i>
                        </div> 
                      </div>  
                      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row5" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                        <div class="x-col cvMvqQv" xid="col12" __cid="cvMvqQv"> 
                          <span xid="span5" style="color:#fe2e23;font-size:large;" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:'￥' + val(&#34;price&#34;)"></span>  
                          <span xid="span10" class="text-muted cvMvqQv" style="text-decoration:line-through;margin-left:5px;" __cid="cvMvqQv" data-bind="text:'￥' + (parseFloat(val(&#34;price&#34;)) + parseFloat(val(&#34;discount&#34;))),visible:val(&#34;discount&#34;) &gt; 0"></span>
                        </div>  
                        <div class="x-col text-right cvMvqQv" xid="col10" __cid="cvMvqQv"> 
                          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cvMvqQv" xid="subBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:false" data-events="onClick:subBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-remove&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cvMvqQv"> 
                            <i xid="i4" class="icon-android-remove cvMvqQv" __cid="cvMvqQv"></i>  
                            <span xid="span41" __cid="cvMvqQv" class="cvMvqQv"></span>
                          </a>  
                          <label xid="numberlabel" style="font-weight:normal;width:30px;" class="text-center cvMvqQv" __cid="cvMvqQv" data-bind="text:'×' + val(&#34;number&#34;)">1</label>  
                          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cvMvqQv" xid="addBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:false" data-events="onClick:addBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-add&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cvMvqQv"> 
                            <i xid="i13" class="icon-android-add cvMvqQv" __cid="cvMvqQv"></i>  
                            <span xid="span42" __cid="cvMvqQv" class="cvMvqQv"></span>
                          </a> 
                        </div> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div xid="div7" class="swiper-slide menu cvMvqQv" style="width:160px;" __cid="cvMvqQv"> 
                  <div xid="div2" style="width:160px;z-index:0;position:relative;display: flex;height:100%;" class="mov pull-right cvMvqQv" __cid="cvMvqQv"> 
                    <div xid="collcetiondiv" style="background-color:#ff9c50;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center cvMvqQv" __cid="cvMvqQv" data-bind="event:{click:$model._callModelFn.bind($model, 'collcetiondivClick')}"> 
                      <br xid="default1" __cid="cvMvqQv" class="cvMvqQv">  
                      <span xid="span22" style="white-space:nowrap;width:100%;color:#FFFFFF;" __cid="cvMvqQv" class="cvMvqQv">移入收藏夹</span>
                    </div>  
                    <div xid="deletediv" style="background-color:#ff4256;height:100%;width:50%;display: flex;justify-content:center;align-items:Center;overflow:hidden;" class="text-center cvMvqQv" __cid="cvMvqQv" data-bind="event:{click:$model._callModelFn.bind($model, 'deletedivClick')}"> 
                      <span xid="span21" style="white-space:nowrap;width:100%;color:#FFFFFF;" __cid="cvMvqQv" class="cvMvqQv">删除</span>
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </ul> 
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/smartContainer/smartContainer" class="x-smartcontainer cvMvqQv" xid="smartContainer2" style="background-color:white;overflow-x: unset;padding-bottom:0px;border-radius:5px;" data-bind="component:{name:'$model/UI2/system/components/justep/smartContainer/smartContainer'}" __cid="cvMvqQv"> 
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row11" style="color:#ff4665;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
          <div class="x-col x-col-fixed cvMvqQv" xid="col17" style="width:30px;" __cid="cvMvqQv"> 
            <i xid="i6" class="my my-shouyi cvMvqQv" __cid="cvMvqQv"></i>
          </div>  
          <div class="x-col cvMvqQv" xid="col18" __cid="cvMvqQv"> 
            <span xid="span15" __cid="cvMvqQv" class="cvMvqQv">节省了35.32元</span>
          </div> 
        </div>  
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row12" style="color:#ff4665;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
          <div class="x-col x-col-fixed cvMvqQv" xid="col21" style="width:30px;" __cid="cvMvqQv"> 
            <i xid="i7" class="my my-tixian1 cvMvqQv" __cid="cvMvqQv"></i>
          </div>  
          <div class="x-col cvMvqQv" xid="col20" __cid="cvMvqQv"> 
            <span xid="span16" __cid="cvMvqQv" class="cvMvqQv">获得35.32元返现</span>
          </div> 
        </div>  
        <div component="$model/UI2/system/components/justep/list/list" class="x-list cvMvqQv" xid="list4" style="border-top-style:solid;border-top-width:1px;border-top-color:#f6f6f6;" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;buycarData&#34;,&#34;filter&#34;:&#34;$row.val(\&#34;number\&#34;) &gt; 0  &amp;&amp;  $row.val(\&#34;producttype\&#34;) == 1&#34;}" __cid="cvMvqQv"> 
          <ul class="x-list-template hide cvMvqQv" xid="listTemplateUl6" __cid="cvMvqQv" data-bind="foreach:{data:$model.foreach_list4($element),afterRender:$model.foreach_afterRender_list4.bind($model,$element)}"> 
            <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row6" style="padding-bottom:0px;padding-top:5px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
              <div class="x-col x-col-25 cvMvqQv" xid="col16" __cid="cvMvqQv"> 
                <img src=" " alt="" xid="image2" style="width:100%;" class="imageradius cvMvqQv" __cid="cvMvqQv" data-bind="attr:{src:val(&#34;cover&#34;)}">
              </div>  
              <div class="x-col lastborder cvMvqQv" xid="col13" style="padding:0px;" __cid="cvMvqQv"> 
                <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row8" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                  <div class="x-col cvMvqQv" xid="col9" __cid="cvMvqQv"> 
                    <span xid="span13" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:val(&#34;name&#34;)"></span>  
                    <span xid="span8" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:val(&#34;subtitle&#34;)"></span>
                  </div> 
                </div>  
                <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row7" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                  <div class="x-col cvMvqQv" xid="col14" style="padding-top:0px;padding-bottom:0px;" __cid="cvMvqQv"> 
                    <div component="$model/UI2/system/components/justep/list/list" class="x-list cvMvqQv" xid="list6" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activeData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cvMvqQv"> 
                      <ul class="x-list-template hide cvMvqQv" xid="listTemplateUl5" __cid="cvMvqQv" data-bind="foreach:{data:$model.foreach_list6($element),afterRender:$model.foreach_afterRender_list6.bind($model,$element)}"> 
                        <span xid="span9" style="font-size:x-small;background-color:#ffeae9;color:#fe2e23;font-weight:lighter;padding:1px;border-radius:3px;" __cid="cvMvqQv" class="cvMvqQv" data-bind="text:val(&#34;active&#34;)"></span>
                      </ul> 
                    </div> 
                  </div> 
                </div>  
                <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row10" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                  <div xid="col11" style="padding:5px;" __cid="cvMvqQv" class="cvMvqQv"> 
                    <div component="$model/UI2/system/components/justep/list/list" class="x-list cvMvqQv" xid="list5" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;optionalData&#34;,&#34;filter&#34;:&#34; $row.val(\&#34;buycar_id\&#34;) == val(\&#34;id\&#34;)&#34;}" __cid="cvMvqQv"> 
                      <ul class="x-list-template hide cvMvqQv" xid="listTemplateUl4" __cid="cvMvqQv" data-bind="foreach:{data:$model.foreach_list5($element),afterRender:$model.foreach_afterRender_list5.bind($model,$element)}"> 
                        <span xid="span11" style="font-size:small;" class="text-muted cvMvqQv" __cid="cvMvqQv" data-bind="text:val(&#34;selectcondition_name&#34;)"></span>
                      </ul> 
                    </div> 
                  </div>  
                  <div class="x-col cvMvqQv" xid="col8" __cid="cvMvqQv"> 
                    <i xid="i3" class="linear linear-chevrondown text-muted cvMvqQv" style="font-size:x-small;" __cid="cvMvqQv" data-bind="visible:val(&#34;hasoptional&#34;) &gt; 0"></i>
                  </div> 
                </div>  
                <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row9" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
                  <div class="x-col cvMvqQv" xid="col12" __cid="cvMvqQv"> 
                    <span xid="span12" style="font-size:large;" class="text-muted cvMvqQv" __cid="cvMvqQv">￥0</span>  
                    <span xid="span14" class="text-muted cvMvqQv" style="text-decoration:line-through;margin-left:5px;" __cid="cvMvqQv" data-bind="text:'￥' + (parseFloat(val(&#34;price&#34;)) + parseFloat(val(&#34;discount&#34;))),visible:false"></span>
                  </div>  
                  <div class="x-col text-right cvMvqQv" xid="col10" __cid="cvMvqQv"> 
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cvMvqQv" xid="button2" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:false" data-events="onClick:subBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-remove&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cvMvqQv"> 
                      <i xid="i5" class="icon-android-remove cvMvqQv" __cid="cvMvqQv"></i>  
                      <span xid="span6" __cid="cvMvqQv" class="cvMvqQv"></span>
                    </a>  
                    <label xid="label1" style="font-weight:normal;width:30px;" class="text-center cvMvqQv" __cid="cvMvqQv" data-bind="text:'×' + val(&#34;number&#34;)">1</label>  
                    <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-sm btn-only-icon addbtn cvMvqQv" xid="button1" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'},visible:false" data-events="onClick:addBtnClick" data-config="{&#34;icon&#34;:&#34;icon-android-add&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cvMvqQv"> 
                      <i xid="i4" class="icon-android-add cvMvqQv" __cid="cvMvqQv"></i>  
                      <span xid="span7" __cid="cvMvqQv" class="cvMvqQv"></span>
                    </a> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </ul> 
        </div> 
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center row-class cvMvqQv" xid="row18" style="background-color:white;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
        <div class="x-col x-col-fixed cvMvqQv" xid="col33" style="width:80px;" __cid="cvMvqQv">
          <span xid="span27" __cid="cvMvqQv" class="cvMvqQv">买家留言：</span>
        </div>  
        <div class="x-col cvMvqQv" xid="col34" __cid="cvMvqQv">
          <textarea component="$model/UI2/system/components/justep/textarea/textarea" class="form-control input-class cvMvqQv" xid="textarea1" data-bind="component:{name:'$model/UI2/system/components/justep/textarea/textarea'}" __cid="cvMvqQv"></textarea>
        </div> 
      </div>
    </div>  
    <div class="x-panel-bottom cvMvqQv" xid="bottom1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cvMvqQv">
      <div component="$model/UI2/system/components/justep/row/row" class="x-row x-row-center cvMvqQv" xid="row13" style="padding:0px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
        <div class="x-col text-right cvMvqQv" xid="col19" style="padding-right:20px;" __cid="cvMvqQv">
          <span xid="span18" __cid="cvMvqQv" class="cvMvqQv">合计金额：</span>  
          <span xid="span19" style="color:#fe2e23;font-size:large;" __cid="cvMvqQv" class="cvMvqQv"></span>
        </div>  
        <div class="x-col x-col-33 cvMvqQv" xid="col22" style="padding:0px;" __cid="cvMvqQv">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-lg btn-block surebtn cvMvqQv" xid="submitBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:submitBtnClick" data-config="{&#34;label&#34;:&#34;提交订单&#34;}" __cid="cvMvqQv"> 
            <i xid="i8" __cid="cvMvqQv" class="cvMvqQv"></i>  
            <span xid="span17" __cid="cvMvqQv" class="cvMvqQv">提交订单</span>
          </a>
        </div> 
      </div>
    </div>
    <style __cid="cvMvqQv" class="cvMvqQv">.x-panel.pcERrQ3u-iosstatusbar >.x-panel-top {height: 48px;}.x-panel.pcERrQ3u-iosstatusbar >.x-panel-content { top: 48px;bottom: nullpx;}.x-panel.pcERrQ3u-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcERrQ3u-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcERrQ3u-iosstatusbar >.x-panel-top {height: 68px;}.iosstatusbar .x-panel.pcERrQ3u-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcERrQ3u-iosstatusbar >.x-panel-content { top: 68px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcERrQ3u-iosstatusbar >.x-panel-top {height: 48px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcERrQ3u-iosstatusbar >.x-panel-content {top: 48px;}</style>
  </div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver cvMvqQv" xid="popOver1" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;position&#34;:&#34;bottom&#34;}" __cid="cvMvqQv"> 
    <div class="x-popOver-overlay cvMvqQv" xid="div1" __cid="cvMvqQv"></div>  
    <div class="x-popOver-content cvMvqQv" xid="div3" style="background-color:white;width:100%;height:70%;" __cid="cvMvqQv">
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row14" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
        <div class="x-col cvMvqQv" xid="col23" __cid="cvMvqQv"></div>  
        <div class="x-col text-center cvMvqQv" xid="col24" __cid="cvMvqQv">
          <span xid="span20" style="font-size:medium;" __cid="cvMvqQv" class="cvMvqQv">确认付款</span>
        </div>  
        <div class="x-col text-right cvMvqQv" xid="col25" __cid="cvMvqQv">
          <i xid="i9" class="linear linear-cross text-muted cvMvqQv" __cid="cvMvqQv" data-bind="event:{click:$model._callModelFn.bind($model, 'i9Click')}"></i>
        </div>
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row15" style="margin-top:20px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
        <div class="x-col cvMvqQv" xid="col26" __cid="cvMvqQv"></div>  
        <div class="x-col text-center cvMvqQv" xid="col27" __cid="cvMvqQv">
          <span xid="span23" style="color:#fe2e23;font-size:x-large;" __cid="cvMvqQv" class="cvMvqQv">￥0.00</span>
        </div>  
        <div class="x-col cvMvqQv" xid="col28" __cid="cvMvqQv"></div>
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row16" style="margin-top:20px;border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#f6f6f6;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
        <div class="x-col x-col-25 cvMvqQv" xid="col29" __cid="cvMvqQv">
          <span xid="span24" __cid="cvMvqQv" class="cvMvqQv">余额抵扣</span>
        </div>  
        <div class="x-col text-center cvMvqQv" xid="col30" __cid="cvMvqQv">
          <span xid="span25" __cid="cvMvqQv" class="cvMvqQv">可用余额：￥0.00</span>
        </div>  
        <div class="x-col x-col-25 text-right cvMvqQv" xid="col31" __cid="cvMvqQv">
          <span component="$model/UI2/system/components/justep/button/toggle" class="x-toggle cvMvqQv" xid="toggle1" style="display: inline-block;padding:0px;" ON="　" OFF="　" data-config="{&#34;checked&#34;:false,&#34;disabled&#34;:false,&#34;label&#34;:{&#34;off&#34;:&#34;　&#34;,&#34;on&#34;:&#34;　&#34;}}" data-bind="component:{name:'$model/UI2/system/components/justep/button/toggle'}" data-events="onChange:toggle1Change" __cid="cvMvqQv">
            <input type="checkbox" __cid="cvMvqQv" class="cvMvqQv">
            <label data-on="　" data-off="　" __cid="cvMvqQv" class="cvMvqQv">
              <span __cid="cvMvqQv" class="cvMvqQv"></span>
            </label>
          </span>
        </div>
      </div>  
      <div component="$model/UI2/system/components/justep/row/row" class="x-row cvMvqQv" xid="row17" style="position:absolute;bottom:20px;" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cvMvqQv"> 
        <div class="x-col cvMvqQv" xid="col32" __cid="cvMvqQv">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-block wxcolor cvMvqQv" xid="payBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;立即支付&#34;}" __cid="cvMvqQv"> 
            <i xid="i10" __cid="cvMvqQv" class="cvMvqQv"></i>  
            <span xid="span26" __cid="cvMvqQv" class="cvMvqQv">立即支付</span>
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
    				baseUrl: window.__justep.__ResourceEngine.contextPath + '/flowerfront/buy',
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
    				context.model = '$model/UI2/flowerfront/buy/confirmorder.w' + (document.location.search || "");
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