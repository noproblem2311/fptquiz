package DAO;

import Model.TestRecord;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TestDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public TestRecord addNewRecord(TestRecord test) {
        String query = "INSERT INTO tblTestRecord (testID, userID, collectionID, finishTime, correctedQuestion, point, createdAt)\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, test.getTestID());
            ps.setInt(2, test.getUserID());
            ps.setInt(3, test.getCollectionID());
            ps.setString(4, test.getFinishTime());
            ps.setInt(5, test.getCorrectedQuestion());
            ps.setInt(6, test.getPoint());
            ps.setString(7, test.getCreatedAt());
            ps.executeUpdate();
            return test;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<TestRecord> getRecordsByUserID(int userID) {
        List<TestRecord> list = new ArrayList<>();
        String query = "Select * from tblTestRecord where userID=? ";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
             rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TestRecord(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        TestDAO dao = new TestDAO();
        List<TestRecord> records = dao.getRecordsByUserID(3);
       System.out.println(records);
    }

}
