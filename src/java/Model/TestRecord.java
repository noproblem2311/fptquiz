package Model;

import java.util.Date;

public class TestRecord {

    private int testID;
    private int userID;
    private int collectionID;
    private String finishTime;
    private int correctedQuestion;
    private int point;
    private String createdAt;

    public TestRecord() {
    }

    public TestRecord(int testID, int userID, int collectionID, String finishTime, int correctedQuestion, int point, String createdAt) {
        this.testID = testID;
        this.userID = userID;
        this.collectionID = collectionID;
        this.finishTime = finishTime;
        this.correctedQuestion = correctedQuestion;
        this.point = point;
        this.createdAt = createdAt;
    }

    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCollectionID() {
        return collectionID;
    }

    public void setCollectionID(int collectionID) {
        this.collectionID = collectionID;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

    public int getCorrectedQuestion() {
        return correctedQuestion;
    }

    public void setCorrectedQuestion(int correctedQuestion) {
        this.correctedQuestion = correctedQuestion;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("TestRecord{");
        sb.append("testID=").append(testID);
        sb.append(", userID=").append(userID);
        sb.append(", collectionID=").append(collectionID);
        sb.append(", finishTime=").append(finishTime);
        sb.append(", correctedQuestion=").append(correctedQuestion);
        sb.append(", point=").append(point);
        sb.append(", createdAt=").append(createdAt);
        sb.append('}');
        return sb.toString();
    }

}
