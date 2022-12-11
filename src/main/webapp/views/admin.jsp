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
          <div title="검색아이콘"></div>
        </div>
        <div class="adminButton">
          <div>
            <button onclick="adminEatClick()">맛집관리</button>
            <button onclick="adminMemberClick()">회원관리</button>
            <button onclick="adminReviewClick()">리뷰관리</button>
            <button onclick="adminIdolClick()">아이돌 추가</button>
            <p id="buttonFlag"></p>
          </div>
          <div>
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

    /*let value = [
      {"eat_idx":"2222222", "idol_idx":"2222222", "eat_adress":"수원서울안산안양오산화성병점", "eat_name":"가게이름인데어디까지길어지는지알아맞춰보아요", "eat_date":"2022.12.25", "user_idx":"2222222", "eat_source":"유퀴즈온더블럭", "eat_state":"0", "user_idx":"2222222"},
      {"eat_idx":"2222222", "idol_idx":"2222222", "eat_adress":"수원서울안산안양오산화성병점", "eat_name":"가게이름인데어디까지길어지는지알아맞춰보아요", "eat_date":"2022.12.25", "user_idx":"2222222", "eat_source":"유퀴즈온더블럭", "eat_state":"0", "user_idx":"2222222"},
      {"eat_idx":"2222222", "idol_idx":"2222222", "eat_adress":"수원서울안산안양오산화성병점", "eat_name":"가게이름인데어디까지길어지는지알아맞춰보아요", "eat_date":"2022.12.25", "user_idx":"2222222", "eat_source":"유퀴즈온더블럭", "eat_state":"0", "user_idx":"2222222"}
    ];*/

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

    function adminMakeTable(tableField, classValue){ //tableField는 배열 형태
      const tr = document.createElement("tr");
      for(let i = 0; i<classValue.length; i++){ 
        let td = document.createElement("td"); 
        td.setAttribute("class", adminClassSelector(classValue[i]));
        if(classValue[i] == "상세정보" || classValue[i] == "수정"){
          td.innerHTML = `<button class=orangeButton>${classValue[i]}</button>`;
        } else if(classValue[i] == "숨김"){ 
          td.innerHTML = `<button class=purpleButton>${classValue[i]}</button>`;
        } else {
          td.innerHTML = tableField[i];
        }
        tr.append(td);
      }
      return tr;
    }

    function adminEatClick(){
      const buttonFlag = document.getElementById("buttonFlag");
      buttonFlag.innerHTML = "eat";
      const theadValue = ["번호", "가게명", "아이돌 번호", "회원번호", "날짜", "상세정보"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      /*fetch("/")
        .then(res => res.json())
        .then(adminEatData => {
          console.log(data);
        })
        .catch(err => {
          console.log("adminEatClick fetch error", err);
        })*/
      for(let i = 0; i<value.length; i++){
        let {eat_idx, eat_name, idol_idx, user_idx, eat_date} = value[i];
        let tbodyValue = [eat_idx, eat_name, idol_idx, user_idx, eat_date];
        adminTbody.append(adminMakeTable(tbodyValue, theadValue));
      }
    }

    function adminMemberClick(){
      const buttonFlag = document.getElementById("buttonFlag");
      buttonFlag.innerHTML = "member";
      const theadValue = ["회원번호", "아이디", "닉네임", "이름", "출생연도", "상세정보"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      for(let i = 0; i<value.length; i++){
        let {user_idx, user_id, user_nick, user_name, user_birth} = value[i];
        let tbodyValue = [user_idx, user_id, user_nick, user_name, user_birth];
        adminTbody.append(adminMakeTable(tbodyValue, theadValue));
      }
    }

    function adminReviewClick(){
      const buttonFlag = document.getElementById("buttonFlag");
      buttonFlag.innerHTML = "review";
      const theadValue = ["리뷰번호", "가게명", "회원번호", "리뷰내용", "작성일", "상세정보"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      for(let i = 0; i<value.length; i++){
        let {rev_idx, eat_name, user_idx, rev_content, rev_date} = value[i];
        let tbodyValue = [rev_idx, eat_name, user_idx, rev_content, rev_date];
        adminTbody.append(adminMakeTable(tbodyValue, theadValue));
      }
    }

    function adminIdolClick(){
      const buttonFlag = document.getElementById("buttonFlag");
      buttonFlag.innerHTML = "idol";
      const theadValue = ["아이돌 번호", "그룹명", "이름", "수정", "숨김"];
      adminTableBase(theadValue);
      const adminTbody = document.querySelector("#adminTable>table>tbody");
      /*fetch("http://localhost:8080/idolList", {
		headers: {
			Accept:"application / json"
		},
		method:"GET"
      })
      .then((response) => {
    	console.log(response);
      })
      .then((data) => {
        console.log(data.adminIdolData);
        //console.log("data: " + data);
      })
      .catch(err => {
        console.log("adminIdolClick error", err);
        if(err) throw err;
      });*/
      $.ajax({
    	 type:"GET",
    	 url:"/idolList",
    	 dataType:"JSON",
    	 success:function(data){
    		 let {idol_idx} = data.adminIdolList[0];
    		 console.log(idol_idx);
    	 },
      	 error:function(err){
      		 console.log(err);
      	 }
      });
      /*
      for(let i = 0; i<value.length; i++){
        let {idol_idx, idol_group, idol_name} = value[i];
        let tbodyValue = [idol_idx, idol_group, idol_name];
        adminTbody.append(adminMakeTable(tbodyValue, theadValue));
      }*/
    }

    //adminEatClick();
  </script>
</body>
</html>