<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
<link rel='stylesheet' href="/mvc-test/resources/css/update.css" />
</head>
<body>
	<input type="hidden" name="staffNo" value="${data.staff.staffNo}"/>
	<form name="uForm" method="post" onsubmit="return formCheck()">
		<div class="container">
			<div class="updateable">
				<table id="updateTable">
					<tr style="height: 25%">
						<td colspan="6" style="background: grey">사원 정보 수정</td>
					</tr>
					<tr style="height: 25%">
						<td style="width: 10%; background: grey">이름</td>
						<td style="width: 25%"><input type="text" name="name"
							value="${data.staff.staffName}" /></td>
						<td style="width: 10%; background: grey">주민번호</td>
						<td style="width: 25%"><input type="text" name="jumin1"
							value="${fn:substring(data.staff.juminNo,0,6)}" maxlength="6" />
							- <input type="password" name="jumin2"
							value="${fn:substring(data.staff.juminNo,7,14)}" maxlength="7" /></td>
						<td style="width: 5%; background: grey">종교</td>
						<td style="width: 25%"><select name="religion" id="religion">
								<option></option>
								<c:forEach var="r" items="${data.religion}">
									<option value="${r.religionCode}"
										<c:if test="${data.staff.religionCode == r.religionCode}">
									selected="selected"
								</c:if>>${r.religionName}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr style="height: 25%">
						<td style="width: 10%; background: grey">학력</td>
						<td><c:forEach var="s" items="${data.school}">
								<label for="s${s.schoolCode}"> <input type="radio"
									id="s${s.schoolCode}" name="school" value="${s.schoolCode}"
									<c:if test="${s.schoolCode == data.staff.schoolCode}">
									checked="checked"
								</c:if>>${s.schoolName}
								</label>
							</c:forEach></td>
						<td style="background: grey">기술</td>
						<td colspan="3"><c:forEach var="sk" items="${data.skill}">
								<label for="sk${sk.skillCode}"> <input type="checkbox"
									id="sk${sk.skillCode}" name="skill" value="${sk.skillCode}"
									<c:forEach var="usk" items="${data.staffSkill}">
									<c:if test="${usk == sk.skillCode}">
										checked="checked"
									</c:if>
								</c:forEach> />${sk.skillName}
								</label>
							</c:forEach></td>
					</tr>
					<tr style="height: 25%">
						<td style="width: 10%; background: grey">졸업일</td>
						<td colspan="5"><input type="hidden" name="graduateDay"
							value="${data.staff.graduateDay}" /> <select name="gYear"
							class="year">
								<option></option>
						</select>년 <select name="gMonth" class="month">
								<option></option>
						</select>월 <select name="gDay" class="day">
								<option></option>
						</select>일</td>

					</tr>
				</table>
			</div>

			<div class="button">
				<div class="button-section">
					<div class="left">
						<input type="submit" name="update" value="수정" />
					</div>
					<div class="right">
						<input type="button" name="delete" value="삭제" />
					</div>
				</div>
			</div>
		</div>
	</form>
	<script src="/mvc-test/resources/js/update.js"></script>
</body>
</html>