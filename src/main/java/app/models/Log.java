package app.models;

import javax.persistence.*;

@Entity
public class Log {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "user")
    private String user;

    @Column(name = "log")
    private String log;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", log='" + log + '\'' +
                '}';
    }
}
