<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
     #aa{
           border:1px solid red; 
           width:880px; 
           height:580px;
           margin: auto;
           } 
</style>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
</head>
<body>
<div id="aa">
<table border="1" >
<tr>
<td  style="width: 120px;height: 35px;text-align: center">招聘对象</td>
<td><input type="text"  size="20" ></td>
</tr>
<tr>
<td  style="width: 120px;height: 35px;text-align: center">招聘人数</td>
<td><input type="text"  size="5" ></td>
</tr>
<tr>
<td style="width: 120px;height: 35px;text-align: center">工作地点</td>
<td><input type="text"  size="30" ></td>
</tr>
<tr>
<td style="width: 120px;height: 35px;text-align: center">工资待遇</td>
<td><input type="text"  size="20" ></td>
</tr>
<tr>
<td style="width: 120px;height: 35px;text-align: center">发布日期</td>
<td>
<select  size="1">
<option>2005-12-18</option>
<option>2005-12-19</option>
<option>2005-12-20</option>
<option>2005-12-21</option>
</select>
</td>
</tr>
<tr>
<td style="width: 120px;height: 35px;text-align: center">有效期限</td>
<td>
<input type="text" size="5">天
</td>
</tr>
<tr>
<td  style="width: 120px;height: 35px;text-align: center" rowspan="8">招聘要求</td>
<td>

    <div id="div1">
    	<p>欢迎使用 wangEditor 富文本编辑器</p>
	</div>
<script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#div1');
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



