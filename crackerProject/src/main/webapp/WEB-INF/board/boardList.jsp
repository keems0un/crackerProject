<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style type = "text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color : black; text-decoration: none;}
.subjectA:hover {color: blue; text-decoration: underline;}
.subjectA:active {color: #d81e5b; text-decoration: none;}
#samePage {color: red; text-decoration: none;}
#otherPage {color: black; text-decoration: none;}
#currentPaging{
   color:red;
   text-decoration:underline;
   cursor: pointer;
}
#paging{
   color:black;
   text-decoration:non;
   cursor: pointer;
}

#boardListDiv{
/*    border: 1px solid red; */
   margin: 50px auto;
   width: 60%;
   height: 300px;
   background-color: #ffffff;
   box-shadow: 0 1px 3px 0 rgb(0 0 0 / 15%);
/*    border: solid 1px #98a0a7; */
}

#boardListDiv .goodCount{
/*    border: 1px red solid; */
   float: left;
   width: 10%;
   margin: 10px;
   color: #98a0a7;

}

#boardListDiv .category{
	float: left;
	width: 10%;
	margin: 10px;

}

#boardListDiv .subjcet{
/*    border: 1px red solid; */
   float: left;
   text-align: center;
   margin: 10px;
   width: 33%;
   margin: 10px;
   white-space : nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}

#boardListDiv .logtime{
/*    border: 1px red solid; */
   float: left;
   margin: 10px;
   width: 10%;
   color: #98a0a7;
   
}

#boardListDiv .nickName{
/*    border: 1px red solid; */
   float: left;
   margin: 10px;
   width: 19%;
   color: #98a0a7;
}

#boardListDiv .listMenu{
/*    border: 1px red solid; */
   text-align:center;
   height:13.5%;
   width:95%;
   margin: auto;
   border-bottom:1px solid #ebeef1;
}
#boardListWriteBtn {
	text-align: left;
	margin-left : 300px;
}
#boardPagingDiv {
	margin-left : 410px;
}

/* Header */

.FreeBoardTop {
	width: 100%;
	border-bottom : 1px solid #f76900;
}

.FreeBoardTop .inner {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 48px 0px 48px 0px ;
	width: 100%;
	background-color: #f3f3f3;
}

.FreeBoardTop .title2 {
	margin-top: 50px;
	text-align : center;
	
}

.FreeBoardTop .title3 {
	color: #787878;
	text-align : center;
	margin-bottom : 20px;
   height:6%;
   width:95%;
   margin: auto;
   border-bottom:1px solid #ebeef1;

}
</style>

<header class="FreeBoardTop">
	<div class="inner">
		<h1 class="title2">자유 & 질문 게시판</h1>
		<h2 class="title3">무엇이든 올려보아요</h2>
	</div>
</header>

<input type="hidden" id="pg" value="${pg}"/>
<div id="boardListDiv">
   <div class="listMenu">
      <div class="category" style="color:#000000"><span style="font-size: large;font-weight: 900;">분류</span></div>
      <div class="subjcet"><span style="font-size: large;font-weight: 900; text-align:center;">제목</span></div>
      <div class="nickName" style="color:#000000"><span style="font-size: large;font-weight: 900;">닉네임</span></div>
      <div class="logtime" style="color:#000000"><span style="font-size: large;font-weight: 900;">작성날짜</span></div>
      <div class="goodCount" style="color:#000000"><span style="font-size: large;font-weight: 900;">추천</span></div>
   </div>
</div>
    <div id="boardListWriteBtn"><input type ="button" value="글쓰기"  onclick="location.href='/index/board/boardWriteForm'">
         <div id="boardPagingDiv"></div>
	</div>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js">
</script>
<script type="text/javascript" src="../js/boardList.js">
</script>
<script type="text/javascript">

function boardPaging(pg2) {
   var keyword = $('#keyword').val();

   if(keyword == ''){
      location.href = "/index/board/boardList?pg=" + pg2;
   }else{
     $('#searchPg').val(pg2);
     $('#boardSearchBtn').trigger('click');
     $('#searchPg').val(1);
   }
   
   
}
</script>