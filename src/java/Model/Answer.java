package Model;
public class Answer {
    private String answer1;
    private String answer2;
    private String answer3;
    private String correctAnswer;

    public Answer() {
    }

    public Answer(String answer1, String answer2, String answer3, String correctAnswer) {
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.correctAnswer = correctAnswer;
    }

    public String getAnswer1() {
        return answer1;
    }

    public void setAnswer1(String answer1) {
        this.answer1 = answer1;
    }

    public String getAnswer2() {
        return answer2;
    }

    public void setAnswer2(String answer2) {
        this.answer2 = answer2;
    }

    public String getAnswer3() {
        return answer3;
    }

    public void setAnswer3(String answer3) {
        this.answer3 = answer3;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    @Override
    public String toString() {
        return "Answer{" + "answer1=" + answer1 + ", answer2=" + answer2 + ", answer3=" + answer3 + ", correctAnswer=" + correctAnswer + '}';
    }
    
}
