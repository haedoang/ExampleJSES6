"use strict";

	//검색 DB data
	const yearList = document.querySelectorAll(".year");
	const monthList = document.querySelectorAll(".month");
	const dayList = document.querySelectorAll(".day");

	//년만들기
	//년 추가
	for(let y = 0; y < yearList.length; y++){
		var opEle="";
		for(let i = new Date().getFullYear(); i >= 1980; i--){
			opEle = document.createElement("option");
			opEle.value=i;
			opEle.innerText=i;
			yearList[y].appendChild(opEle);
		}			
	}
	//월 추가
	for(let y = 0; y < monthList.length; y++){
		var opEle="";
		for(let i = 1; i <= 12; i++){
			opEle = document.createElement("option");
			if(i<10) {
				opEle.value="0"+i;
				opEle.innerText="0"+i;
			} else {
				opEle.value=i;
				opEle.innerText=i;
			}
			
			monthList[y].appendChild(opEle);
		}			
	}
	//일 추가 
	for(let y = 0; y < dayList.length; y++){
		var opEle="";
		for(let i = 1; i <= 31; i++){
			opEle = document.createElement("option");
			if(i<10) {
				opEle.value="0"+i;
				opEle.innerText="0"+i;
			} else {
				opEle.value=i;
				opEle.innerText=i;
			}
			dayList[y].appendChild(opEle);
		}			
	}



//button set
const searchBtn = document.querySelector("input[name='search']");
const searchAllBtn = document.querySelector("input[name='searchAll']");
const resetBtn = document.querySelector("input[name='reset']");
const registerBtn = document.querySelector("input[name='register']");



searchBtn.addEventListener("click",function(){
	search();
});

searchAllBtn.addEventListener("click",function(){
	search();
})

function search(pageNo=1){
	
	var sForm = document.searchForm;	
	var formData = new FormData(sForm);
	var object = {};
	
	//gender check.
	//console.log(sForm.elements['genderCheck'].length);
	var arr = [];
	for(let i=0;i<sForm.elements['genderCheck'].length; i++){
		if(sForm.elements['genderCheck'][i].checked==true){
			arr[arr.length]=sForm.elements['genderCheck'][i].value;
		}
	}
	if(arr.length!=0) object.gender = arr;
	//schoolcode check.
	arr=[];
	for(let i=0;i<sForm.elements['schoolCodeCheck'].length; i++){
		if(sForm.elements['schoolCodeCheck'][i].checked==true){
			arr[arr.length]=sForm.elements['schoolCodeCheck'][i].value;
		}
	}
	if(arr.length!=0) object.schoolCode = arr;
	
	//skillCode check
	arr=[];
	for(let i=0;i<sForm.elements['skillCodeCheck'].length; i++){
		if(sForm.elements['skillCodeCheck'][i].checked==true){
			arr[arr.length]=sForm.elements['skillCodeCheck'][i].value;
		}
	}
	if(arr.length!=0)object.skillCode = arr;
	
	//graduate day check;
	var SGYear = document.querySelector("select[name='SGYear']");
	var SGMonth = document.querySelector("select[name='SGMonth']");
	var SGDay = document.querySelector("select[name='SGDay']");
	var EGYear = document.querySelector("select[name='EGYear']");
	var EGMonth = document.querySelector("select[name='EGMonth']");
	var EGDay = document.querySelector("select[name='EGDay']");
	
	
	if(SGYear.value=='' && SGMonth.value=='' && SGDay.value==''&& EGYear.value==''&& EGMonth.value=='' && EGDay.value=='') {
		;;
	} else if(SGYear.value=='' || SGMonth.value=='' || SGDay.value==''|| EGYear.value==''|| EGMonth.value=='' || EGDay.value==''){
		return alert("날짜를 입력하세요");
	} 
	
	var startDay = SGYear.value+"-"+SGMonth.value+"-"+SGDay.value;
	var endDay =  EGYear.value+"-"+EGMonth.value+"-"+EGDay.value;
	
	if(startDay > endDay) return alert("시작일이 종료일보다 큽니다.");
	
	object.startDay = startDay;
	object.endDay = endDay;
	
	//default pageNo set
	object.pageNo =pageNo;
	
	//input 추가
	formData.forEach(function(value, key){
	    object[key] = value;
	});

	//1) xmlhttprequest 객체 얻어오기
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			//console.log(xhr.status); //정상 200반환
			if(xhr.status==200){
				var jsonData = JSON.parse(xhr.responseText);
				//console.log(jsonData);
				
				//검색 카운트. 					
				var cnt = document.querySelector("#count");
				cnt.innerText = jsonData.pageResult.count;
			
				var pr = jsonData.pageResult;
				//resultTable에 넣기 
				var resultTable = document.querySelector("#resultTable > tbody");
				
				//다시누르면 테이블 제거 후 불러오기
				if(resultTable.rows.length > 0) {
					for(var i=resultTable.rows.length-1; i>=0; i--){ 
						resultTable.deleteRow(i);
					}
				}
	
				for(var s of jsonData.staff){
					var row = resultTable.insertRow(resultTable.rows.length);
					var cell1 =row.insertCell(0);
					var cell2 =row.insertCell(1);
					var cell3 =row.insertCell(2);
					var cell4 =row.insertCell(3);
					var cell5 =row.insertCell(4);
					var cell6 =row.insertCell(5);
					
					cell1.innerText=s.staffNo;
					cell2.innerText=s.staffName;
					
					//성별 표시하기위해 주민번호뒷자리의 1의 값을 가져온다.
					(s.juminNo.substring(7,8) == 1) ? cell3.innerText="남" :cell3.innerText="여";
					
					//종교 번호에 해당하는 종교 가져오기
					for(var r of jsonData.religion){
						if(r.religionCode==s.religionCode) cell4.innerText = r.religionName;
					}
					cell5.innerText=s.graduateDay;
					cell6.innerHTML="<input type='button' onClick='upNdelBtn("+s.staffNo+")' class='upNdelBtn' value='수정/삭제'/>";
					
				}
				
				//pagination 추가
				//pagenation 추가하기.
				
				var pagination = document.querySelector(".pagination");
				var navEle = document.createElement("nav");
				var ulEle = document.createElement("ul");
				
				//페이지 개수만큼 ul li 만들기					
				for(let i = 1; i <= pr.lastPage; i++){
					var liEle = document.createElement("li");//onclick='return search("+i+")'
					liEle.innerHTML = "<a href ='#' onClick='return link("+i+")'>["+i+"]</a>";
					//liEle.innerHTML = "<a onclick='"+i+"'>["+i+"]</a>";
					ulEle.appendChild(liEle);
				}
				navEle.appendChild(ulEle);
	
				if(pagination.hasChildNodes()) pagination.removeChild(document.querySelector("nav"));	
				pagination.appendChild(navEle);
				
			
			} else {
				//loading..
		    }
		}//outer if end 
	}
	
	//2) 요청페이지 주소
	xhr.open("POST","/mvc-test/board/search/searchDetail.do",true);
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.setRequestHeader("Content-type","application/json");
	//3) send
	//console.log(object);
	xhr.send(JSON.stringify(object));
}


resetBtn.onclick = () =>{
	//text 초기화
	document.querySelector("input").value="";
	//select checkbox 초기화
	var selectEles = document.querySelectorAll("select");
	var checkEles = document.querySelectorAll("input[type='checkbox']");
	for(let s of selectEles) s.value="";

	for(let c of checkEles){
		if(c.checked==true) c.checked=false;
	}
	//pagination제거 
	document.querySelector(".pagination > nav").remove();
	//테이블제거
	var trEle = document.querySelectorAll("#resultTable > tbody > *");
	for(let t of trEle) t.remove();
	//count 초기화
	document.querySelector("#count").innerText=0;
}

function link(pageNo){
	search(pageNo);
}

registerBtn.onclick =function(){
	location.href="../register/register.do";
}

//수정 삭제 이동하기.
function upNdelBtn(staffNo){
	//console.log(staffNo);
	//페이지이동
	location.href="../update/update.do?staffNo="+staffNo;
}
