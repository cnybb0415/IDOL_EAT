<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/admin.css">
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
            <button class="adminButton" onclick="adminIdolClick(event)">아이돌 추가</button>
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
    function adminMakeTable(tableField, classValue){ //tableField는 배열 형태
      const tr = document.createElement("tr");
      for(let i = 0; i<classValue.length; i++){ 
        let td = document.createElement("td"); 
        td.setAttribute("class", adminClassSelector(classValue[i]));
        if(classValue[i] == "상세정보"){
          td.innerHTML = "<button class='orangeButton' onclick='adminDetailClick(event)'>" + classValue[i] + "</button>";
        } else if(classValue[i] == "수정"){
            td.innerHTML = "<button class='orangeButton' onclick='adminUpdateClick(event)'>" + classValue[i] + "</button>";        	
        }else if(classValue[i] == "숨김"){ 
          td.innerHTML = "<button class='purpleButton' onclick='adminBlindClick(event)'>" + classValue[i] + "</button>";
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
    	          let {eat_idx, eat_name, idol_idx, user_idx, eat_date} = data.adminEatData[i];
    	          let tbodyValue = [eat_idx, eat_name, idol_idx, user_idx, eat_date];
    	          adminTbody.append(adminMakeTable(tbodyValue, theadValue));
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
    	          let {user_idx, user_id, user_nick, user_name, user_birth} = data.adminMemberData[i];
    	          let tbodyValue = [user_idx, user_id, user_nick, user_name, user_birth];
    	          adminTbody.append(adminMakeTable(tbodyValue, theadValue));
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
	              let {rev_idx, eat_name, user_idx, rev_content, rev_date} = data.adminReviewData[i];
	              let tbodyValue = [rev_idx, eat_name, user_idx, rev_content, rev_date];
	              adminTbody.append(adminMakeTable(tbodyValue, theadValue));
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
    	        let {idol_idx, idol_group, idol_name} = data.adminIdolData[i];
    	        let tbodyValue = [idol_idx, idol_group, idol_name];
    	        adminTbody.append(adminMakeTable(tbodyValue, theadValue));
    	      }
    	 },
      	 error:function(err){
      		 console.log(err);
      	 }
      });
    }
    //검색어를 입력하고 검색 버튼을 눌렀을 때 실행되는 함수
    function adminSearchClick(){
      const adminCategory = document.getElementById("buttonFlag");
      const adminFind = document.getElementById("adminFind").value;
      if(adminFind == ""){
    	  alert("검색어를 입력해주세요.");
      }else{
	      $.ajax({
	    	 type:"GET",
	    	 url:"/adminSearch",
	    	 data:{
	    		 "adminFind":adminFind, //검색 결과
	    		 "adminCategory":adminCategory //
	    	 },
	    	 dataType:"JSON",
	    	 success:function(data){
	    	      switch(adminCategory){
	    	        case "eat":{
	    	          const theadValue = ["번호", "가게명", "아이돌 번호", "회원번호", "날짜", "상세정보"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {eat_idx, eat_name, idol_idx, user_idx, eat_date} = data.adminSearchData[i];
	    	            let tbodyValue = [eat_idx, eat_name, idol_idx, user_idx, eat_date];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue));
	    	          }
	    	          break;
	    	        }
	    	        case "member":{
	    	          const theadValue = ["회원번호", "아이디", "닉네임", "이름", "출생연도", "상세정보"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {user_idx, user_id, user_nick, user_name, user_birth} = data.adminSearchData[i];
	    	            let tbodyValue = [user_idx, user_id, user_nick, user_name, user_birth];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue));
	    	          }
	    	        }
	    	        case "review":{
	    	          const theadValue = ["리뷰번호", "가게명", "회원번호", "리뷰내용", "작성일", "상세정보"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {rev_idx, eat_name, user_idx, rev_content, rev_date} = data.adminSearchData[i];
	    	            let tbodyValue = [rev_idx, eat_name, user_idx, rev_content, rev_date];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue));
	    	          }
	    	        }
	    	        case "idol":{
	    	          const theadValue = ["아이돌 번호", "그룹명", "이름", "수정", "숨김"];
	    	          adminTableBase(theadValue);
	    	          const adminTbody = document.querySelector("#adminTable>table>tbody");
	    	          for(let i = 0; i<data.adminSearchData.length; i++){
	    	            let {idol_idx, idol_group, idol_name} = data.adminSearchData[i];
	    	            let tbodyValue = [idol_idx, idol_group, idol_name];
	    	            adminTbody.append(adminMakeTable(tbodyValue, theadValue));
	    	          }
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
            console.log(this);
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
	function adminDetailClick(event){
	    const buttonFlag = document.getElementById("buttonFlag").innerHTML;
	    switch(buttonFlag){
		    case "eat":{
				/* $.ajax({
					type:"GET",
					url:"/adminEatDetail",
					data:{
						"eat_idx":event.target.parentNode.parentNode.firstChild.innerHTML
					},
					success:function(result){
						console.log(result);
						window.location.href = "/eatDetail.go";
					},
					error:function(err){
						console.log("adminDetailClick", err);
						if(err) throw err;
					}
				}); */
				window.location.href = "/eatDetail.go?eat_idx="+event.target.parentNode.parentNode.firstChild.innerHTML;
				//event.target.setAttribute("href", "/eatDetail.go?eat_idx="+event.target.parentNode.parentNode.firstChild.innerHTML);
			    break;	
		    }
			case "member":{
				$.ajax({
					type:"GET",
					url:"/adminMemberDetail",
					data:{
						"user_idx":event.target.parentNode.parentNode.firstChild.innerHTML
					},
					success:function(result){
						console.log(result);
						window.location.href = "/memberDetail.go";
					},
					error:function(err){
						console.log("adminDetailClick", err);
						if(err) throw err;
					}
				});
				break;		    	
		    }
			case "review":{
				$.ajax({
					type:"GET",
					url:"/adminReviewDetail",
					data:{
						"rev_idx":event.target.parentNode.parentNode.firstChild.innerHTML
					},
					success:function(data){
						console.log(data);
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
	
	function adminUpdateClick(event){
		$.ajax({
			type:"GET",
			url:"",
			data:{
				"idol_idx":event.target.parentNode.parentNode.firstChild.innerHTML
			},
			success:function(result){
				
			},
			error:function(err){
				console.log("adminDetailClick", err);
				if(err) throw err;
			}
		});		
	}
	function adminBlindClick(event){
		$.ajax({
			type:"GET",
			url:"",
			data:{
				"idol_idx":event.target.parentNode.parentNode.firstChild.innerHTML
			},
			success:function(result){
				
			},
			error:function(err){
				console.log("adminDetailClick", err);
				if(err) throw err;
			}
		});
	}
    //adminEatClick();
  </script>
</body>
</html>