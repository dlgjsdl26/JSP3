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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script type="text/javascript" src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
</head>
<jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request" />
<jsp:useBean id="errors" class="java.util.LinkedHashMap" scope="request" />
<body>
<%
	MemberVO authMember = (MemberVO)session.getAttribute("authMember");
%>
	<form action="<%= request.getContextPath() %>/myDataUpdate.do" id="registForm" method="post" class="form-inline">
		<table class="table table-bordered">
			<tr>
				<th>회원명</th>
				<td>
				<div class="form-group">
					<input type="text" required name="mem_name" value=<%=authMember.getMem_name() %> 
							maxLength="20" data-msg="이름 필수"/>
					<span class='error'><%=errors.get("mem_name") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
				<div class="form-group">
					<input type="text" required name="mem_zip" value=<%=authMember.getMem_zip() %> 
							maxLength="7" pattern="[0-9]{3}-[0-9]{3}" readonly 
							data-msg-required="우편번호 필수" data-msg-pattern="형식확인"/>
					<span class='error'><%=errors.get("mem_zip") %></span>
					<input type="button" id="zipSearchBtn" class="btn btn-info ml-3" value="우편번호 검색" 
						 data-toggle="modal" data-target="#zipSearchModal"/>
				</div>
				</td>
			</tr>
			<tr>
				<th>주소1</th>
				<td>
				<div class="form-group">
					<input type="text" class="col" required name="mem_add1" value=<%=authMember.getMem_add1() %>
							maxLength="100" readonly data-msg="주소 필수"/>
					<span class='error'><%=errors.get("mem_add1") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>주소2</th>
				<td>
				<div class="form-group">
					<input type="text" class="col" required name="mem_add2" value=<%=authMember.getMem_add2() %> 
							maxLength="80" readonly  data-msg="주소 필수"/>
					<span class='error'><%=errors.get("mem_add2") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>집전번</th>
				<td>
				<div class="form-group">
					<input type="text" required name="mem_hometel" value=<%=authMember.getMem_hometel() %>
							maxLength="14" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
							placeholder="000-000-0000"  
							data-msg-required="집전번 필수" data-msg-pattern="전화번호 형식 확인"/>
					<span class='error'><%=errors.get("mem_hometel") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>회사전번</th>
				<td>
				<div class="form-group">
					<input type="text" required name="mem_comtel" value=<%=authMember.getMem_comtel() %> 
							maxLength="14"  pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" 
							placeholder="000-000-0000"  
							data-msg-required="회사전번 필수" data-msg-pattern="전화번호 형식 확인"/>
					<span class='error'><%=errors.get("mem_comtel") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>
				<div class="form-group">
					<input type="text" name="mem_hp" value=<%=authMember.getMem_hp() %>
							maxLength="15" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
							placeholder="000-000-0000"  
							data-msg-pattern="전화번호 형식 확인"/>
					<span class='error'><%=errors.get("mem_hp") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
				<div class="form-group">
					<input type="email" required name="mem_mail" value=<%=authMember.getMem_mail() %>
						maxLength="40" data-msg="이메일 필수"/>
					<span class='error'><%=errors.get("mem_mail") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
				<div class="form-group">
					<input type="text" name="mem_job" value="<%=authMember.getMem_job() %> maxLength="40" />
					<span class='error'><%=errors.get("mem_job") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
				<div class="form-group">
					<input type="text" name="mem_like" value=<%=authMember.getMem_like() %> maxLength="40" />
					<span class='error'><%=errors.get("mem_like") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>기념일</th>
				<td>
				<div class="form-group">
					<input type="text" name="mem_memorial" value=<%=authMember.getMem_memorial() %> maxLength="40" />
					<span class='error'><%=errors.get("mem_memorial") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<th>기념일자</th>
				<td>
				<div class="form-group">
					<input type="date" name="mem_memorialday" value=<%=authMember.getMem_memorialday() %>
							pattern="\d{4}-\d{2}-\d{2}"/>
					<span class='error'><%=errors.get("mem_memorialday") %></span>
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" class="btn btn-primary" value="수정" /> 
					<input type="reset" class="btn btn-warning" value="취소" />
				</td>
			</tr>
		</table>
	</form>
<!-- Modal -->
<div class="modal fade" id="zipSearchModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">우편번호 검색</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="zipSearchForm" action="<%=request.getContextPath() %>/zipSearch.do" method="get" class="form-inline">
       	<p>
       		검색 키워드(동이름): <input type="text" required name="keyword" class="form-control" />
       		<input type="submit" class="btn btn-dark" value="검색" />
       	</p>
      </form>
       	<div id="searchResult">
	   		<table>
	   			<thead>
	   				<tr>
	   					<th>우편번호</th>
	   					<th>주소</th>
	   				</tr>
	   			</thead>
	   			<tbody>
	   			
	   			</tbody>
	   		</table>
	   		<div class="form-group mb-3  mr-3">
	   		우편번호 : <input type="text" class="ml-3 form-control mr-3" readonly id="searchedZipCode" />
	   		</div>
	   		<div class="form-group mb-3 mr-3">
	   		상위 주소 : <input type="text" class="ml-3 form-control mr-3" readonly id="address1" />
	   		</div>
	   		<div class="form-group mr-3">
	   		하위 주소 : <input type="text" class="ml-3 form-control mr-3" id="address2" />
	   		</div>
   		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="completeAddressBtn">주소 입력</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	var zipSearchResult = $("#searchResult").hide();
	var zipDataTable = zipSearchResult.find("table").DataTable({
		pageLength:7,
		lengthChange:false,
		select:"single",
		columns:[
			{data:"zipcode"},
			{data:"address"}
		]
	});
	$("#completeAddressBtn").on("click", function(){
		let zipcode = zipSearchResult.find("#searchedZipCode").val();
		let address1 = zipSearchResult.find("#address1").val();
		let address2 = zipSearchResult.find("#address2").val();
		if(zipcode && address1 && address2){
			$("[name='mem_zip']").val(zipcode);
			$("[name='mem_add1']").val(address1);
			$("[name='mem_add2']").val(address2);
			$("#zipSearchModal").modal("hide");
		}
	});
	zipSearchResult.on("click", "tbody>tr", function(){
// 		let zipData = $(this).data("zipdata");
		if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
        	zipDataTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		let zipData = zipDataTable.row(".selected").data();
		if(zipData){
			zipSearchResult.find("#searchedZipCode").val(zipData.zipcode);
			zipSearchResult.find("#address1").val(zipData.address);
		}else{
			zipSearchResult.find("#searchedZipCode").val("");
			zipSearchResult.find("#address1").val("");
		}
	});
	zipSearchResult.on( 'search.dt', function () {
		zipSearchResult.find("#searchedZipCode").val("");
		zipSearchResult.find("#address1").val("");
	} );
	$("#zipSearchForm").on("submit", function(event){
		event.preventDefault();
		zipSearchResult.find("tbody").empty();
		zipSearchResult.find("input").val("");
		zipDataTable.clear();
		zipSearchResult.hide();
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();
		$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(resp) {
// 				let trTags = [];
				if(resp.length>0){
					$(resp).each(function(idx, zipData){
// 						datatable 사용하기 전 예제
// 						let trTag = $("<tr class='zipdata'>").append(
// 							$("<td>").html(zipData.zipcode),		
// 							$("<td>").html(zipData.address)		
// 						).data("zipdata", zipData);
// 						trTags.push(trTag);
// 						================================================
						console.log(zipData);
						zipDataTable.row.add(zipData);
					});					
				}else{
// 						datatable 사용하기 전 예제
// 					trTags.push(
// 						$("<tr>").html(
// 							$("<td colspan='2'>").text("검색결과가 없음.")
// 						)
// 					);
				}
// 				zipSearchResult.find("tbody").html(trTags);
// 				================================================
				zipDataTable.draw(false);		
				zipSearchResult.show();
			},
			error : function(errResp) {
				console.log(errResp);
			}
		});
		return false;
	});	
</script>
</body>
</html>	









