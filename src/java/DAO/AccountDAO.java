package DAO;

import Model.Account;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account getAccountByID(int userID) {
        String query = "SELECT * FROM tblUser WHERE userID = ?";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account updateAccount(int userID, String fullName, String contactNumber) {
        String query = "UPDATE tblUser\n"
                + "SET fullName = ?, contactNumber=?\n"
                + "WHERE userID = ?;";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, contactNumber);
            ps.setInt(3, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account changePassword(int userID, String newPass) {

        String query = "UPDATE tblUser SET pass = ? WHERE userID = ?";
        HashDAO hashPass = new HashDAO(newPass);
        newPass = hashPass.getHashCode().trim();
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newPass);
            ps.setInt(2, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAccountByID(1);
        System.out.println(a);

    }
}
