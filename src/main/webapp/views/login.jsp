<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet" href="resources/css2/login.css">
<title>로그인</title>
</head>
<body>
   <!-- 로그인 -->
   <main class="loginWrap">
      <!-- 배경 요소 -->
      <img class="img0" src="resources/img/topPattern849.png" alt="배경요소">
      <img class="img1" src="resources/img/bottomPattern918.png" alt="배경요소">
      <img class="img3" src="resources/img/orange64.png" alt="배경요소">
      <img class="img2" src="resources/img/bottomPattern654.png" alt="배경요소">
      <img class="img4" src="resources/img/green56.png" alt="배경요소">
      <img class="img5" src="resources/img/green32.png" alt="배경요소">
      <img class="img6" src="resources/img/red48.png" alt="배경요소">
      <img class="img7" src="resources/img/salmon72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="loginWrap2">
         <!-- 정보 입력 -->
         <section class="loginBox">
            <h2 class="loginBoxTitle">로그인</h2>
            <form>
               <!-- 상단 -->
               <div class="loginInfo1">
                  <div class="loginInfo1Box">
                     <label for="loginId">아이디</label>
                     <input type="text" id="loginId" name="loginId" placeholder="아이디를 입력하세요">
                  </div>
                  <div class="loginInfo1Box">
                     <label for="loginPw">비밀번호</label>
                     <input type="password" id="loginPw" name="loginPw" placeholder="비밀번호를 입력하세요">
                  </div>
               </div>
               <!-- 하단 -->
               <div class="loginInfo2">
                  <div class="loginInfoBtn">
                     <button class="loginInfoBtn1" disabled>로그인</button>
                  </div>
                  <p>아직 회원이 아니신가요?<a href="/join.go">회원가입</a></p>
               </div>
            </form>
         </section>
      </div>
   </main>
   
   <!-- alert -->
   <section class="loginAlert">
      <h3 title="경고아이콘"></h3>
      <p>아이디 또는 비밀번호가 일치하지 않습니다.<br>다시 입력해주세요.</p>
      <button type="button">확인</button>
   </section>

   <!-- JS -->
   <script>
  	window.addEventListener("load", ()=>{
	   
	   /* EVENT -- Confirm Value */
	   const loginId = document.querySelector("#loginId");
	   const loginPw = document.querySelector("#loginPw");
	   const loginButton = document.querySelector(".loginInfoBtn1");

 	   const confirmEmpty = () => {
	     if(loginId.value != "" && loginPw.value != ""){
	       loginButton.disabled = false;
	       loginButton.style.backgroundColor = "#f9a269";
	     } else{
	       loginButton.disabled = true;
	       loginButton.style.backgroundColor = "#d4d4d4";
	     }
	   }// const confirmEmpty

	   loginId.addEventListener("keyup", e => {
	     confirmEmpty();
	   });

	   loginPw.addEventListener("keyup", e => {
	     confirmEmpty();
	   });

	   const loginAjax = () => {
		   console.log(loginId.value);
		   $.ajax({
			   type:"POST",
			   url:"/login.do", //로그인 정보 받는 매퍼 여기에 적어주시면 됩니다.
			   data:{
			         loginId: loginId.value,
			         loginPw: loginPw.value,				   
			   },
			   dataType:"JSON",
			   success:function(data){ // 아이디나 비밀번호가 일치하지 않으면 loginFalse 라는 문자열을 보내주세요. 일치하면 mainPage로 이동시켜주세요.
			         if(data.msg == 'loginFalse'){
			           //경고창 띄우기
			           alert('아이디 또는 비밀번호가 일치하지 않습니다.');
			           window.scrollTo(0, 0);	
			           }else{
			        	   window.location.href = "/main.go";
			           }
			   		},
			   	error:function(err){
			    	 console.log("loginAjax", JSON.stringify(err));
			     }
		   });
	   }

	   loginButton.addEventListener("click", e => {
	     e.preventDefault();
	     loginAjax();
	   });

	 });
   </script>
</body>
</html>