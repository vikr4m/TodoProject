<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${page}"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-3">
		<h1 class="text-center">Welcome to todo manager</h1>
		
			<c:if test="${not empty msg}">
				<div class="alert alert-success">
					<b><c:out value="${msg}"></c:out></b>
				</div>
			</c:if>
		
		<div class="row mt-4">
			<div class="col-md-2">
				<h3>Options</h3>
				<div class="list-group">
					<a href='<c:url value='/add'></c:url>' class="list-group-item list-group-item-action">Add Todo</a> 
					<a href='<c:url value='/home'></c:url>' class="list-group-item list-group-item-action">View Todos</a> 
				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${page=='home' }">
					<h3 class="text-center">View Todos</h3>
						<c:forEach items ="${todos}" var="t">
							<div class="card">
								<div class="card-body">
									<h4><c:out value="${t.todoTitle}"></c:out></h4>
									<p><c:out value="${t.todoContent}"></c:out></p>
								</div>
							</div><br>
						</c:forEach>
				</c:if>
				<c:if test="${page=='add' }">
					<h3 class="text-center">Add Todo</h3>
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control" placeholder="Enter Title"/>
						</div>
						<br>
						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control" cssStyle="height:300px" placeholder="Enter Content" />
						</div><br>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>
					</form:form>
				</c:if>
				
			</div>
		</div>
	</div>

</body>
</html>