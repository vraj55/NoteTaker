<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.*"%>
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

	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">You can see your Notes Here!</h1>
		<br>
		
		<div class="row p-3">
			<div class="col-12">
			<%
				Session s = FactoryProvider.getFactory().openSession();
		
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
		
				for(Note note: list){
			%>
			<div class="card mb-3">
  				<img src="img/post-it.png" class="card-img-top p-2" alt="note" style="max-width: 100px">
  				<div class="card-body">
    				<h5 class="card-title">
								<%
    							out.println(note.getTitle());
    							%>       			 		</h5>
        						<p class="card-text">
								<%
   								out.println(note.getContent());
   								%>        				</p>
        						<p class="card-text"><small class="text-muted">Last updated on <%out.println(note.getAddedDate());%></small></p>
        						<br>
        						<a href="DeleteNoteServlet?note_id=<%=note.getId()%>" class="btn btn-danger" style="width:100px">Delete</a>
    							<a href="updateNote.jsp?note_id=<%=note.getId()%>" class="btn btn-secondary" style="width:100px">Edit</a>
  				</div>
  				
			</div>
				<% 
							}
		
						s.close();
		
				%>
			</div>
		</div>
	</div>
</body>
</html>