package DAO;

import Model.Account;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getTotalAccount()
    {
        String query = "SELECT COUNT(*) AS total FROM tblUser ;";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total") -1;
            }
        } catch (Exception e) {

        }
        return 0;
    }
    
    public int getTotalQuestion()
    {
          String query = "SELECT COUNT(*) AS total FROM tblQuestion";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total") ;
            }
        } catch (Exception e) {

        }
        return 0;
    }
    
    public int getTotalCourse()
    {
         String query = "SELECT COUNT(*) AS total FROM tblQuestionCollection ";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("total") ;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        Account a = dao.getAccountByID(1);
        System.out.println(a);

    }
}
