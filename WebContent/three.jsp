<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
     
</style>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
</head>
<body>
<div id="aa">
<table border="1" >
<tr>
			<td colspan="4" style="text-align: center; background-color: gray;">
				<strong>产品管理</strong>
			</td>
		</tr>
<tr>
<td  colspan="4">
<strong>管理导航</strong>：&nbsp;产品类别添加&nbsp; 产品信息管理
</td>
</tr>
<tr>
<td  colspan="4" >
<button id="btn1">添加产品内容</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
产品类别:
<select  size="1">
<option>!--请选择产品类别--!</option>
<option>迪奥</option>
<option>阿尼玛</option>
<option>卡梅隆</option>
</select>
关键字搜索&nbsp;<input type="text"  size="20" >
<button id="btn1">搜   索</button>
</td>
</tr>
<tr>
<td colspan="4"><button id="btn1">中文产品内容</button></td>
</tr>
<tr>
<td style="text-align: center">选择语言:</td>
<td colspan="3"><input type="radio"  checked>中文</td>
</tr>
<tr>
<td style="text-align: center">产品分离</td>
<td>
<select  size="1">
<option>YSU水质分析仪（WQS）</option>
<option>迪奥</option>
<option>阿尼玛</option>
<option>卡梅隆</option>
</select>
</td>
<td style="text-align: center">
发布日期：
</td>
<td><input type="text"></td>
</tr>
<tr>
<td style="text-align: center">产品名称：</td>
<td><input type="text"  value="YSI LEVEL  SCount 水位跟踪者"></td>
<td>附件名称：</td>
<td><input type="text" size="20">
</tr>
<tr>
<td style="text-align: center">添加附件:</td>
<td><input type="file" size="20"></td>
<td>&nbsp;</td>
</tr>
<tr>
<td>简要介绍：（少于800个字）</td>
<td>
<textarea rows="15" cols="35">
 文本框
</textarea>
</td>
<td><button id="btn1">添加介绍图片</button></td>
<td><img src="${pageContext.request.contextPath}/static/img/2.png">
<br/>
<button id="btn1">删除</button>
<button id="btn1">复原</button>
</td>
</tr>
<tr>
<td colspan="4" style="text-align: center">产品内容</td>
</tr>



<tr>
<td colspan="4">
    <div id="div1">
    	<p>欢迎使用 wangEditor 富文本编辑器</p>
	</div>
<script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#div1');
    editor.customConfig.menus=[//menus表示添加或者删除菜单选项、colors表示添加颜色、fontsName
    	'fontName',
    	'fontSize',
    	'italic',
    	'underline',
    	'strikeThrough',
    	'forceColor',
    	'backColor',
    	'image'
    ];
    
    editor.customConfig.colors=[//menus表示添加或者删除菜单选项、colors表示添加颜色、fontsName
    	'rgba(255,0,0,0.4)',
    	'blue',
    	'rgb(11,233,44)',
    	'#df2aaa'
    ];
    editor.customConfig.pasteFilterStyle=true;//true是过滤，改变原来复制样式
    editor.customConfig.pasteignoreimg=true;//忽略粘贴内容的图片(true是忽略，false是不忽略 )
    
    
 	// 上传图片到服务器(处理上传的后台代码)
    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload';
 	// 隐藏“网络图片”菜单(true是显示--默认，false隐藏)
    editor.customConfig.showLinkImg = false;
 	// 将每张图片大小限制为 3M(单位为字节)
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
 	// 限制一次最多能传几张图片，默认为 10000 张（即不限制），需要限制可自己配置
	// 限制一次最多上传 5 张图片
	editor.customConfig.uploadImgMaxLength = 5;
 	// 监听函数，可使用监听函数在上传图片的不同阶段做相应处理
 	editor.customConfig.uploadImgHooks = {
		// 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
    	// （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
    	// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
    	customInsert: function (insertImg, result, editor) {
        	// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
        	// 举例：假如上传图片成功后，服务器端返回的是 [url,url,...] 这种格式，即可这样插入图片：
        	for(var i in result){// result 必须是一个 JSON 格式字符串！！！否则报错
        		insertImg('${pageContext.request.contextPath}/static/file/'+result[i]);
        	}
    	}
    }
 	
    editor.create();
</script>


</td>
</tr>
</table>
</div>
</body>
</html>



