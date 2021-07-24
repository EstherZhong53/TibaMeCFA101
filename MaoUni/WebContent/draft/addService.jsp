<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Add Service</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

<form method="post" action="/MaoUni/svc.do" name="form1">

<div>服務項目: <input type="text" name="svcItem"></div>
<div>毛孩類型: 
<select name="svcPet">
		<option value="狗">狗
		<option value="貓">貓
</select>
</div>

<input type="hidden" name="action" value="insert">
<input type="submit" value="新增">

</form>

<jsp:include page="/draft/svcItemList.jsp" flush="true"></jsp:include>

</body>
</html>