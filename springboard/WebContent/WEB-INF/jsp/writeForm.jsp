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


    //체크 패스워드 가져와서
    var ckpass="";    
    function ckpasscheck(ckp){
    	ckpass = ckp;
    }
    
	//수정
	function mod(no,pass){
    	if (ckpass == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		else if (ckpass != pass) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		else{
			window.location.replace("modiForm.do?id="+no+"&action=mod");
		}
    }
	
    //삭제
    function del(no,pass){
    	if (ckpass == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		else if (ckpass != pass) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		else{
			window.location.replace("delete.do?id="+no+"&action=del");
		}
    }
    
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
	<form name="boardFrm" action="writeProc.do" method="post">
		<tr>
			<td height="30" width="15%" bgcolor="#dddddd" align="center">제목
			</td>
			<td align="left" height="30"><input type="text" size="80"
				maxLength="150" name="title"></td>
		</tr>
		<tr>
			<td height="30" bgcolor="#dddddd" align="center">이메일</td>
			<td align="left" height="30"><input type="text" size="80"
				maxLength="150" name="email" id="email"></td>
		</tr>
		<tr>
			<td height="30" bgcolor="#dddddd" align="center">비밀번호</td>
			<td align="left" height="30"><input type="password" size="80"
				maxLength="150" name="pass" id="pass"></td>
		</tr>
		<tr>
			<td height="30" bgcolor="#dddddd" align="center">내용</td>
			<td><textarea cols="60" rows="15" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="전송"
				onclick="doSubmit()"></td>

		</tr>
	</form>
</table>

<br>
<br>

<table border="1" width="600px">
	<c:forEach items="${results}" var="result">
		<tr>
			<td height="30" width="10%" bgcolor="#dddddd" align="center">번호</td>
			<td width="10%" id="id">${result.no}</td>
			<td height="30" width="10%" bgcolor="#dddddd" align="center">제목</td>
			<td width="80%">${result.title}</td>
		</tr>
		<tr>
			<td height="30" width="10%" bgcolor="#dddddd" align="center">이메일</td>
			<td colspan="3">${result.email}</td>
		</tr>
		<tr>
			<td height="100" width="10%" bgcolor="#dddddd" align="center">내용</td>
			<td colspan="3"><textarea cols="60" rows="7" name="content">${result.content}</textarea>
			</td>
		</tr>
		<tr>
			<td width="25%" bgcolor="#dddddd" align="center">등록 시간</td>
			<td width="25%">${result.regdate}</td>
			<td colspan="2" align="center"><input type="text" placeholder="비밀번호 입력" id="ckpass" onchange="ckpasscheck(this.value)"> 
				<input type="button" value="수정" id="mod" onClick="mod('${result.no}','${result.pass}');">
				<input type="button" value="삭제" id="del" onClick="del('${result.no}','${result.pass}');">
			</td>
		</tr>
		<tr height="10"></tr>
	</c:forEach>
</table>
</html>
