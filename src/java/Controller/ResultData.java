/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.TestDAO;
import Model.Account;
import Model.Question;
import Model.TestRecord;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author anquan
 */
public class ResultData extends HttpServlet {

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
        TestRecord test = new TestRecord();
        Account account = (Account) request.getSession().getAttribute("user");
        LocalDateTime currentTime = LocalDateTime.now();
        List<Question> questions = (List<Question>) request.getSession().getAttribute("exam");
        List<String> ans = (List<String>) request.getSession().getAttribute("ans");

        // Định dạng thời gian thành chuỗi hhmmddmm
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("mmddMM");
        String formattedTime = currentTime.format(formatter);
        String courseID = (String) request.getSession().getAttribute("courseID");
        String finishTime = (String) request.getSession().getAttribute("time");
        String createdAt = (String) request.getSession().getAttribute("start");
        String testID = account.getUserID() + courseID + formattedTime;
        int correctAns = 0;
        for (int i = 0; i < questions.size(); i++) {
            if (ans.get(i) != null && questions.get(i).getCorrectAnswer().equals(ans.get(i))) {
                correctAns++;
            }
        }

        Cookie testing = new Cookie("startTime", null);
        testing.setMaxAge(0);
        response.addCookie(testing);

        int point = correctAns * 20;
        test.setTestID(Integer.parseInt(testID));
        test.setUserID(account.getUserID());
        test.setCollectionID(Integer.parseInt(courseID));
        test.setFinishTime(finishTime);
        test.setCorrectedQuestion(correctAns);
        test.setPoint(point);
        test.setCreatedAt(createdAt);
        request.getSession().setAttribute("test", test);
        TestDAO dao = new TestDAO();
        dao.addNewRecord(test);

        request.getSession().setAttribute("question", questions);
        request.getSession().setAttribute("userchoice", ans);
        request.getSession().setAttribute("ok", "true");
        request.getSession().removeAttribute("exam");
        request.getSession().removeAttribute("page");
        request.getRequestDispatcher("resultView.jsp").forward(request, response);
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
