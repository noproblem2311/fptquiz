package Model;


public class Courses {
    private int courseID;
    private String courseName;
    private String courseInfo;
    private String courseImg;
      private double similarityScore;
   
    public Courses(){}

    public Courses(int courseID, String courseName, String courseInfo, String courseImg) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.courseInfo = courseInfo;
        this.courseImg = courseImg;
    }

    public Courses(String courseName, String courseInfo, String courseImg) {
        this.courseName = courseName;
        this.courseInfo = courseInfo;
        this.courseImg = courseImg;
    }
    
    
    
    
     public double getSimilarityScore() {
        return similarityScore;
    }

    public void setSimilarityScore(double similarityScore) {
        this.similarityScore = similarityScore;
    }
    
    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(String courseInfo) {
        this.courseInfo = courseInfo;
    }

    public String getCourseImg() {
        return courseImg;
    }

    public void setCourseImg(String courseImg) {
        this.courseImg = courseImg;
    }

    @Override
    public String toString() {
        return "Courses{" + "courseID=" + courseID + ", courseName=" + courseName + ", courseInfo=" + courseInfo + ", courseImg=" + courseImg + '}';
    }
    
    

}