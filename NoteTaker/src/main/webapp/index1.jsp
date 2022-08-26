<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NoteTaker| Home</title>
</head>

<%@include file="all_js_css.jsp" %>
<body>
    <div class="banner_manual">
        <%@include file="navbar.jsp"%>

        <div class="content">
            <h1>WELCOME TO NOTETAKER</h1>
            <p>Here in NoteTaker you can add your note and can view the notes that you've added.</p>

            <div>
                <button type="button" onclick="addNote()"><span></span>Add Note</button>
                <button type="button" onclick="viewNotes()"><span></span>View Notes</button>
            </div>
        </div>
    </div>

    <script>
        function viewNotes() {
          window.location.href="showNotes.jsp";
        }

        function addNote() {
          window.location.href="addNote.jsp";
        }
      </script>
</body>
</html>