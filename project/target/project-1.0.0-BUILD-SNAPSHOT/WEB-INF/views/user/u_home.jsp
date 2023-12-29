<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String pg= request.getParameter("pg");
	if(pg == null) pg="u_main.jsp";
%>
<jsp:include page="u_header.jsp"/>
<main>
	<div class="container mt-5 d-flex">
		<jsp:include page="u_left.jsp"/>
		<jsp:include page="<%=pg%>"/>
	</div>
</main>
<jsp:include page="u_footer.jsp"/> 