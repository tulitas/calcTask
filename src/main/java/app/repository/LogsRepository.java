package app.repository;

import app.models.Logs;
import org.springframework.data.repository.CrudRepository;

public interface LogsRepository  extends CrudRepository<Logs, Long> {


}
