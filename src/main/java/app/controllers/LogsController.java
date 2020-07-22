package app.controllers;


import app.models.Logs;
import app.repository.LogsRepository;
import app.services.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/")
public class LogsController {

    private LogsService logsService;
    private String log;
    private String logForSave;
    @Autowired
    LogsRepository logsRepository;

    @Autowired
    public LogsController(LogsService logsService) {
        this.logsService = logsService;
    }

    public LogsController() {

    }


    @RequestMapping(value = "/logs/save", method = RequestMethod.POST)
    public String saveLog(Logs logs, Model model, String log) {
        logs.setLog(log);
        logsService.saveLog(logs);
        model.addAttribute("savedLog", logs);
        return "savedLog";
    }

    public String getLog() {
        return log;
    }

    public void setLog(String log) {
        this.log = log;
    }

    public String getLogForSave() {
        return logForSave;
    }

    public void setLogForSave(String logForSave) {
        this.logForSave = logForSave;
    }
}
