<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/eat.css">
<meta charset="UTF-8">
<title>맛집 상세 정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
   <!-- 맛집 상세 정보 -->
   <h3>${eatUser.user_idx}</h3>
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
            <div></div>
            <p>닉네임 관리자님 환영합니다.</p>
         </header>
         <!-- 정보 입력 -->
         <section class="eatBox">
            <h2 class="eatBoxTitle">맛집 상세 정보</h2>
            <form>
               <!-- 상단 -->
               <div class="eatInfo1">
                  <div class="eatInfo1Box1">
                     <div><label for="eatDate">등록일:</label><input type="date" id="eatDate" name="eatData" readonly></div>
                     <div><label for="eatFrindela">회원정보:</label><input type="text" id="eatFrindela" name="eatFrindela" readonly></div>
                  </div>
                  <div class="eatInfo1Box2">
                     <p>아이돌 정보</p>
                     <input type="number" id="eatIdolNum" name="eatIdolNum" readonly>
                     <input type="text" id="eatIdolName" name="eatIdolName" readonly>
                  </div>
               </div>
               <!-- 하단 -->
               <div class="eatInfo2">
                  <div class="eatInfoBoxs">
                     <div class="eatInfo2Box1">
                        <p>번호</p>
                        <input type="number" id="eatNum" name="eatNum" readonly>
                     </div>
                     <div class="eatInfo2Box2">
                        <p>가게명</p>
                        <input type="text" id="eatStore" name="eatStore" readonly>
                     </div>
                     <div class="eatInfo2Box3">
                        <p>주소</p>
                        <input type="text" id="eatAdd1" readonly>
                        <input type="text" id="eatAdd2" readonly>
                     </div>
                     <div class="eatInfo2Box4">
                        <p>출처를 남겨주세요!</p>
                        <textarea type="text" id="eatText" name="eatText" readonly></textarea>
                     </div>
                  </div>
                  <div class="eatInfoBtn">
                     <button class="eatInfoBtn1">취소</button><button class="eatInfoBtn2">숨김</button>
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>
   <script>
/*     function eatDetailStart(){
       $.ajax({
          type:"GET",
          url:"/adminEatDetail",
          dataType:"JSON",
          success:function(data){
             console.log(data);
          },
          error:function(err){
             console.log("eatDetailStart", err);
             if(err) throw err;
          }
       });
    }
   	eatDetailStart(); */
   	let address = `${eatData.eat_adress}`;
   	console.log(address);
   </script>
</body>
</html>