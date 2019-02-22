<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SEARCH</title>
<link rel='stylesheet' href="/mvc-test/resources/css/search.css" />
</head>
<body>
	<div class="container">
		<div class="seatchTable">
			<form name="searchForm">
				<table id="searchTable">
					<tr style="height: 25%">
						<td colspan="6" style="background: grey"><center>사원
								정보 검색</center></td>
					</tr>
					<tr style="height: 25%">
						<td style="width: 10%; background: grey">이름</td>
						<td style="width: 30%"><input type="text" name="staffName"/></td>
						<td style="width: 10%; background: grey">성별</td>
						<td style="width: 10%"><label for="man"> <input
								type="checkbox" id="man" name="genderCheck" value="1" />남
						</label> <label for="women"> <input type="checkbox" id="women"
								name="genderCheck" value="2"/>여
						</label></td>
						<td style="width: 10%; background: grey">종교</td>
						<td style="width: 30%"><select name="religionCode">
								<option value=""></option>
								<c:forEach var="r" items="${data.religion}">
									<option value="${r.religionCode}">${r.religionName}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr style="height: 25%">
						<td style="width: 10%; background: grey">학력</td>
						<td><c:forEach var="s" items="${data.school}">
								<label for="s${s.schoolCode}"> <input type="checkbox"
									id="s${s.schoolCode}" name="schoolCodeCheck" value="${s.schoolCode}"/>${s.schoolName}
								</label>
							</c:forEach></td>

						<td style="background: grey">기술</td>
						<td colspan="3"><c:forEach var="sk" items="${data.skill}">
								<label for="sk${sk.skillCode}"> <input type="checkbox"
									id="sk${sk.skillCode}" name="skillCodeCheck" value="${sk.skillCode}"/>${sk.skillName}
								</label>
							</c:forEach></td>
					</tr>
					<tr style="height: 25%">
						<td style="width: 10%; background: grey">졸업일</td>
						<td colspan="5"><select name="SGYear" class="year">
								<option value=""></option>
						</select>년 <select name="SGMonth" class="month">
								<option value=""></option>
						</select>월 <select name="SGDay" class="day">
								<option value=""></option>
						</select>일 - <select name="EGYear" class="year">
								<option value=""></option>
						</select>년 <select name="EGMonth" class="month">
								<option value=""></option>
						</select>월 <select name="EGDay" class="day">
								<option value=""></option>
						</select>일</td>
					</tr>
				</table>
			</form>
		</div>

		<div class="button">
			<div class="button-section">
				<div class="left">
					<input type="button" name="search" value="검색"/>
				</div>
				<div class="right">
					<input type="button" name="searchAll" value="전부검색" /> <input
						type="button" name="reset" value="초기화" /> <input type="button"
						name="register" value="등록" />
				</div>

			</div>
		</div>


		<div class="count">
			<div class="count-section">
				<div>
					검색건수--> <span id="count">0</span><span>건</span>
				</div>
			</div>
		</div>

		<div class="resultTable">
			<table id="resultTable">
				<thead>
					<tr style="height: 50px">
						<th style="width: 10%">번호</th>
						<th style="width: 20%">이름</th>
						<th style="width: 10%">성별</th>
						<th style="width: 20%">종교</th>
						<th style="width: 20%">졸업일</th>
						<th style="width: 20%"></th>
					<tr>
				</thead>
				<tbody></tbody>
			</table>
			<div class="pagination"></div>
		</div>

	</div>

<script src="/mvc-test/resources/js/search.js"></script>
</body>
</html>