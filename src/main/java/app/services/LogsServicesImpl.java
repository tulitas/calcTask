package app.services;


import app.models.Logs;
import app.repository.LogsRepository;
import app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LogsServicesImpl implements LogsService {

    @Autowired
    private final LogsRepository logsRepository;

    @Autowired
    public LogsServicesImpl(LogsRepository logsRepository) {
        this.logsRepository = logsRepository;
    }


    @Transactional
    @Override
    public void saveLog(Logs logs) {

        logsRepository.save(logs);
    }


}
