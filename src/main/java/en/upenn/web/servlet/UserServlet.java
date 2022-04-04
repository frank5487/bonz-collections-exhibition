package en.upenn.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import en.upenn.domain.ResultInfo;
import en.upenn.domain.User;
import en.upenn.service.UserService;
import en.upenn.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet{

    private UserService userService = new UserServiceImpl();

    public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 0. check if verified code is right
        String check = req.getParameter("check");
        HttpSession session = req.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");
        if (checkcode_server == null || !checkcode_server.equalsIgnoreCase(check)) {
            ResultInfo info = new ResultInfo();

            info.setFlag(false);
            info.setErrorMsg("false verified code");

            // System.out.println("false verified code");
            writeValue(info, resp);
            return;
        }

        // 1. get data
        Map<String, String[]> map = req.getParameterMap();

        // 2. package data
        User user = new User();
        try {
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        // 3. use service to complete the register
        boolean flag = userService.register(user);

        ResultInfo info = new ResultInfo();
        info.setFlag(flag);
        if (flag == false) {
            info.setErrorMsg("fails to sign up");
        }

        writeValue(info, resp);
    }

    public void active(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        if (code != null) {
            boolean flag = userService.active(code);

            String msg = null;
            if (flag) {
                msg = "activate successfully, please <a href='../login.html'>login</a>";
            } else {
                msg = "fails to activate, please contact the admin.";
            }

            resp.setContentType("text/html;charset=utf-8");
            resp.getWriter().write(msg);
        }
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 0. check if verified code is right
        String check = req.getParameter("check");
        HttpSession session = req.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");
        if (checkcode_server == null || !checkcode_server.equalsIgnoreCase(check)) {
            ResultInfo info = new ResultInfo();

            info.setFlag(false);
            info.setErrorMsg("false verified code");

            // System.out.println("false verified code");
            writeValue(info, resp);
            return;
        }

        Map<String, String[]> map = req.getParameterMap();
        User loginUser = new User();
        try {
            BeanUtils.populate(loginUser, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        User user = userService.login(loginUser);
        ResultInfo info = new ResultInfo();
        if (user == null) {
            info.setFlag(false);
            info.setErrorMsg("false username or password");
            writeValue(info, resp);
            return;
        }
        if (!"Y".equals(user.getStatus())) {
            info.setFlag(false);
            info.setErrorMsg("this account hasn't activated yet.");
            writeValue(info, resp);
            return;
        }

        // user is valid and has activated already.
        req.getSession().setAttribute("user", user);
        info.setFlag(true);

        writeValue(info, resp);
    }

    public void findOne(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object user = req.getSession().getAttribute("user");

        writeValue(user, resp);
    }

    public void exit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().invalidate();

        resp.sendRedirect(req.getContextPath()+"/login.html");
    }

    public void isLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        boolean flag;
        if (user != null) {
            flag = true;
        } else {
            flag = false;
        }

        writeValue(flag, resp);
    }
}
