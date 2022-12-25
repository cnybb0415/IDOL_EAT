<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css2/admin.css">
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <div id="adminWrap">
    <header id="adminHeader">
      <div title="홈 아이콘"></div>
      <p>닉네임 관리자님 환영합니다.</p><!-- append 추가하기-->
    </header>
    <main>
      <div id="adminReviewWrap">
        <main>
          <div class="adminReviewContent">
            <div class="adminReviewImg">
              <img src="" alt="리뷰 이미지">
              <div id="starArea"></div>
            </div>
            <div class="adminReviewInfo">
              <div><p>가게 번호:</p><p id="adminRevEatNum"></p></div>
              <div><p>가게 명:</p><p id="adminRevEatName"></p></div>
              <div><p>리뷰 번호:</p><p id="adminRevNum"></p></div>
              <div><p>회원 닉네임:</p><p id="adminRevMemNick"></p></div>
              <div><p>작성일:</p><p id="adminRevDate"></p></div>
            </div>
            <div class="adminReviewWrite">
              <p id="adminRevDetail"></p>
            </div>
            <div class="adminReviewButton">
              <button onclick="adminRevCancel()">취소</button>
              <button onclick="adminRevBlind()" id="adminRevButton">숨김</button>
            </div>
          </div>
        </main>
      </div>
      <div class="adminContent">
        <div class="adminSearch">
          <input type="text" name="adminFind" id="adminFind" placeholder="검색어를 입력하세요">
          <div title="검색아이콘" onclick="adminSearchClick()"></div>
        </div>
        <div class="adminButtonArea">
          <div>
            <button class="adminButton" onclick="adminEatClick(event)">맛집관리</button>
            <button class="adminButton" onclick="adminMemberClick(event)">회원관리</button>
            <button class="adminButton" onclick="adminReviewClick(event)">리뷰관리</button>
            <button class="adminButton" onclick="adminIdolClick(event)">아이돌 정보</button>
            <p id="buttonFlag"></p>
          </div>
          <div onclick="idolAddGo()">
            <div><div></div></div>
          </div>
        </div>
        <div id="adminTable" class="adminTable">
        	<!-- 테이블 들어오는 곳 -->
        </div>
      </div>
    </main>
  </div>

  <script>
  	function idolAddGo(){
  		window.location.href = "/idolAdd.go";
  	}
  	//각 필드의 넓이를 담당하는 class를 적용하는 함수
    function adminClassSelector(fieldName){
      let classSelect = "";
      switch(fieldName){
        case "맛집번호": case "회원번호": case "리뷰번호": case "회원이름": {
          classSelect = "adminTableIndex";
          break;
        }
        case "가게명": {
          classSelect = "adminTableEat";
          break;
        }
        case "아이돌 번호": {
          classSelect = "adminTableIdolIndex";
          break;
        }
        case "날짜": case "출생연도": case "작성일": {
          classSelect = "adminTableDate";
          break;
        }
        case "상세정보": case "수정": case "숨김": {
          classSelect = "adminTableButton";
          break;
        }
        case "아이디": {
          classSelect = "adminTableId";
          break;
        }
        case "닉네임": {
          classSelect = "adminTableNick";
          break;
        }
        case "리뷰내용": {
          classSelect = "adminTableReview";
          break;
        }
        case "그룹명": {
          classSelect = "adminTableGroup";
          break;
        }
        case "아이돌 이름": {
          classSelect = "adminTableIdol";
          break;
        }
      }
      return classSelect;
    }
	//테이블 밑작업 함수, 필드명 배열을 받아서 thead를 작성
    function adminTableBase(theadValue){
      const table = document.createElement("table");
      const thead = document.createElement("thead");
      const tbody = document.createElement("tbody");
      const adminTable = document.getElementById("adminTable"); 
      adminTable.innerHTML = "";
      adminTable.append(table);      
      const adminInnerTable = document.querySelector("#adminTable>table"); 
      adminInnerTable.append(thead);
      adminInnerTable.append(tbody);
      const adminThead = document.querySelector("#adminTable>table>thead");
      adminThead.append(document.createElement("tr"));
      const adminTheadTr = document.querySelector("#adminTable>table>thead>tr");
      
      for(let i = 0; i<theadValue.length; i++){
        let th = document.createElement("th");
        th.setAttribute("class", adminClassSelector(theadValue[i]));
        th.innerHTML = theadValue[i];
        adminTheadTr.append(th);
      }
    }
	//테이블의 행을 만드는 함수
    function adminMakeTable(tableField, classValue, state){ //tableField는 배열 형태
      const tr = document.createElement("tr");
      for(let i = 0; i<classValue.length; i++){ 
        let td = document.createElement("td"); 
        td.setAttribute("class", adminClassSelector(classValue[i]));
        if(classValue[i] == "상세정보"){
          td.innerHTML = "<button class='orangeButton' onclick='adminDetailClick(event)'>상세정보</button>";
        } else if(classValue[i] == "수정"){
            td.innerHTML = "<button class='orangeButton' onclick='adminUpdateClick(event)'>수정</button>";        	
        }else if(classValue[i] == "숨김"){
        	if(state == 1){
                td.innerHTML = "<button class='purpleButton' onclick='adminBlindClick(event)'>숨김</button>";	
        	} else if(state == 0){
                td.innerHTML = "<button class='greyButton' onclick='adminBlindClick(event)'>숨김 해제</button>";
        	}
        } else {
          td.innerHTML = tableField[i];
        }
        tr.append(td);
      }
      return tr;
    }
	//맛집정보 버튼을 눌렀을 때 실행되는 함수
    function adminEatClick(event){
      const buttonFlag = document.getElementById("buttonFlag");
      document.getElementById("adminFind").value = "";
      buttonFlag.innerHTML = "eat";
      adminButton(event.target);
      event.target.style.backgroundColor = "#8DA1FB";
      const theadValue = ["번호", "가게명", "아이돌 번호", "회원번호", "날짜", "상세정보"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      $.ajax({
    	  type:"GET",
    	  url:"/adminEat",
    	  dataType:"JSON",
    	  success:function(data){
    	      for(let i = 0; i<data.adminEatData.length; i++){
    	          let {eat_idx, eat_name, idol_idx, user_idx, eat_date, eat_state} = data.adminEatData[i];
    	          let tbodyValue = [eat_idx, eat_name, idol_idx, user_idx, eat_date];
    	          adminTbody.append(adminMakeTable(tbodyValue, theadValue, eat_state));
    	        }	  
    	  },
    	  error:function(err){
    		  console.log("adminEatClick", err);
    		  if(err) throw err;
    	  }
      });
    }
	//회원정보 버튼을 눌렀을 때 실행되는 함수
    function adminMemberClick(event){
      const buttonFlag = document.getElementById("buttonFlag");
      document.getElementById("adminFind").value = "";
      buttonFlag.innerHTML = "member";
      adminButton(event.target);
      event.target.style.backgroundColor = "#8DA1FB";
      const theadValue = ["회원번호", "아이디", "닉네임", "이름", "출생연도", "상세정보"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      $.ajax({
    	  type:"GET",
    	  url:"/adminMember",
    	  dataType:"JSON",
    	  success:function(data){
    	      for(let i = 0; i<data.adminMemberData.length; i++){
    	          let {user_idx, user_id, user_nick, user_name, user_birth, user_state} = data.adminMemberData[i];
    	          let tbodyValue = [user_idx, user_id, user_nick, user_name, user_birth];
    	          adminTbody.append(adminMakeTable(tbodyValue, theadValue, user_state));
    	        }  
    	  },
      	  error:function(err){
      		  console.log("adminMemberClick", err);
      		  if(err) throw err;
      	  }
      });
    }
	//리뷰정보를 눌렀을 때 실행되는 함수
    function adminReviewClick(event){
      const buttonFlag = document.getElementById("buttonFlag");
      document.getElementById("adminFind").value = "";
      buttonFlag.innerHTML = "review";
      adminButton(event.target);
      event.target.style.backgroundColor = "#8DA1FB";
      const theadValue = ["리뷰번호", "가게명", "회원번호", "리뷰내용", "작성일", "상세정보"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
	  $.ajax({
	   	  type:"GET",
	      url:"/adminReview",
	      dataType:"JSON",
	      success:function(data){
	          for(let i = 0; i<data.adminReviewData.length; i++){
	              let {rev_idx, eat_name, user_idx, rev_content, rev_date, rev_state} = data.adminReviewData[i];
	              let tbodyValue = [rev_idx, eat_name, user_idx, rev_content, rev_date];
	              adminTbody.append(adminMakeTable(tbodyValue, theadValue, rev_state));
	            }	    	  
	      },
	  	  error:function(err){
	  		  console.log("adminReviewClick", err);
	  		  if(err) throw err;
	  	  }
	  });

    }
	//아이돌 정보 버튼을 눌렀을 때 실행되는 함수
    function adminIdolClick(event){
      const buttonFlag = document.getElementById("buttonFlag");
      document.getElementById("adminFind").value = "";
      buttonFlag.innerHTML = "idol";
      adminButton(event.target);
      event.target.style.backgroundColor = "#8DA1FB";
      console.log(event.target);
      const theadValue = ["아이돌 번호", "그룹명", "이름", "수정", "숨김"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      $.ajax({
    	 type:"GET",
    	 url:"/idolList",
    	 dataType:"JSON",
    	 success:function(data){
    		  for(let i = 0; i<data.adminIdolData.length; i++){
    	        let {idol_idx, idol_group, idol_name, idol_state} = data.adminIdolData[i];
    	        let tbodyValue = [idol_idx, idol_group, idol_name, idol_state];
    	        adminTbody.append(adminMakeTable(tbodyValue, theadValue, idol_state));
    	      }
    	 },
      	 error:function(err){
      		 console.log(err);
      	 }
      });
    }
    //검색어를 입력하고 검색 버튼을 눌렀을 때 실행되는 함수
    function adminSearchClick(){
      const adminCategory = document.getElementById("buttonFlag").innerHTML;
      const adminFind = document.getElementById("adminFind").value;
      if(adminFind == ""){
    	  alert("검색어를 입력해주세요.");
      }else{
	      $.ajax({
	    	 type:"GET",
	    	 url:"/adminSearch",
	    	 data:{
	    		 adminFind:adminFind, //검색 결과
	    		 adminCategory:adminCategory //
	    	 },
	    	 dataType:"JSON",
	    	 success:function(data){
	    	      switch(adminCategory){
	    	        case "eat":{
	    	          const theadValue = ["번호", "가게명", "아이돌 번호", "회원번호", "날짜", "상세정보"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {eat_idx, eat_name, idol_idx, user_idx, eat_date, eat_state} = data.adminSearchData[i];
	    	            let tbodyValue = [eat_idx, eat_name, idol_idx, user_idx, eat_date];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue, eat_state));
	    	          }
	    	          break;
	    	        }
	    	        case "member":{
	    	          const theadValue = ["회원번호", "아이디", "닉네임", "이름", "출생연도", "상세정보"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {user_idx, user_id, user_nick, user_name, user_birth, user_state} = data.adminSearchData[i];
	    	            let tbodyValue = [user_idx, user_id, user_nick, user_name, user_birth];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue, user_state));
	    	          }
	    	          break;
	    	        }
	    	        case "review":{
	    	          const theadValue = ["리뷰번호", "가게명", "회원번호", "리뷰내용", "작성일", "상세정보"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {rev_idx, eat_name, user_idx, rev_content, rev_date, rev_state} = data.adminSearchData[i];
	    	            let tbodyValue = [rev_idx, eat_name, user_idx, rev_content, rev_date];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue, rev_state));
	    	          }
	    	          break;
	    	        }
	    	        case "idol":{
	    	          const theadValue = ["아이돌 번호", "그룹명", "이름", "수정", "숨김"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {idol_idx, idol_group, idol_name, idol_state} = data.adminSearchData[i];
	    	            let tbodyValue = [idol_idx, idol_group, idol_name, idol_state];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue, idol_state));
	    	          }
	    	          break;
	    	        }
	    	      }	 
	    	 },
	    	 error:function(err){
	    		 console.log("adminSearchClick", err);
	    		 if(err) throw err;
	    	 }
	      });
	    }
    }
    //버튼 css 함수, 호버와 배경 바꾸기
    function adminButton(target){
        document.querySelectorAll(".adminButton").forEach((value) => {	
          value.style.backgroundColor = "#e7e7e7";
          value.addEventListener("mouseover", function(){
            this.style.backgroundColor = "#8DA1FB";
          });
          value.addEventListener("mouseout", function(){
            if(this == target){
              this.style.backgroundColor = "#8DA1FB";
            } else {
              this.style.backgroundColor = "#e7e7e7";
            }
          });
        });
    }
    //상세정보를 눌렀을 때 함수
	function adminDetailClick(event){
	    const buttonFlag = document.getElementById("buttonFlag").innerHTML;
	    switch(buttonFlag){
		    case "eat":{
				window.location.href = "eatDetail.go?eat_idx="+event.target.parentNode.parentNode.firstChild.innerHTML;
			    break;	
		    }
			case "member":{
				window.location.href = "memberDetail.go?user_idx="+event.target.parentNode.parentNode.firstChild.innerHTML;
				break;		    	
		    }
			case "review":{
				$.ajax({
					type:"GET",
					url:"/adminReviewDetail",
					data:{
						rev_idx:event.target.parentNode.parentNode.firstChild.innerHTML
					},
					dataType:"JSON",
					success:function(data){
						document.getElementById("adminRevEatNum").innerHTML = data.reviewDetail[0].eat_idx;
						document.getElementById("adminRevEatName").innerHTML = data.reviewDetail[0].eat_name;
						document.getElementById("adminRevNum").innerHTML = data.reviewDetail[0].rev_idx;
						document.getElementById("adminRevMemNick").innerHTML = data.reviewDetail[0].user_nick;
						document.getElementById("adminRevDate").innerHTML = data.reviewDetail[0].rev_date;
						document.getElementById("adminRevDetail").innerHTML = data.reviewDetail[0].rev_content;
						let starString = "";
						let starNumber = Math.ceil(parseInt(data.reviewDetail[0].rev_star));
						console.log(starNumber);
						for(let i = 1; i<=5; i++){
							if(i<=starNumber){
								starString += `<img src='resources/img/colorStar.png' alt='꽉 찬 별'></img>`;
							} else {
								starString += `<img src='resources/img/emptyStar.png' alt='빈 별'></img>`
							}
						}
						document.getElementById("starArea").innerHTML = starString;
						if(data.reviewDetail[0].rev_state == 0){
							document.getElementById("adminRevButton").innerHTML = "숨김 해제";
						} else {
							document.getElementById("adminRevButton").innerHTML = "숨김";
						}
						document.getElementById("adminReviewWrap").style.display = "block";
					},
					error:function(err){
						console.log("adminDetailClick", err);
						if(err) throw err;
					}
				});
				break;		    	
		    }
	    }

	}
    function adminRevCancel(){
		document.getElementById("adminReviewWrap").style.display = "none";    	
    }
    function adminRevBlind(){
    	if(document.getElementById("adminRevButton").innerHTML == "숨김"){
        	if(!confirm("해당 리뷰 정보를 숨기시겠습니까?")){
        		return;
        	}else{
    	    	$.ajax({
    	    		type:"GET",
    	    		url:"reviewBlindYes",
    	    		data:{
    	    			rev_idx:document.getElementById("adminRevNum").innerHTML
    	    		},
    	    		success:function(){
    	    			document.getElementById("adminReviewWrap").style.display = "none";						
    	    		}
    	    	});	
        	}
    	} else if(document.getElementById("adminRevButton").innerHTML == "숨김 해제") {
        	if(!confirm("해당 리뷰 정보의 숨김을 해제하시겠습니까?")){
        		return;
        	}else{
    	    	$.ajax({
    	    		type:"GET",
    	    		url:"reviewBlindNo",
    	    		data:{
    	    			rev_idx:document.getElementById("adminRevNum").innerHTML
    	    		},
    	    		success:function(){
    	    			document.getElementById("adminReviewWrap").style.display = "none";
    	    		}
    	    	});	
        	}    		
    	}
    }
	//수정 버튼을 눌렀을 때의 함수
	function adminUpdateClick(event){
		window.location.href = "idolUpdate.go?idol_idx="+event.target.parentNode.parentNode.firstChild.innerHTML;
	}
	//숨김 버튼을 눌렀을 때의 함수
	function adminBlindClick(event){
	   if(event.target.innerHTML == "숨김"){
		  if(!confirm("해당 아이돌을 숨기시겠습니까?(숨김 시 해당 아이돌의 마커는 지도에 나타나지 않습니다.)")){
			  return;
		  } else{
				$.ajax({
					type:"GET",
					url:"/idolBlindYes",
					data:{
						idol_idx:event.target.parentNode.parentNode.firstChild.innerHTML
					},
					success:function(result){
						console.log("아이돌 숨김");
					    event.target.setAttribute("class", "greyButton");
					    event.target.innerHTML = "숨김 해제";
					},
					error:function(err){
						console.log("adminBlindClick", err);
						if(err) throw err;
					}
				});
		  }
	   } else if(event.target.innerHTML == "숨김 해제"){
		   if(!confirm("해당 아이돌의 숨김을 해제하시겠습니까?(숨김 해제 시 해당 아이돌의 마커가 지도에 나타납니다.)")){
			   return;
		   } else {
				$.ajax({
					type:"GET",
					url:"/idolBlindNo",
					data:{
						idol_idx:event.target.parentNode.parentNode.firstChild.innerHTML
					},
					success:function(result){
						console.log("아이돌 숨김해제");
					   	 event.target.setAttribute("class", "purpleButton");
					     event.target.innerHTML = "숨김";
					},
					error:function(err){
						console.log("adminBlindClick", err);
						if(err) throw err;
					}
				});
		   }
	   }

	}
    //adminEatClick(event);
  </script>
</body>
</html>