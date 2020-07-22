package app.services;

import app.models.Logs;

import java.util.List;

public interface LogsService  {

    void saveLog(Logs logs);

    List<Logs> findLog(String log);
}
