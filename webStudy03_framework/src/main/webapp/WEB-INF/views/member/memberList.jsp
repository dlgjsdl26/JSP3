<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/includee/preScript.jsp" />
</head>
<body>

<%
   PagingVO<MemberVO> pagingVO = (PagingVO)request.getAttribute("pagingVO");

%>
   <table id="memberTable" class="table table-bordered">
      <thead>
         <tr>
            <th>회원아이디</th>
            <th>회원명</th>
            <th>휴대폰</th>
            <th>이메일</th>
            <th>주소1</th>
            <th>마일리지</th>
         </tr>
      </thead>
      <tbody>
         <%
            List<MemberVO> datalist = pagingVO.getData();
            if(datalist != null && datalist.size() > 0){
               for(MemberVO member : datalist){
               %>
               <tr>
                  <td><%=member.getMem_id() %></td>
                  <td><a href = "#" data-who = "<%=member.getMem_id()%>"><%=member.getMem_name() %></a></td>
                  <td><%=member.getMem_hp() %></td>
                  <td><%=member.getMem_mail() %></td>
                  <td><%=member.getMem_add1() %></td>
                  <td><%=member.getMem_mileage() %></td>
               </tr>
               <%
            }
            }else{
               %>
               <tr>
                  <td colspan="6">해당사항 없음</td>
               </tr>
               <%
         
            }
         
         %>
      </tbody>
      <tfoot>
         <tr>
            <td colspan="6" id="pagingArea">
               <%=pagingVO.getPagingHTML_BS() %>
            </td>
         </tr>
      </tfoot>
   </table>
   
<form id="searchForm" action="<%=request.getContextPath()%>/member/memberList.do" class="form-inline">
   <input type="hidden" name="page" />
   <select name='searchType' class="form-control">
      <option value="all">전체</option>
      <option value="name">이름</option>
      <option value="address">지역</option>
   </select>
   <input type="text" class="form-control" name="searchWord" />
   <input type="submit" class="btn btn-primary" value="검색" />
</form>
<script type="text/javascript">
   let listTable = $("#memberTable");
   let pagingArea = $("#pagingArea");
   let pagingA = pagingArea.on('click', "a" ,function(){
      let page = $(this).data("page");
      searchForm.find("[name='page']").val(page);
      searchForm.submit();
      searchForm.find("[name='page']").val(1);
   });
   let searchForm = $("#searchForm").on("submit", function(event){
       event.preventDefault();
      let url = this.action?this.action:location.href;
      let method = this.method?this.method:"get";
      let data = $(this).serialize(); // query string 
      $.ajax({
         url : url,
         method : method,
         data : data,
         dataType : "json",
         success : function(resp) {
            listTable.find("tbody").empty();
            pagingArea.empty();
            let list = resp.data;
            let trTags = [];
            if(list.length>0){
               $(list).each(function(idx, member){
                  trTags.push(
                     $("<tr>").append(
                        $("<td>").text(member.mem_id),
                        $("<td>").html($("<a>").text(member.mem_name)
                                          .attr("href", "#")
                                          .data("who", member.mem_id)
                        ),
                        $("<td>").text(member.mem_hp),
                        $("<td>").text(member.mem_mail),
                        $("<td>").text(member.mem_add1),
                        $("<td>").text(member.mem_mileage)
                     )
                  );
                  
               });
            }else{
               trTags.push($("<tr>").html($("<td colspan='6'>").text("조건에 맞는 회원이 없음.")));
            }
            listTable.find("tbody").html(trTags);
            pagingArea.html( resp.pagingHTML_BS );
         },
         error : function(errResp) {
         }
      });
      return false; 
   });
   $("#memberTable>tbody").on("click", "a", function() {
      let who = $(this).data("who");
<%--       location.href = "<%=request.getContextPath() %>/member/memberView.do?who="+who; --%>

		$.ajax({
			url : "<%=request.getContextPath()%>"/member/memberView.do,
			data : {
				who:who
			},
			method : "get",
			dataType : "html",
			success : function(resp) {

			},
			error : function() {

			}
		})
   })
</script>   
</body>
</html>








