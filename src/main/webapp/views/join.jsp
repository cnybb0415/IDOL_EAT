<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet" href="resources/css2/join.css">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>회원가입</title>
</head>
<body>
   <!-- 회원가입 -->
   <main class="joinWrap">
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
      <div class="joinWrap2">
         <!-- 정보 입력 -->
         <section class="joinBox">
            <h2 class="joinBoxTitle">회원가입</h2>
            <form>
               <!-- 상단 -->
               <div class="joinInfo1">
                  <div class="joinInfo1Box">
                     <label for="joinId">아이디</label>
                     <input type="text" id="joinId" name="joinId" placeholder="6~15자 영어,숫자 혼용" maxlength="15">
                     <i class="xi-check-circle"></i>
                  </div>
                  <div class="joinInfo1Box">
                     <label for="joinPw">비밀번호</label>
                     <input type="password" id="joinPw" name="joinPw" placeholder="6~15자 영어,숫자 혼용" maxlength="15">
                     <i class="xi-check-circle"></i>
                  </div>
                  <div class="joinInfo1Box">
                     <label for="joinFrindela">닉네임</label>
                     <input type="text" maxlength="8" id="joinFrindela" name="joinFrindela" placeholder="8자 이하 한글,영어,숫자" maxlength="8">
                     <i class="xi-check-circle"></i>
                  </div>
               </div>
               <!-- 하단 -->
               <div class="joinInfo2">
                  <div class="joinInfoBoxs">
                     <div class="joinInfoBox1">
                        <label for="joinName">이름</label>
                        <input type="text" id="joinName" name="joinName" placeholder="이름을 입력하세요">
                        <i class="xi-check-circle"></i>
                     </div>
                     <div class="joinInfoBox2">
                        <label for="joinBirthY">생년월일</label>
                        <div>
                           <input type="number" id="joinBirthY" name="joinBirthY" placeholder="YYYY">
                           <input type="number" id="joinBirthM" name="joinBirthM" placeholder="MM">
                           <input type="number" id="joinBirthD" name="joinBirthD" placeholder="DD">
                        </div>
                     </div>
                     <div class="joinInfoBox3">
                        <label for="joinAdd1">주소</label>
                        <input type="text" id="joinAdd1" name="joinAdd1" placeholder="주소를 입력하세요" readonly>
                        <input type="text" id="joinAdd2" name="joinAdd2" placeholder="상세 주소를 입력하세요">
                     </div>
                  </div>
                  <div class="joinInfoBtn">
                     <button type="button" class="joinInfoBtn1" onclick="joinCancel()">취소</button>
                     <button type="submit" class="joinInfoBtn2">가입하기</button>
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>

   <!-- JS -->
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="resources/js/joinScript.js"></script>
</body>
</html>