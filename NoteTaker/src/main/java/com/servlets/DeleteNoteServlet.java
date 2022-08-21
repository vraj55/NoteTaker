package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteNoteServlet
 */
public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Are you sure want to delete?');");
			//out.println("location='addNote.jsp';");
			out.println("</script>");
			
			int id = Integer.parseInt(request.getParameter("note_id").trim());
			
			//System.out.println(id);
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note =(Note) s.get(Note.class, id);
			
			s.delete(note);
			
			tx.commit();
			s.close();
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Deleted Note');");
			out.println("location='showNotes.jsp';");
			out.println("</script>");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
