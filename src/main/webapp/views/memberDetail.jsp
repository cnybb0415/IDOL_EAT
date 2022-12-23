<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css2/memberDetail.css">
<title>회원정보</title>
</head>
<body>
   <!-- 회원정보 -->
   <main class="memberWrap">
      <!-- 배경 요소 -->
      <img class="img1" src="/resources/img/bottomPattern1025.png" alt="배경요소">
      <img class="img2" src="/resources/img/bottomPattern634.png" alt="배경요소">
      <img class="img3" src="/resources/img/orange64.png" alt="배경요소">
      <img class="img4" src="/resources/img/purple56.png" alt="배경요소">
      <img class="img5" src="/resources/img/purple32.png" alt="배경요소">
      <img class="img6" src="/resources/img/red48.png" alt="배경요소">
      <img class="img7" src="/resources/img/green72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="memberWrap2">
         <!-- 관리자 페이지 헤더 -->
         <header>
            <div></div>
            <p>닉네임 관리자님 환영합니다.</p>
         </header>
         <!-- 정보 입력 -->
         <section class="memberBox">
            <h2 class="memberBoxTitle">회원정보</h2>
            <form>
               <!-- 상단 -->
               <div class="memberInfo1">
                  <div class="memberInfo1Box">
                     <p>아이디</p>
                     <input type="text" id="memberId" name="memberId"  readonly value=${userDetail.user_id}>
                  </div>
                  <div class="memberInfo1Box">
                     <p>닉네임</p>
                     <input type="text" maxlength="8" id="memberFrindela" name="memberFrindela"  readonly value=${userDetail.user_nick}>
                  </div>
                   <div class="memberInfo1Box">
                        <p>이름</p>
                        <input type="text" id="memberName" name="memberName" readonly value=${userDetail.user_name}>
                    </div>
               </div>
               <!-- 하단 -->
               <div class="memberInfo2">
                  <div class="memberInfoBoxs">
                     <div class="memberInfoBox2">
                        <p>생년월일</p>
                        <div>
                           <input type="number" id="memberBirthY" readonly name="memberBirthY">
                           <input type="number" id="memberBirthM" readonly name="memberBirthM">
                           <input type="number" id="memberBirthD" readonly name="memberBirthD">
                        </div>
                     </div>
                     <div class="memberInfoBox3">
                        <p>주소</p>
                        <input type="search" id="memberAdd1" name="memberAdd1"  readonly>
                        <input type="search" id="memberAdd2" name="memberAdd2"  readonly>
                     </div>
                  </div>
                  <div class="memberInfoBtn">
                     <button class="memberInfoBtn1" onclick="memberCancel()">취소</button>
                     <button id="adminMemberBlind" class="memberInfoBtn2" onclick="memberBlind()">숨김</button>
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>
   <script>
		function memberCancel(){
   			window.location.href = "/admin.go";
   		}
   		function memberBlind(){
   			let user_index = String(${userDetail.user_idx});
   			console.log(${userDetail.user_idx});
   			switch(${userDetail.user_state}){
				case 0:{
					if(!confirm("해당 회원의 숨김을 해제하시겠습니까? (숨김 해제 시 해당 회원은 로그인이 가능해집니다.)")){
		   				window.location.href="/memberDetail.go?user_idx=" + ${userDetail.user_idx};
		   			} else {
   		   				$.ajax({
   		   					type:"GET",
   		   					url:"/memberBlindNo",
   		   					data:{
   		   						user_idx:user_index
   		   					},
   		   					success:function(result){
   		   						console.log("숨김해제");
   		   					},
   		   					error:function(err){
   		   						console.log("memberBlind", err);
   		   						if(err) throw err;
   		   					}
   		   				});
		   				window.location.href="/admin.go";
		   			}   					
					break;
				}
				case 1:{
					if(!confirm("해당 회원을 숨김처리하시겠습니까? (숨김 처리 시 해당 회원은 로그인이 불가합니다.)")){
						window.location.href="/memberDetail.go?user_idx=" + ${userDetail.user_idx};
		   			} else {
   		   				$.ajax({
   		   					type:"GET",
   		   					url:"/memberBlindYes",
   		   					data:{
   		   						user_idx:user_index
   		   					},
   		   					success:function(result){
   		   						console.log("숨김처리 완료");
   		   					},
   		   					error:function(err){
   		   						console.log("memberBlind", err);
   		   						if(err) throw err;
   		   					}
   		   				});
		   				window.location.href="/admin.go";
		   			}   					
					break;
				}
			}
   		}
   		switch(${userDetail.user_state}){
   			case 0:{
   				const blindButton = document.getElementById("adminMemberBlind");
   				blindButton.innerHTML = "숨김 해제";   				
   				//blindButton.setAttribute("class", "memberInfoBlind");
   				break;
   			}
   			case 1:{
   				const blindButton = document.getElementById("adminMemberBlind");
   				blindButton.innerHTML = "숨김";
   				//blindButton.setAttribute("class", "memberInfoBtn2");   				
   				break;
   			}
   		}
   	
   		const memberBirthY = document.getElementById("memberBirthY");
   		const memberBirthM = document.getElementById("memberBirthM");
   		const memberBirthD = document.getElementById("memberBirthD");
   		
   		let memberDate = new Date(`${userDetail.user_birth}`);
   		console.log(memberDate);
 		memberBirthY.value = memberDate.getFullYear();
 		memberBirthM.value = memberDate.getMonth() + 1;
 		memberBirthD.value = memberDate.getDate();
   		
 		//주소 나눠서 적용
   		let memberAddress = `${userDetail.user_address}`.split(" ");
   		let addString1 = "";
   		let addString2 = "";
   		memberAddress.forEach((value, index) => {
            if(memberAddress.length<=5){
                addString1 += (value + " ");
             } else {
                if(index < 5){
                   addString1 += (value + " ");
                } else {
                   addString2 += (value + " ");
                }
             }
   		});
   		document.getElementById("memberAdd1").value = addString1;
   		document.getElementById("memberAdd2").value = addString2;
   </script>
</body>
</html>