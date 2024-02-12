package DAO;

import Model.Answer;
import Model.Question;
import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class QuestionDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Question> getQuestion(int id) {
        List<Question> list = new ArrayList<>();
        String query = "SELECT TOP 5 *\n"
                + "FROM tblQuestion\n"
                + "WHERE collectionID = ?\n"
                + "  AND difficulty IN (1, 1, 2, 2, 3)\n"
                + "ORDER BY NEWID()";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int questionId = rs.getInt("questionID");
                list.add(new Question(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10)
                ));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public int getPlace() {
        String query = "SELECT MAX(questionID) AS lastQuestionID FROM tblQuestion";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("lastQuestionID") + 1;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int getCate(String cate) {
        String query = "Select collectionID  from tblQuestionCollection where collectionName = ?";
        try {
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cate);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
        public List<Question> getAllQuestionByCollectionID(int collectionID) {
    List<Question> list = new ArrayList<>();
    String query = "SELECT *\n"
            + "FROM tblQuestion\n"
            + "WHERE collectionID = ?\n"
            
            + "ORDER BY NEWID()";
    try {
        conn = (Connection) new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, collectionID);
        rs = ps.executeQuery();
        while (rs.next()) {
            int questionId = rs.getInt("questionID");
            list.add(new Question(rs.getInt(1), rs.getInt(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6),
                    rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10)
            ));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}


    public void addQuest(Question question, int index) {
        try {
            String query = "INSERT INTO tblQuestion(questionID,collectionID,questionContent,difficulty,answer1,answer2,answer3,correctAnswer,createdAt,updatedAt) \n"
                    + "VALUES \n"
                    + "    (?, ?, ?, ?, ?,?,?,?,?,?);";
            conn = (Connection) new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, index);
            ps.setInt(2, question.getCollectionID());
            ps.setString(3, question.getQuestionContent());
            ps.setString(4, question.getDifficulty());
            ps.setString(5, question.getAnswer1());
            ps.setString(6, question.getAnswer2());
            ps.setString(7, question.getAnswer3());
            ps.setString(8, question.getCorrectAnswer());
            ps.setTimestamp(9, new Timestamp(question.getCreatedAt().getTime()));
            ps.setTimestamp(10, new Timestamp(question.getUpdatedAt().getTime()));

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        System.out.println(dao.getCate("CEA201"));

    }

}
