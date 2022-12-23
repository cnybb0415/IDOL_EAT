<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin2.css"> --%>
<link rel="stylesheet" type="text/css" href="resources/css2/idolUpdate.css">
<meta charset="UTF-8">
<title>아이돌 수정</title>
</head>
<body>
   <!-- 아이돌 정보 수정 -->
   <main class="idolUpdateWrap">
      <!-- 배경 요소 -->
      <img class="img1" src="/resources/img/bottomPattern1025.png" alt="배경요소">
      <img class="img2" src="/resources/img/bottomPattern634.png" alt="배경요소">
      <img class="img3" src="/resources/img/orange64.png" alt="배경요소">
      <img class="img4" src="/resources/img/purple56.png" alt="배경요소">
      <img class="img5" src="/resources/img/purple32.png" alt="배경요소">
      <img class="img6" src="/resources/img/red48.png" alt="배경요소">
      <img class="img7" src="/resources/img/green72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="idolUpdateWrap2">
         <!-- 관리자 페이지 헤더 -->
         <header>
            <div></div>
            <p>닉네임 관리자님 환영합니다.</p>
         </header>
         <!-- 정보 입력 -->
         <section class="idolUpdateBox">
            <h2 class="idolUpdateBoxTitle">아이돌 정보 수정</h2>
            <form action="idolUpdate.do" method="POST" enctype="multipart/form-data" onsubmit="idolUpdateSubmit(event)">
               <div class="idolUpdateImgs">
                  <img id="idolUpdateBoxImg" class="idolUpdateBoxImg" src=/photo/${idolDetail.idol_img_new} alt="아이돌 사진">
                  <img id="idolUpdateBoxMarkerImg" class="idolUpdateBoxMarkerImg" src=/photo/${idolDetail.idol_mark_new} alt="마커 사진">
               </div>
               <div class="idolUpdateInfo">
                  <div class="idolUpdateInfoBoxs">
                     <div class="idolUpdateInfoBox">
                        <p>아이돌 번호</p>
                        <input type="number" id="idolUpdateNum" name="idol_idx" value=${idolDetail.idol_idx} readonly>
                     </div>
                     <div class="idolUpdateInfoBox">
                        <p>그룹명</p>
                        <input type="text" id="idolUpdateGroup" name="idol_group" placeholder="그룹 이름을 입력하세요" value=${idolDetail.idol_group}>
                     </div>
                     <div class="idolUpdateInfoBox">
                        <p>이름</p>
                        <input type="text" id="idolUpdateName" name="idol_name" placeholder="아이돌 이름을 입력하세요" value=${idolDetail.idol_name}>
                     </div>
                     <div class="idolUpdateInfoImg">
                        <p>아이돌 이미지 첨부</p>
                        <div>
                           <input id="idolImgCover" class="imgUpload" disabled>
                           <label for="inputIdolImg">업로드</label>
                           <input type="file" id="idolUpdateImg" name="idol_img_ori" class="inputIdolImg" onchange="updateImgChange(event)">
                        </div>
                     </div>
                     <div class="idolUpdateInfoImg">
                        <p>마커 이미지 첨부</p>
                        <div>
                           <input id="idolMarkerCover" class="imgUpload" disabled>
                           <label for="inputMarkerImg">업로드</label>
                           <input type="file" id="idolMarkerImg" class="inputMarkerImg" name="idol_mark_ori" onchange="updateMarkerChange(event)"> 
                        </div>
                     </div>
                  </div>
                  <div class="idolUpdateInfoBtn">
                     <div class="idolUpdateInfoBtn1" onclick="idolUpdateCancel()">취소</div>
                     <button class="idolUpdateInfoBtn2">수정하기</button>
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>
   <script>
   	 let idolUpdateGroup = document.getElementById("idolUpdateGroup").value;
	 let idolUpdateName = document.getElementById("idolUpdateName").value;
	 let idolImgCover = document.getElementById("idolImgCover").value;
	 let idolMarkerCover = document.getElementById("idolMarkerCover").value;

	 function idolUpdateSubmit(e){
		alert("submit!");
       if(idolAddGroup == "" || idolAddName == "" || idolImgName == "" || idolMarkerName == ""){
          alert("폼 내용을 모두 채워주세요.");            
          e.preventDefault();
       }
       else{
      	 if(!confirm("해당 내용으로 아이돌을 수정하시겠습니까?")){
      		 e.preventDefault();
      	 }else{
      		 return;
      	 }
       }
    }
    
    function idolUpdateCancel(){
  	  if(!confirm("아이돌 수정을 취소하시겠습니까?")){
  		  return;
  	  }else{
  		  window.location.href = "/admin.go";
  	  }
    }

    function updateImgChange(event){
       document.getElementById("idolImgCover").value =  document.getElementById("idolUpdateImg").value;
       let reader = new FileReader();
       reader.onload = function(e) {
          document.getElementById("idolUpdateBoxImg").setAttribute("src", e.target.result);
       };
       reader.readAsDataURL(event.target.files[0]);
    }

    function updateMarkerChange(event){
       document.getElementById("idolMarkerCover").value =  document.getElementById("idolMarkerImg").value;
       let reader = new FileReader();
       reader.onload = function(e) {
          document.getElementById("idolUpdateBoxMarkerImg").setAttribute("src", e.target.result);
       };
       reader.readAsDataURL(event.target.files[0]);
    }
   </script>
</body>
</html>