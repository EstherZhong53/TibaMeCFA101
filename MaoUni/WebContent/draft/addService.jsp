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

<div>�A�ȶ���: <input type="text" name="svcItem"></div>
<div>�������: 
<select name="svcPet">
		<option value="��">��
		<option value="��">��
</select>
</div>

<input type="hidden" name="action" value="insert">
<input type="submit" value="�s�W">

</form>

<jsp:include page="/draft/svcItemList.jsp" flush="true"></jsp:include>

</body>
</html>