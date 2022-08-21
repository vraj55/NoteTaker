<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NoteTaker| Show Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container p-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">Update your Note Here!</h1>
		<br> 
		<%
		
			int id = Integer.parseInt(request.getParameter("note_id"));
			Session s = FactoryProvider.getFactory().openSession();
			
			Note note = (Note) s.get(Note.class, id);
			
			s.close();
			
			
		%>
		<form action="UpdateNoteServlet" method="get">
			<div class="form-group">
				<input type="hidden" class="form-control"
					id="id" name="id" required 
					value="<%=note.getId()%>"
					/>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1" class="form-label">Title</label> 
				<input type="text" class="form-control"
				id="title" name="title" required 
				value="<%= note.getTitle()%>"/>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea class="form-control" required style="height:200px;" id="content" name="content" ><%= note.getContent()%>
				</textarea>
			</div>
			<br>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary" style="width:100px">Update</button>
    			<a href="showNotes.jsp" class="btn btn-secondary" style="width:100px">Back</a>
			</div>
		</form>
	</div>
</body>
</html>