package Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Card;
import com.stripe.model.Customer;
import com.stripe.model.PaymentIntent;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import Model.Payment;
import DAO.PaymentDAO;
import com.stripe.model.Token;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Payment")
public class PaymentStripe extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        String customerId = request.getParameter("customerId");
        String visaNumber = request.getParameter("visaNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        Double amount = 1000.0;

        String stripeKey = "sk_test_51O6BwOK3BbE7TzTQOkHEnkryYMBu8UNpmBvaElckVXiUm5uHjkkRnTNw0QtMXAs1GgP37pcxST0nqUktQomfBamc00RaZZdJ5Q";
        Stripe.apiKey = stripeKey;

        try {
            Map<String, Object> cardParams = new HashMap<>();
            cardParams.put("number", visaNumber);
            cardParams.put("exp_month", Integer.parseInt(expiryDate.split("/")[0]));
            cardParams.put("exp_year", Integer.parseInt(expiryDate.split("/")[1]));
            cardParams.put("cvc", cvv);
            Customer customer = null;
            try {
                customer = Customer.retrieve(customerId); // Lấy thông tin khách hàng bằng customerId
            } catch (StripeException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Lỗi khách hàng: " + e.getMessage());
                return;
            }

            
        Map<String, Object> retrieveParams
                = new HashMap<>();
        List<String> expandList = new ArrayList<>();
        expandList.add("sources");
        retrieveParams.put("expand", expandList);
       
        try {
            customer = Customer.retrieve(
                    customerId,
                    retrieveParams,
                    null
            );
        } catch (StripeException ex) {
            Logger.getLogger(PaymentStripe.class.getName()).log(Level.SEVERE, null, ex);
        }

//////      tao thong tin card
////        Map<String, Object> cardinfo = new HashMap<>();
////        cardinfo.put("card", cardParams);
//////        tao token
////        Token token = Token.create(cardinfo);
//        
////        tao source

          Map<String, Object> params = new HashMap<>();
        params.put("source", "tok_visa");
        try {
//            Card card  = (Card) customer.getSources().create(params); 
            Card card  = (Card) customer.getSources().create(params);

        } catch (StripeException ex) {
            Logger.getLogger(PaymentStripe.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        
        
        
        
        
        
            Map<String, Object> paymentIntentParams = new HashMap<>();
            paymentIntentParams.put("amount", (int) (amount+1));
            paymentIntentParams.put("currency", "usd");
            paymentIntentParams.put("customer", customer.getId());

            PaymentIntent paymentIntent = PaymentIntent.create(paymentIntentParams);

            response.getWriter().write(paymentIntent.getClientSecret());

            
            
            
            // Tìm payment có customerID tương ứng và cập nhật isVIP
            PaymentDAO paymentDAO = new PaymentDAO();
            Payment payment = paymentDAO.findPaymentByCustomerID(customer.getId());
            if (payment != null) {
                payment.setIsVIP(1);
                paymentDAO.updatePaymentIsVIP(customer.getId(), 1);
            }
             session.setAttribute("payment", payment);
            response.sendRedirect("dashboardView.jsp");
        } catch (StripeException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi thanh toán: " + e.getMessage());
        }
    }
}
//package Controller;
//
//import com.stripe.Stripe;
//import com.stripe.exception.StripeException;
//import com.stripe.model.Card;
//import com.stripe.model.Customer;
//import com.stripe.model.PaymentIntent;
//import com.stripe.model.Token;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.annotation.WebServlet;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//import Model.Payment;
//import DAO.PaymentDAO;
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//@WebServlet("/Payment")
//public class PaymentStripe extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Your secret Stripe API key
//        Stripe.apiKey = "sk_test_51O6BwOK3BbE7TzTQOkHEnkryYMBu8UNpmBvaElckVXiUm5uHjkkRnTNw0QtMXAs1GgP37pcxST0nqUktQomfBamc00RaZZdJ5Q";
//        Customer customer = null;
//        Map<String, Object> retrieveParams
//                = new HashMap<>();
//        List<String> expandList = new ArrayList<>();
//        expandList.add("sources");
//        retrieveParams.put("expand", expandList);
//       
//        try {
//            customer = Customer.retrieve(
//                    "cus_OvneP86FmhFrrq",
//                    retrieveParams,
//                    null
//            );
//        } catch (StripeException ex) {
//            Logger.getLogger(PaymentStripe.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        Map<String, Object> params = new HashMap<>();
//        params.put("source", "tok_mastercard");
//
//        try {
//            Card card  = (Card) customer.getSources().create(params);
//        } catch (StripeException ex) {
//            Logger.getLogger(PaymentStripe.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//}
