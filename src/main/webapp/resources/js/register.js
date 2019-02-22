"use strict";

const gYear = document.querySelector(".year");
const gMonth = document.querySelector(".month");
const gDay = document.querySelector(".day");

//년추가하기..
for(var y = new Date().getFullYear(); y >= 1980 ; y-- ){
	var opEle = document.createElement("option");
	opEle.value=y;
	opEle.innerText = y;
	gYear.appendChild(opEle);
}

//월 추가하기

for(var m=1; m <= 12; m++){
	var opEle = document.createElement("option");
	if(m < 10){
		opEle.value="0"+m;
		opEle.innerText="0"+m;
	} else {
		opEle.value=m;
		opEle.innerText = m;
	}
	gMonth.appendChild(opEle);
}

//일 추가하기
for(var d=1; d<=31; d++){
	var opEle = document.createElement("option");
	if(d < 10){
		opEle.value="0"+d;
		opEle.innerText="0"+d;
	} else {
		opEle.value=d;
		opEle.innerText = d;
	}
		gDay.appendChild(opEle);
}

function formCheck(){
	var obj ={};
	//1) name check;
	const stNameEle = document.querySelector("input[name='staffName']");
	//입력안할 시 
	if(stNameEle.value===''){
		alert("이름을 입력하세요");
		return false;
	} 
	//한글 정규식
	const nameCheck = /^[가-힣]{2,4}$/;
	if(nameCheck.test(stNameEle.value)){
		obj.staffName = stNameEle.value;
	} else {
		alert("이름 형식이 잘못되었습니다.");
		return false;
	}

	//2) 주민번호 체크	
	const jumin1 = document.querySelector("input[name='jumin1']");
	const jumin2 = document.querySelector("input[name='jumin2']");

	if(/\d{6}/.test(jumin1.value) && /\d{7}/.test(jumin2.value)){
		obj.juminNo =jumin1.value+"-"+jumin2.value;
	} else{
		alert("주민번호를 입력해주세요");
		return false;
	}
	
	//종교 체크 
	const religion = document.querySelector("select[name='religion']");
	if(religion.value==='') {
		alert("종교를 입력하세요");
		return false;
	} else {
		obj.religionCode = religion.value;
	}
	
	//학력 체크 
	const schoolEles = document.querySelectorAll("input[name='school']");
	for(var s=0; s<schoolEles.length; s++){
		if(schoolEles[s].checked){
			obj.schoolCode = schoolEles[s].value;
		}
	}
	if(!obj.schoolCode){
		alert("학력을 입력하세요");
		return false;
	}
	
	//기술 체크
	var arr = [];
	const skillEles = document.querySelectorAll("input[name='skill']");
	for(var sk=0; sk < skillEles.length; sk++){
		if(skillEles[sk].checked){
			arr[arr.length] = skillEles[sk].value;
		}
	}
	
	if(arr.length=='0') {
		alert("스킬을 입력하세요");
		return false;
	} else obj.skillCode = arr;
	
	//졸업일
	const year = document.querySelector("select[name='gYear']");
	const month = document.querySelector("select[name='gMonth']");
	const day = document.querySelector("select[name='gDay']");
	
	if(year.value=='' || month.value=='' || day.value =='') {
		alert("졸업일을 입력하세요");
		return false;
	} else {	
		obj.graduateDay = year.value+"-"+month.value+"-"+day.value;
	}
	
	//ajax register
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				location.href="../../board/search/search.do";
			} else {
				//loading..
		    }
		}//outer if end 
	}
	
	//2) 요청페이지 주소
	xhr.open("POST","/mvc-test/board/register/doRegister.do",true);
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.setRequestHeader("Content-type","application/json");
	//3) send
	//console.log(object);
	xhr.send(JSON.stringify(obj));
	
	return false;
}


//reset 
const resetBtn = document.querySelector("input[name='reset']");
resetBtn.onclick = () =>{
	console.log(document.querySelectorAll("input"))
	
	//text 초기화
	document.querySelector("input[name='staffName']").value="";
	document.querySelector("input[name='jumin1']").value="";
	document.querySelector("input[name='jumin2']").value="";
	
	
	//select checkbox 초기화
	var selectEles = document.querySelectorAll("select");
	for(let s of selectEles) s.value="";
	var checkEles = document.querySelectorAll("input[type='checkbox'],input[type='radio']");
	for(let c of checkEles){
		if(c.checked==true) c.checked=false;
	}
}