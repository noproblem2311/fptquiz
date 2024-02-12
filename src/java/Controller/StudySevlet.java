package Controller;

import DAO.QuestionDAO;
import Model.Question;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class StudySevlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy questionID từ request
        String questionIDString = request.getParameter("courseID");
        int questionID;

        if (questionIDString != null && !questionIDString.isEmpty()) {
            try {
                questionID = Integer.parseInt(questionIDString);
            } catch (NumberFormatException e) {
                // Xử lý lỗi khi không thể chuyển đổi thành số nguyên
                // Ví dụ: Hiển thị thông báo lỗi và chuyển hướng người dùng đến trang lỗi
                response.getWriter().println("Invalid questionID parameter");
                return;
            }
        } else {
            // Xử lý lỗi khi giá trị là null hoặc rỗng
            // Ví dụ: Hiển thị thông báo lỗi và chuyển hướng người dùng đến trang lỗi
            response.getWriter().println("Missing questionID parameter");
            return;
        }

        // Sử dụng QuestionDAO để lấy thông tin câu hỏi dựa trên questionID
        QuestionDAO questionDAO = new QuestionDAO();
        List<Question> question = questionDAO.getAllQuestionByCollectionID(questionID);

        // In dữ liệu danh sách question ra để kiểm tra
        for (Question q : question) {
            System.out.println("Question ID: " + q.getQuestionID());
            System.out.println("Question Content: " + q.getQuestionContent());
            System.out.println("Correct Answer: " + q.getCorrectAnswer());
            // In thêm các thông tin khác của câu hỏi nếu cần
        }

        // Chuyển hướng đến trang studyView.jsp với thông tin của câu hỏi
        request.setAttribute("question", question);
        request.getRequestDispatcher("studyView.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
