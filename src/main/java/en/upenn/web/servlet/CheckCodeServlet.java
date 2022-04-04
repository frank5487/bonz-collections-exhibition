package en.upenn.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCode")
public class CheckCodeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setHeader("pragma", "no-cache");
        resp.setHeader("cache-control", "no-cache");
        resp.setHeader("expires", "0");

        int width = 80;
        int height = 30;

        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();

        g.setColor(Color.gray);
        g.fillRect(0, 0, width, height);

        String checkCode = getCheckCode();
        req.getSession().setAttribute("CHECKCODE_SERVER", checkCode);

        g.setColor(Color.YELLOW);
        g.setFont(new Font("Black", Font.BOLD, 24));
        g.drawString(checkCode, 15, 25);

        ImageIO.write(image, "PNG", resp.getOutputStream());
    }

    private String getCheckCode() {
        String s = "0123456789ABCDEFGabcdefg";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(s.length());
            sb.append(s.charAt(index));
        }
        return sb.toString();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

}
