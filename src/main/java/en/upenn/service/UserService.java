package en.upenn.service;

import en.upenn.domain.User;

public interface UserService {
    boolean register(User user);

    boolean active(String code);

    User login(User loginUser);
}
