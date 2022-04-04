package en.upenn.service.impl;

import en.upenn.dao.UserDao;
import en.upenn.dao.impl.UserDaoImpl;
import en.upenn.domain.User;
import en.upenn.service.UserService;
import en.upenn.util.MailUtils;
import en.upenn.util.UuidUtils;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public boolean register(User user) {
        // to check if this username has been signed up by others.
        User u = userDao.findByUsername(user.getUsername());
        if (u != null) {
            // System.out.println("UserServiceImpl: false");
            return false;
        }

        // set activation status "N"
        user.setStatus("N");
        // set activation code which is unique
        user.setCode(UuidUtils.getUuid());
        userDao.save(user);

        // send activation email
        String content = "<a href='http://localhost/commodity/user/active?code="+user.getCode()+"'>click to activate (commodity website) </a>";
        MailUtils.sendMail(user.getEmail(), content, "activation email");

        return true;
    }

    @Override
    public boolean active(String code) {
        User user = userDao.findByCode(code);
        if (user != null) {
            userDao.updateStatus(user);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User login(User loginUser) {
        return userDao.findByUsernameAndPassword(loginUser.getUsername(), loginUser.getPassword());
    }
}
