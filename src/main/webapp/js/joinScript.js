window.addEventListener("load", () => {

  /* FUNCTION*/
  const confirmInput = (reg, target) => {
    target.previousElementSibling.style.color = "#2a2a29";
    target.style.border = "none";

    if(reg.test(target.value)){
      target.nextElementSibling.style.visibility = "visible";
    } else{
      target.nextElementSibling.style.visibility = "hidden";
      target.previousElementSibling.style.color = "red";
      target.style.border = "1px solid red";
      target.value = "";
    }
  }
  
  const confirmNum = (num, target) => {
    const joinBirthLabel = document.querySelector('label[for="joinBirthY"]');

    joinBirthLabel.style.color = "#2a2a29";
    target.style.border = "none";

    if(target.value > num){
      joinBirthLabel.style.color = "red";
      target.style.border = "1px solid red";
      target.value = "";
    }
  }

  const maxLength = (max, target) => {
    if(target.value.length > max){
      target.value = target.value.substr(0, max);
    }
  }


  /* EVENT -- Confirm Value */
  const joinForm = document.querySelector(".joinBox>form");
  const joinId = document.querySelector("#joinId");
  const joinPw = document.querySelector("#joinPw");
  const joinFrindela = document.querySelector("#joinFrindela");
  const joinName = document.querySelector("#joinName");
  const joinBirthY = document.querySelector("#joinBirthY");
  const joinBirthM = document.querySelector("#joinBirthM");
  const joinBirthD = document.querySelector("#joinBirthD");
  const joinAdd1 = document.querySelector("#joinAdd1");
  const joinAdd2 = document.querySelector("#joinAdd2");
  const joinInfoBtn1 = document.querySelector(".joinInfoBtn1");
  const joinInfoBtn2 = document.querySelector(".joinInfoBtn2");

  const joinAlert = document.querySelector(".joinAlert");
  const joinAlertP = document.querySelector(".joinAlert>p");
  const joinAlertBtn = document.querySelector(".joinAlert>button");
  
  joinId.addEventListener("change", e => {
    const idReg = /^\w{6,15}$/;
    confirmInput(idReg, e.target);
  });

  joinPw.addEventListener("change", e => {
    const pwReg = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,15}$/;
    confirmInput(pwReg, e.target);
  });

  joinFrindela.addEventListener("change", e => {
    const frindelaReg = /^[가-힣|a-z|A-Z|0-9]{1,8}$/;
    confirmInput(frindelaReg, e.target);
  });

  joinName.addEventListener("change", e => {
    const nameReg = /^[가-힣|a-z|A-Z]+$/;
    confirmInput(nameReg, e.target);
  });

  /* BirthDay input */
  joinBirthY.addEventListener("input", e => {
    maxLength(4, e.target);
  });

  joinBirthY.addEventListener("change", e => {
    const currentDate = new Date();
    confirmNum(currentDate.getFullYear(), e.target);
  })

  joinBirthM.addEventListener("input", e => {
    maxLength(2, e.target);
  });

  joinBirthM.addEventListener("change", e => {
    confirmNum(12, e.target);
  })
  
  joinBirthD.addEventListener("input", e => {
    maxLength(2, e.target);
  });

  joinBirthD.addEventListener("change", e => {
    confirmNum(31, e.target);
  });

  /* Address input*/
  joinAdd1.addEventListener("click", e => {
    new daum.Postcode({
      oncomplete: function(data) {
        e.target.value = data.address;
      },
      onclose: function(state){
        if(state === 'FORCE_CLOSE'){}
        else if(state === 'COMPLETE_CLOSE'){}
      }

    }).open();
  });

  /* submit */
  const joinAjax = () => {
  	$.ajax({
  		type:"POST",
  		url:"join.do", //로그인과 마찬가지로 여기에 매퍼 적어주시면 됩니다.
  		data:{
	        user_id: joinId.value,
	        user_pw: joinPw.value,
	        user_nick: joinFrindela.value,
	        user_name: joinName.value,
	        user_birth: joinBirthY.value + "-" + joinBirthM.value + "-" + joinBirthD.value,
	        user_address: joinAdd1.value + "-" + joinAdd2.value  		
  		},
  		dataType:"JSON", //중복된 아이디가 존재했을 때 joinFalse 라는 문자열을 보내주세요.
  		success:function(data){
  			console.log(data.msg);
	        if(data.msg == 'joinFalse'){
	          //경고창 띄우기
	          alert('중복된 아이디가 존재합니다. 다른 아이디를 작성해주세요');
	          window.scrollTo(0, 0);
	        } else if(data.msg == "success"){
	        	window.location.href = "/login.go";
	        }
  		},
  		error:function(err){
  			console.log("join.do", err);
  			if(err) throw err;
  		}
  	});
  }

  joinInfoBtn2.addEventListener("click", e => {
    e.preventDefault();

    if(joinId.value != "" &&
        joinPw.value != "" &&
        joinFrindela.value != "" &&
        joinName.value != "" &&
        joinBirthY.value != "" &&
        joinBirthM.value != "" &&
        joinBirthD.value != "" &&
        joinAdd1.value != "" &&
        joinAdd2.value != ""
    ){
      joinAjax();
    } else{
      //경고창 띄우기
      alert('입력하지 않은 칸이 있습니다. 모든 칸을 채워주세요');
      window.scrollTo(0, 0);
    }
  })

  /* EVENT -- alert */
  joinAlertBtn.addEventListener("click", e => {
    joinAlert.style.visibility = "hidden";
  })
});