import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;

public class LoginGui extends JFrame implements ActionListener {

    private static JTextField userText;
    private static JPasswordField passwordText;

public LoginGui() {
        JPanel panel = new JPanel();
        JFrame frame = new JFrame();
        frame.setSize(350, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.add(panel);

        panel.setLayout(null);

        JLabel userLabel = new JLabel("User");
        userLabel.setBounds(10, 20, 80, 25);
        panel.add(userLabel);

        userText = new JTextField();
        userText.setBounds(100, 20, 165, 25);
        panel.add(userText);

        JLabel passwordLabel = new JLabel("Password");
        passwordLabel.setBounds(10, 50, 80, 25);
        panel.add(passwordLabel);

        passwordText = new JPasswordField();
        passwordText.setBounds(100, 50, 165, 25);
        panel.add(passwordText);

        JButton button = new JButton("Login");
        button.setBounds(10, 80, 80, 25);
        button.addActionListener(this);
        panel.add(button);

        frame.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent el) {
        String userName = userText.getText();
        String password = passwordText.getText();

        try {

            Connection dbConnection = DriverManager.getConnection("jdbc:mysql://localhost/librarydatabase", userName, password);
            this.setVisible(false);

            switch (userName) {
                case "borrower":
                    new UserGui(dbConnection, userName);
                    break;
                case "admin":
                    new AdminGui(dbConnection);
                    break;

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        }
    }

