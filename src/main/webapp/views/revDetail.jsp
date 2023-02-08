<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="resources/css2/detailStyle.css">
<title>상세정보</title>
</head>
<body>
    <div class="detailWrap">
      <header>
        <div onclick="homeGo()"></div>
        <p onclick="logoutFunc()">로그아웃</p>
      </header>
      <main>
        <div class="detailMain">
          <section>
            <img class="detailIdol" alt=`${revList[0].idol_name}사진` src=/photo.do?path=${revList[0].idol_img_new}>
            <h2>${revList[0].eat_name}</h2>
            <ul class="starList" id="detailStar"></ul>
            <p>${revList[0].eat_address}</p>
            <ul class="detailImgList"></ul>
          </section>
          <section>
            <form action="revWrite" method="POST" enctype="multipart/form-data" onsubmit="reviewWriteSubmit(event)">
              <fieldset class="pictureArea">
                <img class="pictureView" id="revImg" src="" />
                <input type="file" name="detailLoadImg" id="detailLoadImg" onchange="revImgChange(event)">
              	<input style="display: none;" type="text" name="detailImgFlag" id="detailImgFlag" value="0">
              </fieldset>
              <div class="reviewArea">
                <ul class="starList" id="writeStar">
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                  <li></li>
                </ul>
				<input type="text" name="rev_star" id="countStar" style="display:none" value="0" />
				<input type="text" name="eat_idx" id="eatIndex" style="display:none" value=${revList[0].eat_idx}>
                <button id="revieWrite">리뷰작성</button>
              </div>
              <textarea id="detailReview" name="detailReview" cols="30" rows="10"></textarea>
            </form>
          </section>
          <section>
            <ul id="reviewListUl">
            </ul>
          </section>
        </div>
      </main>
      <div></div>
    </div>
    <script language="javaScript">
    window.addEventListener("load", ()=>{
    	 if(`${sessionScope.loginId}` == ""){
    		 window.location.href="/";
    	 } else {
	    	  const starListLi = number => {
	    	    let revStar = "";
	    	    for(let j = 0; j < 5; j++){
	    	      if( j < number ){
	    	        revStar += `<li class="activeStar"></li>`;
	    	      } else {
	    	        revStar += `<li></li>`
	    	      }
	    	    }
	
	    	    return revStar;
	    	  }
	    	  
	    	  const detailReview = document.querySelector('textarea[name="detailReview"]');
	    	  detailReview.addEventListener("keyup", e => {
	    	    //console.log(detailReview.value.length);
	    	    if(detailReview.value.length > 300){
	    	      detailReview.value = detailReview.value.substr(0, 300);
	    	    }
	    	  });
	
	    	  const countStar = () => {
				  let starNum = 0;
				  document.querySelectorAll("#writeStar>li").forEach((value) => {
					 if(value.classList.contains("activeStar")){
						 starNum++;
					 }
				  });
				  document.querySelector("#countStar").value = starNum;
				  console.log(document.querySelector("#countStar").value);
	    	  }
	    	  
	    	  const writeStar = document.querySelectorAll("#writeStar>li");
	    	  Array.from(writeStar).forEach( (value, index) => { 
	    	    value.addEventListener("click", e => {
	    	      for(let i = 0; i < 5; i++){
	    	        if( i < index + 1){
	    	          writeStar[i].classList.add("activeStar");
	    	        } else{
	    	          writeStar[i].classList.remove("activeStar");
	    	        }
	    	      }
	    	      countStar();
	    	    });
	    	  });
	    	  
	    	 
	    	  const reviewMake = (reviewListUl, userNick, revContent, revStar, revImg, revDate) => {
	  	        createLi = document.createElement("li");
	  	        createDivName = document.createElement("div");
	  	        createStarUl = document.createElement("ul");
	  	        createImg = document.createElement("Img");
	  	        createSpan = document.createElement("span");
	
	  	        createDivName.innerHTML = "<span>" + userNick + "</span><p>" + revDate + "</p>";
	
	  	        createStarUl.classList.add("reviewStar", "starList");
	  	        createStarUl.innerHTML = starListLi(Number(revStar));
	  	        createImg.classList.add("detailReviewImg");
	  	        createSpan.innerText = revContent;
	
	  	        createLi.append(createDivName);
	  	        createLi.append(createStarUl);
	  	        if(revImg == "new" || revImg == ""){ //null 로 바꾸기
	  	        } else {
	  	        	createImg.setAttribute("src", "/photo.do?path=" + revImg);
	  	        	createImg.setAttribute("alt", "후기이미지");
	  		        createLi.append(createImg);	        	
	  	        }
	  	        createLi.append(createSpan);
	
	  	        reviewListUl.append(createLi);
	    	  }
	
	    	  const detailStar = document.querySelector("#detailStar");
	    	  const detailImgList = document.querySelector(".detailImageList");
	    	  const reviewListUl = document.querySelector("#reviewListUl");
			  
	    	  detailStar.innerHTML = starListLi(Math.round(Number(${revList[0].rev_star})));
	    	  
	    	  <c:forEach items="${reviewList}" var="item">
				  reviewMake(reviewListUl, `${item.user_nick}`, `${item.rev_content}`, `${item.rev_star}`, `${item.revP_new}`, `${item.rev_date}`);
	    	  </c:forEach>
    	}
    }); // load event
    function reviewWriteSubmit(e){
    	if(document.querySelector("#detailReview").value == ""){
    		e.preventDefault();
    		alert("리뷰 내용을 채워주세요.");
    	} else {
		  if(!confirm("리뷰를 등록하시겠습니까?")){
			  e.preventDefault();
		  } else {
			  return;
		  }
    	}
	 }
    function revImgChange(event){
        let reader = new FileReader();
        reader.onload = function(e) {
           document.getElementById("revImg").setAttribute("src", e.target.result);
        };
        reader.readAsDataURL(event.target.files[0]);
        document.getElementById("detailImgFlag").value = "1";
     }
    function logoutFunc(){
		$.ajax({
			type:"POST",
			url:"/logout.do",
			data:{
				logout:"logout"
			},
			dataType:"TEXT",
			success:function(data){
				if(data == "logout"){
					window.location.href="/"
				}
			},
			error:function(err){
				console.log("logout", err);
				if(err) throw err;
			}
		});
	}
    function homeGo(){
    	window.location.href = "/main.go";
    }
    </script>
</body>
</html>