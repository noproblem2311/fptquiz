/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LoginDAO;
import Model.Account;
import DAO.PaymentDAO;
import Model.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 *
 * @author anquan
 */
public class LoginServlet extends HttpServlet {
    PaymentDAO payment = new PaymentDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");
        Cookie cEmail = new Cookie("cEmail", email);
        Cookie cPass = new Cookie("cPass", pass);
        Cookie cRemember = new Cookie("cRemember", remember);
        cEmail.setMaxAge(0);
        cPass.setMaxAge(0);
        cRemember.setMaxAge(0);
        //request.getSession().setAttribute("lang", "es_ES");
        //String localeParam =(String) request.getSession().getAttribute("lang");
        
        Cookie langCookie = Arrays.stream(request.getCookies())
        .filter(cookie -> "lang".equals(cookie.getName()))
        .findFirst()
        .orElse(null);  
        
        
        String currentLang = (langCookie != null) ? langCookie.getValue() : null;
        Locale localeParam = new Locale(currentLang!=null ? currentLang : "en");
        ResourceBundle bundle = ResourceBundle.getBundle("bundle.bundle",localeParam);
        System.out.println(localeParam);
        try {
            LoginDAO login = new LoginDAO();
            
            
            Account a = login.checkLogin(email, pass);
            
            request.setAttribute("email", email);
            if (login.isEmpty(email) || login.isEmpty(pass)) {
                request.setAttribute("status", "error");
                request.setAttribute("title", bundle.getString("login.error.tiltle"));
                request.setAttribute("message", bundle.getString("login.error.message.provide"));
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cRemember);
                request.getRequestDispatcher("loginView.jsp").forward(request, response);
            } else if (a == null) {
                request.setAttribute("status", "error");
                request.setAttribute("title", bundle.getString("login.error.tiltle"));
                request.setAttribute("message", bundle.getString("login.error.message.wrong"));
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cRemember);
                request.getRequestDispatcher("loginView.jsp").forward(request, response);
            } else {

                if (remember != null) {
                    cEmail.setMaxAge(-1);
                    cPass.setMaxAge(-1);
                    cRemember.setMaxAge(-1);
                }
                Payment pay = payment.getPaymentByUserID(a.getUserID());
                response.addCookie(cEmail);
                response.addCookie(cPass);
                response.addCookie(cRemember);
                String encodedUsername = URLEncoder.encode(a.getUsername(), "UTF-8");
                request.getSession().setAttribute("user", a);
                request.getSession().setAttribute("payment", pay);

                request.setAttribute("status", null);
                request.setAttribute("title", null);
                request.setAttribute("message", null);
                //request.getRequestDispatcher("dashboardView.jsp").forward(request, response);
                if(a.getRole() == 0 )
                response.sendRedirect("dashboardView.jsp?username=" + encodedUsername);
                else    response.sendRedirect("dashboardView_admin.jsp");
            }
        } catch (Exception e) {
        }
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
