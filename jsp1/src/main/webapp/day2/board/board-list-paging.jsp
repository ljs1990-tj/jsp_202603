<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width : 800px;
		margin : 10px auto;
	}
	table{
		width : 100%;
		margin : 0 auto;
	}
	.select-area{
		text-align: right;
		margin-bottom : 5px; 
	}
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	th {
		background-color: #eee;
	}
	.paging-area {
		margin-top : 5px;
		text-align: center
	}
	.paging-area a {
		padding : 5px;
		text-decoration: none;
		color : #4c4848;
		font-size: 20px;
	}
	.paging-area .active{
		font-weight: bold;
		color : black;
	}
</style>
</head>
<body>
<div id="container">
	<form action="board-list.jsp" name="form">
		<%@ include file="../../db.jsp" %>
		<div class="select-area">
			<select>
				<%
					int arr[] = {3, 5, 10, 15, 20};
					for(int i=0; i<arr.length; i++){
				%>
						<option value="<%= arr[i] %>"> <%= arr[i] %> 개씩 </option>
				<%		
					}
				%>
			</select>
		</div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		<%	
			
			ResultSet rsCnt = stmt.executeQuery(
				"SELECT COUNT(*) AS TOTAL FROM TBL_BOARD "
			);	
			rsCnt.next();
			int total = rsCnt.getInt("TOTAL");
			int pageList = (int) Math.ceil((double) total / 5);
			
			int currentPage = 1;
			if(request.getParameter("page") != null){
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			int offset = (currentPage - 1) * 5;
			
			String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE "
						+ "FROM TBL_BOARD B WHERE 1=1 ";
			if(true){
				sql += "ORDER BY BOARDNO ASC ";	
			}
			if(true){
				sql += "OFFSET " + offset + " ROWS FETCH NEXT 5 ROWS ONLY";
			}
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("BOARDNO") %></td>
					<td><%= rs.getString("TITLE") %></td>
					<td><%= rs.getString("USERID") %></td>
					<td><%= rs.getString("CNT") %></td>
					<td><%= rs.getString("CDATE") %></td>
				</tr>	
		<%		
			}
		%>
		</table>
		<div class="paging-area">
			<%
				for(int i=1; i<=pageList; i++){
			%>
				<a href="?page=<%= i %>"> <%= i %> </a>
			<%		
				}
			%>
		</div>
	</form>
</div>
</body>
</html>
<script>
</script>







