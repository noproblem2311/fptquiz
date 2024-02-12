/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import context.DBContext;

import java.sql.*;

/**
 *
 * @author anquan
 */
public class LoginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean isEmpty(String input) {
        return input == null || input.trim().isEmpty();
    }

    public Account checkLogin(String email, String pass) {
        HashDAO hashPass = new HashDAO(pass);
        pass = hashPass.getHashCode().trim();
        try {
            String query = "Select * from tblUser where [email] = ?";
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8),rs.getInt(9));
                return a.getPassword().equals(pass) ? a : null;
            }

        } catch (Exception e) {

        }
        return null;
    }
    
    
}
