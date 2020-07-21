package app.services;

import app.models.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    void addPersons(User user);

    List<User> getAll();

    void removeJobForm(long id);

    Optional<User> findById(long id);


//    String getPassword();

    String getLogin(String login);

    String getLoginName(String login);

    void calculate();
}
