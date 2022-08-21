package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveNote
 */
public class SaveNote extends HttpServlet {
	
	private static final long serialVersionUID = 102831973239L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Session s = FactoryProvider.getFactory().openSession();
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title, content, new Date());
			Transaction tx = s.beginTransaction();
			
			s.save(note);
			
			tx.commit();
			s.close();
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Added Note');");
			out.println("location='showNotes.jsp';");
			out.println("</script>");
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		
	}

}
