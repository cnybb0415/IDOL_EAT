<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css2/mainStyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>메인</title>
</head>
<body>
    <div class="mainWrap">
      <aside>
        <div class="mainSearchBox">
          <div class="searchIcon"></div>
          <input type="search" name="qSearch" placeholder="아이돌을 검색하세요">
        </div>
        <section class="mainList">
          <header>
          </header>
          <div class="mainEatList">
          </div>
        </section>
      </aside>
      <main class="mainMapWrap">
        <div id="mainMap"></div>
        <a href="./admin.go" class="adminButton"></a>
        <a href="./add.go" class="addButton"></a>
        <!-- <button class="adminButton" type="button"></button>
        <button class="addButton" type="button"></button> -->
      </main>
    </div>
    <!--JS-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a45a5f0ccba360d83db496289cf28e2&libraries=services,clusterer,drawing"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a45a5f0ccba360d83db496289cf28e2"></script>
    <!--<script src="./js/mainAsideScript.js"></script>-->
    <script type="text/javascript">
	console.log(`${sessionScope.loginId}`);
	  $.ajax({
	  	type:"POST",
	  	url:"/sessionId",
	  	data:{
	  		user_id:`${sessionScope.loginId}`
	  	},
	  	dataType:"TEXT",
	  	success:function(data){
	  		console.log(data);
	  		if(data == "manager"){
	  			document.querySelector(".adminButton").style.display="block";
	  		} else {
	  			document.querySelector(".adminButton").style.display="none";  			
	  		}
	  	}
	  });
    </script>
    <script src="resources/js/mainScript.js"></script>
</body>
</html>