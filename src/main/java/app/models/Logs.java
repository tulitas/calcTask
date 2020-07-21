package app.models;

import javax.persistence.*;

@Entity

@Table(name = "persons", catalog = "persons")

public class Logs implements java.io.Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "logs")
    private String logs;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogs() {
        return logs;
    }

    public void setLogs(String logs) {
        this.logs = logs;
    }

    @Override
    public String toString() {
        return "Logs{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", logs='" + logs + '\'' +
                '}';
    }
}
