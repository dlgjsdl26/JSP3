<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" />
<script type="text/javascript">
	$(function() {
		$("input").addClass("form-control");
		$("#registForm").on("submit", function(){
			let valid = $(this).data("validId");
			return valid;
		})
		$("#checkBtn").on("click", function(){
			let inputId = $("[name='mem_id']").val();
			$.ajax({
				url : "<%=request.getContextPath()%>/idCheck.do",
				// inputId 파라미터로 중복 확인
				data : {
					inputId:inputId
				},
				method : "post",
				dataType : "json", //Accept(request), Content-Type
				success : function(resp) {
					if(resp.valid){
						$("#registForm").data("validId", true);			
					}else{
						alert("아이디 중복, 바꾸셈.");
						$("[name='mem_id']").focus();
					}
				},
				error : function(errResp) {
					console.log(errResp);
				}
			});
		});
	
	<%String message = (String) request.getAttribute("message");
			if (StringUtils.isNotBlank(message)) {
			%>
	    	alert("<%=message%>");
<%}%>
	});
</script>
</head>
<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request" />
<jsp:useBean id="errors" class="java.util.LinkedHashMap" scope="request" />
<body>
	<form id="registForm" method="post">
		<table class="table table-bordered">
			<tr>
				<th>아이디</th>
				<td><input type="text" required name="mem_id"
					value="<%=member.getMem_id()%>" maxLength="15" />
					<button type="button" id="checkBtn">아이디 중복체크</button>	
				</td>
					
					
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" required name="mem_pass"
					value="<%=member.getMem_pass()%>" maxLength="15" /></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" required name="mem_name"
					value="<%=member.getMem_name()%>" maxLength="20" /></td>
			</tr>
			<tr>
				<th>주민번호1</th>
				<td><input type="text" required name="mem_regno1"
					value="<%=member.getMem_regno1()%>" maxLength="6" /></td>
			</tr>
			<tr>
				<th>주민번호2</th>
				<td><input type="text" required name="mem_regno2"
					value="<%=member.getMem_regno2()%>" maxLength="7" /></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="text" name="mem_bir"
					value="<%=member.getMem_bir()%>" maxLength="7" /></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" required name="mem_zip"
					value="<%=member.getMem_zip()%>" maxLength="7" /></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><input type="text" required name="mem_add1"
					value="<%=member.getMem_add1()%>" maxLength="100" /></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><input type="text" required name="mem_add2"
					value="<%=member.getMem_add2()%>" maxLength="80" /></td>
			</tr>
			<tr>
				<th>집전번</th>
				<td><input type="text" required name="mem_hometel"
					value="<%=member.getMem_hometel()%>" maxLength="14" /></td>
			</tr>
			<tr>
				<th>회사전번</th>
				<td><input type="text" name="mem_comtel"
					value="<%=member.getMem_comtel()%>" maxLength="14" /></td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td><input type="text" name="mem_hp"
					value="<%=member.getMem_hp()%>" maxLength="15" /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" required name="mem_mail"
					value="<%=member.getMem_mail()%>" maxLength="40" /></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="mem_job"
					value="<%=member.getMem_job()%>" maxLength="40" /></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><input type="text" name="mem_like"
					value="<%=member.getMem_like()%>" maxLength="40" /></td>
			</tr>
			<tr>
				<th>기념일</th>
				<td><input type="text" name="mem_memorial"
					value="<%=member.getMem_memorial()%>" maxLength="40" /></td>
			</tr>
			<tr>
				<th>기념일자</th>
				<td><input type="text" name="mem_memorialday"
					value="<%=member.getMem_memorialday()%>" maxLength="7" /></td>
			</tr>
			<tr>
				<th>마일리지</th>
				<td><input type="number" name="mem_mileage"
					value="<%=member.getMem_mileage()%>" maxLength="22" /></td>
			</tr>
			<tr>
				<th>탈퇴여부</th>
				<td><input type="text" name="mem_delete"
					value="<%=member.getMem_delete()%>" maxLength="1" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="전송" /> 
				<input type="reset" value="취소" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>













