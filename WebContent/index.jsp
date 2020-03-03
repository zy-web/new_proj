<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<style type="text/css">
#aa{
           border:1px solid red; 
           width:100%; 
           height:100px;
           margin: auto;
           }    
            .a1{
           word-spacing:200px;
           font-size: 40px;
           font-weight: bold;
           line-height: 80px;
           text-indent:25px;
             }
       #bb{
             float:left;
             border:1px solid blue;
             width: 25%;
             height: 630px;
              }
              .a2{
           word-spacing:500px;
           font-size: 30px;
           font-weight: bold;
           line-height: 100px;
             }
             #CC{
            float:right;
           border:1px solid green; 
           width:74.5%; 
           height:302px;
           margin: auto;
             }
             .dd{
               border:1px solid yellow; 
               width:74.5%; 
               height:400px;
             }
             .ee{
          border:1px solid #cccc; 
           width:74.5%;
           
           margin: auto;
           float: right;
             }
   </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="aa">
<span class="a1">教育  游戏  体育  音乐</span>
</div>
<div id="bb">
<span class="a2">国际新闻  文娱新闻  体育新闻  社会新闻</span>
</div>
<div id="cc">
<span style="color:red; font-size: 25px;">今天天气回温了</span>
</div>
  <div  id="Editor" class="ee">
        <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
    </div>
 <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script src="${pageContext.request.contextPath}/static/js/wangEditor.min.js"></script>
 <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        // 或者 var editor = new E( document.getElementById('editor') )
        editor.create()
        // editor.$textElem.attr('contenteditable',false)
    </script>
</body>
</html>