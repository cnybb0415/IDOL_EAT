<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/idolAdd.css" type="text/css">
<meta charset="UTF-8">
<title>아이돌 추가 페이지</title>
</head>
<body>
   <!-- 아이돌 정보 추가 -->
   <main class="idolAddWrap">
      <!-- 배경 요소 -->
      <img class="img1" src="/resources/img/bottomPattern1025.png" alt="배경요소">
      <img class="img2" src="/resources/img/bottomPattern634.png" alt="배경요소">
      <img class="img3" src="/resources/img/orange64.png" alt="배경요소">
      <img class="img4" src="/resources/img/purple56.png" alt="배경요소">
      <img class="img5" src="/resources/img/purple32.png" alt="배경요소">
      <img class="img6" src="/resources/img/red48.png" alt="배경요소">
      <img class="img7" src="/resources/img/green72.png" alt="배경요소">
      <!-- 헤더, 정보 입력 -->
      <div class="idolAddWrap2">
         <!-- 관리자 페이지 헤더 -->
         <header>
            <div></div>
            <p>닉네임 관리자님 환영합니다.</p>
         </header>
         <!-- 정보 입력 -->
         <section class="idolAddBox">
            <h2 class="idolAddBoxTitle">아이돌 정보 추가</h2>
            <form action="adminIdol.do" method="POST" enctype="multipart/form-data" onsubmit="idolAddSubmit(event)">
               <div class="idolAddImgs">
                  <img class="idolAddBoxImg" id="idolAddImg" src="" alt="아이돌 사진">
                  <img class="idolAddBoxMarkerImg" id="markerAddImg" src="" alt="마커 사진">
               </div>
               <div class="idolAddInfo">
                  <div class="idolAddInfoBoxs">
                     <div class="idolAddInfoBox">
                        <p>그룹명</p>
                        <input type="text" name="idolAddGroup" id="idolAddGroup" placeholder="그룹 이름을 입력하세요">
                     </div>
                     <div class="idolAddInfoBox">
                        <p>이름</p>
                        <input type="text" name="idolAddName" id="idolAddName" placeholder="아이돌 이름을 입력하세요">
                     </div>
                     <div class="idolAddInfoImg">
                        <p>아이돌 이미지 첨부</p>
                        <div>
                           <input class="imgUpload" id="idolImgName" disabled="disabled" onchange="readURL(this);">
                           <label for="inputIdolImg">업로드</label>
                           <input type="file" name="inputIdolImg" id="inputIdolImg" class="inputIdolImg" onchange="idolImgChange(event)">
                        </div>
                     </div>
                     <div class="idolAddInfoImg">
                        <p>마커 이미지 첨부</p>
                        <div>
                           <input class="imgUpload" id="idolMarkerName" disabled="disabled" onchange="readURL(this);">
                           <label for="inputMarkerImg">업로드</label>
                           <input type="file" name="inputIdolMark" id="inputMarkerImg" class="inputMarkerImg" onchange="idolMarkerChange(event)"> 
                        </div>
                     </div>
                  </div>
                  <div class="idolAddInfoBtn">
                     <button class="idolAddInfoBtn1">취소</button><input type="submit" id="idolAddInfoBtn2" class="idolAddInfoBtn2" value="추가하기">
                  </div>
               </div>
            </form>
         </section>
      </div>
   </main>
   <script>
      function idolAddSubmit(e){
         const idolAddGroup = document.getElementById("idolAddGroup").value;
         const idolAddName = document.getElementById("idolAddName").value;
         const idolImgName = document.getElementById("idolImgName").value;
         const idolMarkerName = document.getElementById("idolMarkerName").value;
         
         if(idolAddGroup == "" || idolAddName == "" || idolImgName == "" || idolMarkerName == ""){
            alert("폼 내용을 모두 채워주세요.");            
            e.preventDefault();
         }
         else{
            //confirm()
         }
      }

      function idolImgChange(event){
         document.getElementById("idolImgName").value =  document.getElementById("inputIdolImg").value;
         let reader = new FileReader();
         reader.onload = function(e) {
            document.getElementById("idolAddImg").setAttribute("src", e.target.result);
         };
         reader.readAsDataURL(event.target.files[0]);
      }

      function idolMarkerChange(event){
         document.getElementById("idolMarkerName").value =  document.getElementById("inputMarkerImg").value;
         let reader = new FileReader();
         reader.onload = function(e) {
            document.getElementById("markerAddImg").setAttribute("src", e.target.result);
         };
         reader.readAsDataURL(event.target.files[0]);
      }
      
   </script>
</body>
</html>