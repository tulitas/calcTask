package app.repository;

import app.models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {

    @Query(value = "SELECT * from persons.persons where login=:login", nativeQuery = true)
    User getLogin(String login);

    @Query(value = "SELECT count(login) from persons.persons where login=:login", nativeQuery = true)
    String getLoginName(String login);
}
