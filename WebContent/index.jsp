<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<style type="text/css">
   .aa{
   width:100px;
   height:300px;
   border: 5px solid #ff0000;
        }
   </style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="a">
sssss
</div>
 <div id="editor">
        <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>
 <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
 <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
         editor.$textElem.attr('contenteditable',false)
    </script>
</body>
</html>