package app.repository;

import app.models.Logs;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LogsRepository  extends CrudRepository<Logs, Long> {

    @Query(value = "SELECT log from logs where name=:name", nativeQuery = true)
    List<Logs> findLog(String name);
}
