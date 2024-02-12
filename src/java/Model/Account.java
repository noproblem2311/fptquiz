package Model;

public class Account {

    private int userID;
    private String username;
    private String password;
    private String email;
    private int point;
    private int rankID;
    private String contactnumber;
    private String fullname;
    private int role;


    public Account() {
    }

    public Account(int userID, String username, String fullname, String email, String contactnumber, String password, int point, int rankID) {
        this.userID = userID;
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.contactnumber = contactnumber;
        this.password = password;
        this.point = point;
        this.rankID = rankID;
     
    }

    public Account(int userID, String username, String fullname, String email, String contactnumber, String password, int point, int rankID, int role) {
        this.userID = userID;
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.contactnumber = contactnumber;
        this.password = password;
        this.point = point;
        this.rankID = rankID;
        this.role = role;
         
    }


    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getRankID() {
        return rankID;
    }

    public void setRankID(int rankID) {
        this.rankID = rankID;
    }

    public int getRole() {
        return role;
    }

    public String getContactnumber() {
        return contactnumber;
    }

    public void setContactnumber(String contactnumber) {
        this.contactnumber = contactnumber;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }


}
