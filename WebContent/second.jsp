<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>wangEditor 菜单和编辑器区域分离</title>
    <style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            height: 200px;
        }
    </style>
</head>
<body>
<div id="div1" class="toolbar">
  <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#div1');  // 两个参数也可以传入 elem 对象，class 选择器
        editor.customConfig.pasteFilterStyle=false;//true是过滤，改变原来复制样式
        editor.customConfig.pasteignoreimg=false;//忽略粘贴内容的图片(true是忽略，false是不忽略 )
        editor.customConfig.pasteTextHandle =function (content) {
        	//content意思为粘贴过来的内容(html或纯文本)
        	//返回的就是最后粘贴到输入框中的内容
        	return content +'<p>在粘贴内容后面追加一行</p>';
        }
        editor.customConfig.colors=[//menus表示添加或者删除菜单选项、colors表示添加颜色、fontsName
        	'rgba(255,0,0,0.4)',
        	'blue',
        	'rgb(11,233,44)',
        	'#df2aaa'
        ];
        editor.create();
     //禁用编辑功能(在创建之后)
       //editor.$textElem.attr('contenteditable',false)
     
    </script>
</body>
</html>