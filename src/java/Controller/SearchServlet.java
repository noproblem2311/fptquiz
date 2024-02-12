/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CourseDAO;
import Model.Courses;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anquan
 */
public class SearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String keysearch = request.getParameter("key");
        HttpSession session = request.getSession();
        List<Courses> list = (List<Courses>) session.getAttribute("cList");
        List<Courses> search = new ArrayList<>();

        if (list == null) {
            CourseDAO dao = new CourseDAO();
            list = dao.getAllCourses();
            session.setAttribute("cList", list);
        }

        // Quét qua danh sách các khóa học
        for (Courses course : list) {
            if (!keysearch.trim().isEmpty() && (course.getCourseName().toLowerCase().contains(keysearch.toLowerCase()) || course.getCourseInfo().toLowerCase().contains(keysearch.toLowerCase()))) {
                search.add(course);
            }
        }

        PrintWriter out = response.getWriter();

        for (Courses course : search) {
            String link = "instruction?courseID=" + course.getCourseID(); 
            String buttonHTML = "<button style=\"background-color:white;\"  class=\"search-item\"><a href=\"" + link + "\">" + course.getCourseName() + "</a></button>";
            out.println(buttonHTML);
        }

        out.flush();
        out.close();
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
