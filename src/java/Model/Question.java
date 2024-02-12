/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class Question {

    private int questionID;
    private int collectionID;
    private String questionContent;
    private String difficulty;
    private String answer1;
    private String answer2;
    private String answer3;
    private String correctAnswer;
    private Date createdAt;
    private Date updatedAt;
    private ArrayList<String> answersList;

    public Question(int questionID, int collectionID, String questionContent, String difficulty, String answer1, String answer2, String answer3, String correctAnswer, Date createdAt, Date updatedAt) {
        this.questionID = questionID;
        this.collectionID = collectionID;
        this.questionContent = questionContent;
        this.difficulty = difficulty;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.correctAnswer = correctAnswer;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        answersList = new ArrayList<>();
        answersList.add(answer1);
        answersList.add(answer2);
        answersList.add(answer3);
        answersList.add(correctAnswer);

        // Shuffle the answers randomly
        Collections.shuffle(answersList);
    }

    public Question(int collectionID, String questionContent, String difficulty, String answer1, String answer2, String answer3, String correctAnswer, Date createdAt, Date updatedAt) {
        this.collectionID = collectionID;
        this.questionContent = questionContent;
        this.difficulty = difficulty;
        this.answer1 = answer1;
        this.answer2 = answer2;
        this.answer3 = answer3;
        this.correctAnswer = correctAnswer;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    

    public Question() {
    }

    // Getters and setters
    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getCollectionID() {
        return collectionID;
    }

    public void setCollectionID(int collectionID) {
        this.collectionID = collectionID;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<String> getAnswers() {
        List<String> answers = new ArrayList<>();
        answers.add(answer1);
        answers.add(answer2);
        answers.add(answer3);
        answers.add(correctAnswer);
        return answers;
    }

    // toString method
    @Override
    public String toString() {
        return "Question{"
                + "questionID=" + questionID
                + ", collectionID=" + collectionID
                + ", questionContent='" + questionContent + '\''
                + ", difficulty='" + difficulty + '\''
                + ", answer1='" + answer1 + '\''
                + ", answer2='" + answer2 + '\''
                + ", answer3='" + answer3 + '\''
                + ", correctAnswer='" + correctAnswer + '\''
                + ", createdAt=" + createdAt
                + ", updatedAt=" + updatedAt
                + '}';
    }

    public void setAnswersList(ArrayList<String> answersList) {
        // Add the answers to the list

    }

    public ArrayList<String> getAnswersList() {
        return answersList;
    }

}