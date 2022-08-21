<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NoteTaker| Add Notes</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		<h1>Add Your Notes Here</h1>
		
		<form action="SaveNote" method="post" class="p-3">
			<div class="form-group">
				<label for="exampleInputEmail1" class="form-label">Title</label> 
				<input type="text" class="form-control"
					id="title" name="title" required placeholder="Enter your Title here"/>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea class="form-control" required style="height:200px;" id="content" name="content" placeholder="Enter your content here"></textarea>
			</div>
			<br>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>