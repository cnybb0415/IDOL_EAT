<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet" href="resources/css2/add.css">
<title>맛집 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
   <!-- 맛집 추가 -->
   <main class="addWrap">
      <!-- 배경 요소 -->
      <img class="img0" src="resources/img/topPattern849.png" alt="배경요소">
      <img class="img1" src="resources/img/bottomPattern918.png" alt="배경요소">
      <img class="img2" src="resources/img/bottomPattern654.png" alt="배경요소">
      <img class="img3" src="resources/img/orange64.png" alt="배경요소">
      <img class="img4" src="resources/img/green56.png" alt="배경요소">
      <img class="img5" src="resources/img/green32.png" alt="배경요소">
      <img class="img6" src="resources/img/red48.png" alt="배경요소">
      <img class="img7" src="resources/img/salmon72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="addWrap2">
         <!-- 정보 입력 -->
         <section class="addBox">
            <h2 class="addBoxTitle">맛집 추가</h2>
            <form action="write" method="POST" enctype="multipart/form-data">
               <!-- 상단 -->
               <div class="addInfo1">
                  <div class="addInfo1Box1">
                     <label>내 아이돌의 이름은?</label>
                     <!-- select option 적용 -->
                     <div class="addSearchBox">
                        <button class="searchIcon" type="button"></button>
                        <input type="search" name="qSearch" placeholder="아이돌을 검색하세요">
                     </div>
                  </div>
                  <div class="addInfo1Box2">
                     <label>내 아이돌이 추천한 맛집 이름은?</label>
                     <input type="text" id="addStore" placeholder="식당 이름을 입력하세요">
                  </div>
                  <div class="addInfo1Box3">
                     <label>내 아이돌이 추천한 맛집 주소는?</label>
                     <input type="text" id="addAdd1" placeholder="주소를 입력하세요">
                     <input type="text" id="addAdd2" placeholder="상세 주소를 입력하세요">
                  </div>
                  <div class="addInfo1Box4">
                     <label>출처를 남겨주세요!</label>
                     <textarea type="text" id="addText" placeholder="출처 내용을 입력하세요"></textarea>
                  </div>
               </div>
               <!-- 하단 -->
               <div class="addInfo2">
                  <div class="addInfoBoxs">
                     <p><i class="xi-warning"></i><span>출처 기준</span></p>
                     <div class="addText">
                        <p>1. 해당 맛집을 추천한 기사,영상 혹은 SNS 링크</p>
                        <p>2. 프로그램에 출연해서 말했다면 해당 프로그램의 이름과 편수를 적어주세요</p>
                        <p>3. 버블,오프라인 콘서트 등에서 이야기했다면 날짜를 함께 적어주세요</p>
                     </div>
                  </div>
                  <div class="addInfoBtn">
                     <a class="addInfoBtn1" href="./main.go">취소</a>
                     <button class="addInfoBtn2">추가하기</button>
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>

   <!-- JS -->
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>  
   window.addEventListener("load", () => {
	   if(`${sessionScope.loginId}` == ""){
		   window.location.href="/";
	   } else {
		   const addSearchBox = document.querySelector(".addSearchBox");
		   const qSearch = document.querySelector('input[name="qSearch"]');
		   const addStore = document.querySelector("#addStore");
		   const addAdd1 = document.querySelector("#addAdd1");
		   const addAdd2 = document.querySelector("#addAdd2");
		   const addText = document.querySelector("#addText");
		   const addInfoBtn2 = document.querySelector(".addInfoBtn2");
		   let addIdolArray = 0;
		   let addIdolIndex = 0;
		   
		   const clickList = e => {
		     qSearch.value = e.target.innerText;
		     addIdolArray.forEach((value) => {
		    	if(value.idol_name == qSearch.value){
		    		addIdolIndex = value.idol_idx;
		    	} 
		     });
		     console.log(addIdolIndex);
		     addSearchBox.lastChild.remove();
		   }
		   
		   const createSearch = (list, target) => {
		     const createUl = document.createElement("ul");
		     for(let i = 0; i < list.length; i++){
		       const createLi = document.createElement("li");
		       createLi.innerText = list[i].idol_name;
		       createLi.onclick = e => clickList(e);
		       createUl.append(createLi);
		     }
		     target.append(createUl);
		   }
	
	
		   qSearch.addEventListener("keyup", e => {
		     if(addSearchBox.childElementCount > 2){
		       addSearchBox.lastElementChild.remove();
		     }
			
		     $.ajax({
		    	 type:"GET",
		    	 url:"/eatAddIdolList",
		    	 dataType:"JSON",
		    	 success:function(data){
		    	   addIdolArray = data.EatIdolData;
		  	       let filterName = data.EatIdolData.filter(element => 
		  	       	element.idol_name.includes(e.target.value)
		  	       );
			       if(filterName.length != 0 && e.target.value != ""){
			         createSearch(filterName, addSearchBox);
			       }	    		 
		    	 },
		    	 error:function(err){
		    		 console.log("qSearch", err);
		    		 if(err) throw err;
		    	 }
		    	 
		     });
		   });
		   
		   addAdd1.addEventListener("click", e => {
		     new daum.Postcode({
		       oncomplete: function(data) {
		         e.target.value = data.address;
		       },
		       onclose: function(state){
		         if(state === 'FORCE_CLOSE'){}
		         else if(state === 'COMPLETE_CLOSE'){}
		       }
	
		     }).open();
		   });
	
		   addInfoBtn2.addEventListener("click", e => {
		     e.preventDefault();
		     let eatAddress = "";
		     if(addAdd2.value == ""){
		    	 eatAddress = addAdd1.value;
		     } else {
		    	 eatAddress = addAdd1.value + " " + addAdd2.value;
		     }
		    	 
		     $.ajax({
		    	type:"POST",
		    	url:"/eatAdd.do",
		    	data:{
		    		 idol_idx: addIdolIndex,
			         eat_name: addStore.value,
			         eat_address: eatAddress,
			         eat_source: addText.value	    		
		    	},
		    	dataType:"TEXT",
		    	success:function(data){
		    		if(data == "success"){
		    			window.location.href = "/main.go";
		    		}
		    	},
		    	error:function(err){
		    		console.log("eatAdd.do", err);
		    		if(err) throw err;
		    	}
		     });
		   });
	   }
	 });
   </script>
</body>
</html>