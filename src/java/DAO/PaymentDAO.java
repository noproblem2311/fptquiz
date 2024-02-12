package DAO;

import Model.Payment;
import context.DBContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentDAO {

    private Connection connection;

    public PaymentDAO() {
        try {
            this.connection = new DBContext().getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertPayment(Payment payment) {
        String sql = "INSERT INTO tblPayment (userID, isVIP, customerID) VALUES (?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, payment.getUserID());
            statement.setInt(2, payment.getIsVIP());
            statement.setString(3, payment.getCustomerID());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Payment getPaymentById(int paymentID) {
        String sql = "SELECT * FROM tblPayment WHERE paymentID = ?";
        Payment payment = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, paymentID);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                payment = new Payment(
                    resultSet.getInt("paymentID"),
                    resultSet.getInt("userID"),
                    resultSet.getInt("isVIP"),
                    resultSet.getString("customerID")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payment;
    }
    public Payment getPaymentByUserID(int userID) {
    String sql = "SELECT * FROM tblPayment WHERE userID = ?";
    Payment payment = null;

    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setInt(1, userID);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            payment = new Payment(
                resultSet.getInt("paymentID"),
                resultSet.getInt("userID"),
                resultSet.getInt("isVIP"),
                resultSet.getString("customerID")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return payment;
}
    
    public Payment findPaymentByCustomerID(String customerID) {
    String sql = "SELECT * FROM tblPayment WHERE customerID = ?";
    Payment payment = null;

    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, customerID);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            payment = new Payment(
                resultSet.getInt("paymentID"),
                resultSet.getInt("userID"),
                resultSet.getInt("isVIP"),
                resultSet.getString("customerID")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return payment;
}
public void updatePaymentIsVIP(String customerID, int isVIP) {
    String sql = "UPDATE tblPayment SET isVIP = ? WHERE customerID = ?";

    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setInt(1, isVIP);
        statement.setString(2, customerID);

        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    // Other methods for updating, deleting, and querying payments can be added here as needed.

}
