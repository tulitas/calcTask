package app.services;

import app.models.User;
import app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    @Transactional
    public void addPersons(User user) {
        userRepository.save(user);
    }

    @Override
    public List<User> getAll() {
        return (List<User>) userRepository.findAll();
    }

    @Override
    public void removeJobForm(long id) {
        userRepository.deleteById(id);
    }

    @Override
    public Optional<User> findById(long id) {
        return userRepository.findById(id);
    }


    @Override
    public String getLogin(String login) {
        return String.valueOf(userRepository.getLogin(login));
    }

    @Override
    public String getLoginName(String login) {
        return userRepository.getLoginName(login);
    }

}
