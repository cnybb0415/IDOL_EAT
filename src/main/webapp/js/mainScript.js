window.addEventListener("load", () => {  
  const mapContainer = document.getElementById("mainMap"),
  options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), //처음 지도 불러올 때 center가 될 부분
    level: 7
  }
  let map = new kakao.maps.Map(mapContainer, options); //지도 담을 container, center 좌표  

  let mapTypeControl = new kakao.maps.MapTypeControl(); //컨트롤러 메소드 담는 핸들러 변수
  map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); 

  const mainSearchBox = document.querySelector(".mainSearchBox");
  const qSearch = document.querySelector('input[name="qSearch"]');
  const mainListHeader = document.querySelector(".mainList>header");
  const mainEatList = document.querySelector(".mainEatList");
  let mainIdolArray = 0;
  let mainIdolIndex = 0;
  let mainMarkerArray = [];

  const starListLi = number => {
    let revStar = "";
    for(let j = 0; j < 5; j++){
      if( j < number ){
        revStar += `<li class="activeStar"></li>`;
      } else {
        revStar += `<li></li>`
      }
    }

    return revStar;
  }

  const detailFunc = e => {
  	window.location.href = "/revDetail.go?eat_idx=" + e.target.name;
  }

  //마커 생성 및 이동 함수
  const markerMake = (counter, map, markIdx, markAddr, markName, markImg, clickTarget) => {
    
    let markPos = 0;
    const geocoder = new kakao.maps.services.Geocoder();
      // 주소로 좌표를 검색합니다
    geocoder.addressSearch(markAddr, function(result, status) { //address_value가 주소 들어가는 부분
      // 정상적으로 검색이 완료됐으면 
      if (status === kakao.maps.services.Status.OK) {
        markPos = new kakao.maps.LatLng(result[0].y, result[0].x);
      }
      // 마커 이미지의 이미지 크기 입니다
      const imageSize = new kakao.maps.Size(40, 45); 
      // 마커 이미지를 생성합니다    
      const markerImage = new kakao.maps.MarkerImage(markImg, imageSize); 
      // 마커를 생성합니다
      const marker = new kakao.maps.Marker({
          map: map, // 마커를 표시할 지도
          position: markPos, // 마커를 표시할 위치
          title : markName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
          image : markerImage, // 마커 이미지
          clickable:true
      });
      kakao.maps.event.addListener(marker, 'click', function(){
      	window.location.href="/revDetail.go?eat_idx=" + markIdx 
      });
      mainMarkerArray.push(marker);

      clickTarget.onclick = () => {
        map.panTo(markPos);
      };

      if(counter == 0){
        map.panTo(markPos);
      }
      return markPos;
      //console.log(markPos);
    });
  }

  const clickList = e => {
  	let idolImgName = "";
   	mainIdolArray.forEach((value) => {
	   	if(value.idol_name == e.target.innerText){
	    	mainIdolIndex = value.idol_idx;
	    	idolImgName = value.idol_img_new;
	    } 
	});
	mainListHeader.innerHTML = `
      	<img src=/photo/${idolImgName} alt=${e.target.innerText} 사진>
      	<p><span>${e.target.innerHTML}</span>님의 추천 맛집</p>
    `;
	console.log(mainIdolIndex);
	qSearch.value = "";
    mainSearchBox.lastChild.remove();

    if(mainEatList.childElementCount != 0 ){mainEatList.innerHTML=``;}
    
    for(let i = 0; i<mainMarkerArray.length; i++){
    	mainMarkerArray[i].setMap(null);
    }

	$.ajax({
		type:"POST",
		url:"idolMain",
		data:{
			idol_idx: mainIdolIndex
		},
		dataType:"JSON",
		success:function(data){
			for(let i = 0; i < data.mainEatList.length; i++){
	          const createArticle = document.createElement("article");
	          const createDiv = document.createElement("div");
	          const createEatName = document.createElement("span");
	          const createButton = document.createElement("button");
	
	          const createAddress = document.createElement("p");
	          const createUl = document.createElement("ul");
	          	
	          createEatName.innerText = `${data.mainEatList[i].eat_name}`;
	          createButton.setAttribute("type", "button");
	          createButton.setAttribute("name", `${data.mainEatList[i].eat_idx}`);
	          createButton.onclick = e => detailFunc(e);
	          createDiv.append(createEatName);
	          createDiv.append(createButton);
	
	          createAddress.innerText = `${data.mainEatList[i].eat_address}`;
	          createUl.className = 'starList';
	          createUl.innerHTML = `${starListLi(Number(data.mainEatList[i].rev_star))}`
	
	          markerMake(i, map, data.mainEatList[i].eat_idx, data.mainEatList[i].eat_address, data.mainEatList[i].eat_name, `/photo/${data.mainEatList[i].idol_mark_new}`, createArticle);
	          createArticle.append(createDiv);
	          createArticle.append(createAddress);
	          createArticle.append(createUl);
	          mainEatList.append(createArticle);
	
	        }
		},
		error:function(err){
			console.log("idolMain", err);
			if(err) throw err;
		}
	});
  }
  //검색할 때 나오는 리스트
  const createSearch = (list, target) => {
    const createUl = document.createElement("ul");
    createUl.classList.add('searchListName');
    for(let i = 0; i < list.length; i++){
      const createLi = document.createElement("li");
      createLi.innerText = `${list[i].idol_name}`;
      createLi.onclick = e => clickList(e);
      createUl.append(createLi);
    }
    target.append(createUl);
  }

  //아이돌 검색
  qSearch.addEventListener("keyup", e => {
    if(mainSearchBox.childElementCount > 2){
      mainSearchBox.lastElementChild.remove();
    }

	$.ajax({
		type:"GET",
		url:"mainIdolList",
		dataType:"JSON",
		success:function(data){
			mainIdolArray = data.IdolMain;
			const filterName = data.IdolMain.filter(element => element.idol_name.includes(e.target.value));
		    if(filterName.length != 0 && e.target.value != ""){
		      createSearch(filterName, mainSearchBox);
		    }		
		},
		error:function(err){
			console.log("mainIdolList", err);
			if(err) throw err;
		}
	});
  }); //qSearch event end
  
  //처음 로딩할 때 마커 전부 뿌려주는 함수
  const mainMarker = () => {
  	$.ajax({
  		type:"GET",
  		url:"mainList",
  		dataType:"JSON",
  		success:function(data){
  			for(let i = 0; i<data.mainList.length; i++){
  				markerMake(i, map, data.mainList[i].eat_idx, data.mainList[i].eat_address, data.mainList[i].eat_name, `/photo/${data.mainList[i].idol_mark_new}`, "");  				
  			}
  		},
  		error:function(err){
  			console.log("mainList", err);
  			if(err) throw err;
  		}
  	});
  }
  
  mainMarker();
});