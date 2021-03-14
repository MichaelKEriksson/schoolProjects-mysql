import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.sql.*;

public class AdminGui extends JFrame {
    private Connection dbConnection;
    private JButton showWhoBorrowedWhat;
    private JTextArea outputField;
    private JPanel panel;

    public AdminGui(Connection con) {
            this.dbConnection = con;
            this.setTitle("Admin Library APP");
            this.setSize(800, 800);
            this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            panel = new JPanel(new GridLayout(6,2));


            ActionListener al = e->{

                String answer = "";
                String query = "SELECT Name, Title  FROM Books_Borrowed INNER JOIN Borrower  ON Books_Borrowed.BorrowedId = Borrower.LibraryCard";

                try {

                    PreparedStatement p = con.prepareStatement(query);
                    ResultSet rs = p.executeQuery();

                    while (rs.next()) {
                        answer += "\n" + (rs.getString(1) + "  " + rs.getString(2));
                    }
                    JOptionPane.showMessageDialog(null, answer);
//                    con.close();

                } catch (Exception exception) {
                    System.out.println(exception);
                }
            };

            showWhoBorrowedWhat = new JButton("Who borrowed what book?");
            showWhoBorrowedWhat.addActionListener(al);
            outputField = new JTextArea();

            panel.add(showWhoBorrowedWhat);
            panel.add(outputField);

            this.add(panel);
            this.setLocationRelativeTo(null);
            this.setVisible(true);
        }


}
