<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<jsp:include page="/includee/preScript.jsp"></jsp:include>
<script type="text/javascript" src = "//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

</head>
<body>
<table id = "zipTable">
   <thead>
      <tr>
         <th>우편번호</th>
         <th>주소</th>
      </tr>
   </thead>
   <tbody>
   </tbody>
</table>
<script type="text/javascript">
   $("#zipTable").DataTable({
	   processing: true,
       serverSide: true,
      ajax : "<%=request.getContextPath()%>/searchZipDT.do",
      columns : [
            { "data": "zipcode" },
            { "data": "address" }
        ]
   });
</script>
</body>
</html>