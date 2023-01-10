<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>맛집 상세 정보</title>
<link rel="stylesheet" href="resources/css2/eatDetail.css" type="text/css">

</head>
<body>
   <!-- 맛집 상세 정보 -->
   <main class="eatWrap">
      <!-- 배경 요소 -->
      <img class="img1" src="/resources/img/bottomPattern1025.png" alt="배경요소">
      <img class="img2" src="/resources/img/bottomPattern634.png" alt="배경요소">
      <img class="img3" src="/resources/img/orange64.png" alt="배경요소">
      <img class="img4" src="/resources/img/purple56.png" alt="배경요소">
      <img class="img5" src="/resources/img/purple32.png" alt="배경요소">
      <img class="img6" src="/resources/img/red48.png" alt="배경요소">
      <img class="img7" src="/resources/img/green72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="eatWrap2">
         <!-- 관리자 페이지 헤더 -->
         <header>
            <div onclick="homeGo()"></div>
            <p onclick="logoutFunc()">로그아웃</p>
         </header>
         <!-- 정보 입력 -->
         <section class="eatBox">
            <h2 class="eatBoxTitle">맛집 상세 정보</h2>
            <form>
               <!-- 상단 -->
               <div class="eatInfo1">
                  <div class="eatInfo1Box1">
                     <div><label for="eatDate">등록일:</label><input type="date" id="eatDate" name="eatData" value=${eatUser.eat_date} readonly></div>
                     <div><label for="eatFrindela">회원정보:</label><input type="text" id="eatFrindela" name="eatFrindela" value=${eatUser.user_idx}(${eatUser.user_nick}) readonly></div>
                  </div>
                  <div class="eatInfo1Box2">
                     <p>아이돌 정보</p>
                     <input type="number" id="eatIdolNum" name="eatIdolNum" value=${eatData.idol_idx} readonly>
                     <input type="text" id="eatIdolName" name="eatIdolName" value=${eatData.idol_group}-${eatData.idol_name} readonly>
                  </div>
               </div>
               <!-- 하단 -->
               <div class="eatInfo2">
                  <div class="eatInfoBoxs">
                     <div class="eatInfo2Box1">
                        <p>번호</p>
                        <input type="number" id="eatNum" name="eatNum" value=${eatData.eat_idx} readonly>
                     </div>
                     <div class="eatInfo2Box2">
                        <p>가게명</p>
                        <input type="text" id="eatStore" name="eatStore" value=${eatData.eat_name} readonly>
                     </div>
                     <div class="eatInfo2Box3">
                        <p>주소</p>
                        <input type="text" id="eatAdd1" readonly>
                        <input type="text" id="eatAdd2" readonly>
                     </div>
                     <div class="eatInfo2Box4">
                        <p>출처를 남겨주세요!</p>
                        <textarea type="text" id="eatText" readonly>${eatData.eat_source}</textarea>
                     </div>
                  </div>
                  <div class="eatInfoBtn">
                     <button type="button" class="eatInfoBtn1" onclick="eatCancel()">취소</button>
                     <button type="button" id="adminEatBlind" class="eatInfoBtn2" onclick="eatBlind()">숨김</button>
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>
   <script>
	   if(`${sessionScope.loginId}` == ""){
		   window.location.href="/";
	   }
   		//상태에 따른 css 적용
   		switch(${eatData.eat_state}){
   			case 0:{
   	   			const blindButton = document.getElementById("adminEatBlind");
   	   			blindButton.innerHTML = "숨김 해제";
   	   			//blindButton.setAttribute("class", "eatInfoBtn2");   				
   				break;
   			}
   			case 1:{
   	   			const blindButton = document.getElementById("adminEatBlind");
   	   			blindButton.innerHTML = "숨김";
   	   			//blindButton.setAttribute("class", "eatInfoBlind");   		   		
   				break;
   			}
   		}
   		
   		//주소 나눠서 적용
   		let eatAddress = `${eatData.eat_address}`.split(" ");
   		console.log("eatAddress", eatAddress);
   		let addString1 = "";
   		let addString2 = "";
   		eatAddress.forEach((value, index) => {
            if(eatAddress.length<=5){
                addString1 += (value + " ");
             } else {
                if(index < 5){
                   addString1 += (value + " ");
                } else {
                   addString2 += (value + " ");
                }
             }
   		});
   		document.getElementById("eatAdd1").value = addString1;
   		document.getElementById("eatAdd2").value = addString2;
   		
   		function eatCancel(){
   			window.location.href = "/admin.go";
   		}
   		function eatBlind(){
   			switch(${eatData.eat_state}){
   				case 0:{
   		   			if(!confirm("해당 맛집의 숨김을 해제하시겠습니까? (숨김 해제시 해당 가게의 마커가 지도에 표시됩니다.)")){
   		   				return;
   		   			} else {
   		   				$.ajax({
   		   					type:"GET",
   		   					url:"/eatBlindNo",
   		   					data:{
   		   						eat_idx:${eatData.eat_idx}
   		   					},
   		   					success:function(result){
   		   						console.log("숨김해제");
   		   		   				window.location.href="/admin.go";
   		   					},
   		   					error:function(err){
   		   						console.log("eatBlind", err);
   		   						if(err) throw err;
   		   					}
   		   				});
   		   			}   					
   					break;
   				}
   				case 1:{
   		   			if(!confirm("해당 맛집을 숨김처리하시겠습니까? (숨김처리시 해당 가게의 마커는 지도에 보이지 않습니다.)")){
   		   				return;
   		   			} else {
   		   				$.ajax({
   		   					type:"GET",
   		   					url:"/eatBlindYes",
   		   					data:{
   		   						eat_idx:${eatData.eat_idx}
   		   					},
   		   					success:function(result){
   		   						console.log("숨김처리 완료");
   		   						window.location.href="/admin.go";
   		   					},
   		   					error:function(err){
   		   						console.log("eatBlind", err);
   		   						if(err) throw err;
   		   					}
   		   				});
	   		   			
   		   			}   					
   					break;
   				}
   			}

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