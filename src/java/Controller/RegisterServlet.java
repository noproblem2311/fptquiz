/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.RegisterDAO;
import DAO.PaymentDAO;
import Model.Account;
import Model.Payment;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;
import java.util.HashMap;
import java.util.Map;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Customer;
/**
 *
 * @author anquan
 */
public class RegisterServlet extends HttpServlet {

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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        ResourceBundle bundle = ResourceBundle.getBundle("bundle.bundle", request.getLocale());
        try {
            RegisterDAO register = new RegisterDAO();
            if (register.isEmpty(username) || register.isEmpty(pass) || register.isEmpty(email)) {
                request.setAttribute("status", "error");
                request.setAttribute("title", bundle.getString("login.error.tiltle"));
                request.setAttribute("message", bundle.getString("signup.error.message.provide"));
                request.getRequestDispatcher("registerView.jsp").forward(request, response);
            } else {
                Account a = register.checkAccountExist(email,username);
                if (a == null) {
                            String customerID ="";

                    try {
                        String stripeKey = "sk_test_51O6BwOK3BbE7TzTQOkHEnkryYMBu8UNpmBvaElckVXiUm5uHjkkRnTNw0QtMXAs1GgP37pcxST0nqUktQomfBamc00RaZZdJ5Q";
                        Stripe.apiKey = stripeKey;

                        // Create a new customer in Stripe
                        Map<String, Object> customerParams = new HashMap<>();
                        customerParams.put("name", username);
                        customerParams.put("email", email);
                        Customer customer = Customer.create(customerParams);
                        // Now you can save the `customer.getId()` in your system for future reference.
                        // For example: register.saveCustomerInfo(customer.getId());
                        // Rest of your code
                        // ...
                         customerID = customer.getId();
                           
                       
                    } catch (StripeException e) {
                        // Handle Stripe-related errors
                        System.out.println("=============loi roi ====================");
                        e.printStackTrace(); // You can replace this with your error handling logic
                    } catch (Exception e) {
                        // Handle other exceptions
                        System.out.println("=============loi roi ====================");
                        e.printStackTrace(); // You can replace this with your error handling logic
                    }
                    register.register(username, pass, email);
                    System.out.println("====================="+pass);
                    a = register.checkAccountExist(email, username);

                // Create a new payment record
                if (a != null) {
                    PaymentDAO paymentDAO = new PaymentDAO();
                    Payment payment = new Payment();
                    payment.setUserID(a.getUserID());
                    payment.setIsVIP(0); // Set your desired value for isVIP
                    payment.setCustomerID(customerID); // Use the customerID obtained from Stripe

                    // Insert the payment record
                    paymentDAO.insertPayment(payment);
                }

                // Redirect to the login page or other desired page
                response.sendRedirect("loginView.jsp");
                              response.sendRedirect("loginView.jsp");
                } else {
                    request.setAttribute("status", "error");
                    request.setAttribute("title", bundle.getString("login.error.tiltle"));
                    request.setAttribute("message", bundle.getString("signup.error.message.existed"));
                    request.getRequestDispatcher("registerView.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            // Handle exception
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
