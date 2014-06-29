<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>SringBoard</title>
<!-- jquery 적용 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	function doSubmit() {
		//클라이언트 단에서의 이메일 유효성 검사
		var email = $('#email').val();
		if (IsEmail(email) == false) {
			alert("이메일 형식을 지켜주세요.");
			return false;
		}

		if ($('#pass').val() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}

		if (boardFrm.title.value == "") {
			alert("제목을 입력해주세요.");
			return;
		}
		if (boardFrm.content.value == "") {
			alert("내용을 입력해주세요.");
			return;
		}
		boardFrm.submit()
	};
    
    //이메일 유효성 검증부분
	function IsEmail(email) {
		var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (!regex.test(email)) {
			return false;
		} else {
			return true;
		}
	}
</script>
</head>

<table border="1" width="600px">
	<c:forEach items="${results}" var="result">
		<form name="boardFrm" action="updateProc.do" method="post">
			<tr>
				<td height="30" width="10%" bgcolor="#dddddd" align="center">번호</td>
				<input type="text" name="id" id="id" value="${result.no}"></td>
			</tr>
			<tr>
				<td height="30" width="15%" bgcolor="#dddddd" align="center">제목 
				</td>
				<td align="left" height="30"><input type="text" size="80"
					maxLength="150" name="title" id="title" value="${result.title}"></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#dddddd" align="center">이메일 ${result.email}</td>
				<td align="left" height="30"><input type="text" size="80"
					maxLength="150" name="email" id="email" value="${result.email}"></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#dddddd" align="center">내용</td>
				<td><textarea cols="60" rows="15" name="content" id="content">${result.content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="수정"
					onclick="doSubmit()"></td>
			</tr>
		</form>
	</c:forEach>
</table>

<br>
</html>
