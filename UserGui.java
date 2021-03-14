import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.sql.*;

public class UserGui extends JFrame {
    private String userName;
    private Connection dbConnection;
    private JTextField searchBook;
    private JTextArea displaySearchedBook;
    private JButton showAvailableBooks;
    private JTextArea displayAvailableBooks;
    private JButton borrowBooks;
    private JTextArea displayBorrowedBooks;
    private JTextField searchJournal;
    private JTextArea displaySearchedJournal;
    private JPanel panel;

    public UserGui(Connection con, String userName) {
            this.dbConnection = con;
            this.userName = userName;
            this.setTitle("Borrower Library APP");
            this.setSize(800, 800);
            this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
            panel = new JPanel(new GridLayout(4,2));

            ActionListener alOne = e->{
                String query = "SELECT Title, Author, Pages, Classification FROM Books WHERE Title LIKE ? '%' ;";
                String answer = "";

                try {
                    PreparedStatement p = con.prepareStatement(query);
                    p.setString(1, searchBook.getText());
                    ResultSet rs = p.executeQuery();

                    while (rs.next())
                        answer = (rs.getString(1) + " " + rs.getString(2) + " " + rs.getInt(3) + " " + rs.getString(4));
                    this.displaySearchedBook.setText(answer);
//                    con.close();
                } catch (SQLException throwables) {
                throwables.printStackTrace();
                }
            };

        ActionListener alTwo = e->{
            String answer = "";

            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT BookId, Title FROM Books WHERE Title NOT IN (SELECT Title FROM Books_Borrowed);");

                while (rs.next())
                    answer += "\n" + (rs.getInt(1) + " " + rs.getString(2));
                this.displayAvailableBooks.setText(answer);
//                    con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        };

        ActionListener alThree= e-> {

            String inputBookId = JOptionPane.showInputDialog("Enter BookId");
            String bookTitleQuery = "SELECT Title from Books where BookId = ?";
            String title = "";
            String libraryCardQuery = "SELECT LibraryCard from borrower where name = '" + userName + "';";
            int libraryCard = -1;

            try { Integer.parseInt(inputBookId);

            try {
                PreparedStatement p = con.prepareStatement(bookTitleQuery);
                p.setString(1, inputBookId);
                ResultSet rs = p.executeQuery();

                while (rs.next())
                    title = rs.getString(1);

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            try {
                PreparedStatement p = con.prepareStatement(libraryCardQuery);
                ResultSet rs = p.executeQuery();

                while (rs.next())
                    libraryCard = rs.getInt(1);
                System.out.println(libraryCard);
//
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            String query = "INSERT INTO books_borrowed(BorrowedId, Title, BookId) VALUE(" + libraryCard + ", '" + title + "', " + inputBookId + ");";
            try {
                PreparedStatement p = con.prepareStatement(query);
                p.executeUpdate();
                this.displayBorrowedBooks.setText("Book: " + title + " is borrowed");
//                    con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

                } catch(NumberFormatException es){
                this.displayBorrowedBooks.setText("Not an int, try again.");
                }
            };


        ActionListener alFour = e->{
            String query = "SELECT Title, Published, Storage FROM Journals WHERE Title LIKE ? '%' ;";
            String answer = "";

            try {
                PreparedStatement p = con.prepareStatement(query);
                p.setString(1, searchJournal.getText());
                ResultSet rs = p.executeQuery();

                while (rs.next())
                    answer += "\n" + (rs.getString(1) + " " + rs.getDate(2) + " " + rs.getString(3));
                this.displaySearchedJournal.setText(answer);
//                    con.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        };

        searchBook = new JTextField("Start to type book name..");
        searchBook.addActionListener(alOne);
        displaySearchedBook = new JTextArea();
        showAvailableBooks = new JButton("Show available books to borrow");
        showAvailableBooks.addActionListener(alTwo);
        displayAvailableBooks= new JTextArea();
        borrowBooks = new JButton("Borrow books");
        borrowBooks.addActionListener(alThree);
        displayBorrowedBooks = new JTextArea();
        searchJournal = new JTextField("Start to type journal name..");
        searchJournal.addActionListener(alFour);
        displaySearchedJournal = new JTextArea();

        panel.add(searchBook);
        panel.add(displaySearchedBook);
        panel.add(showAvailableBooks);
        panel.add(displayAvailableBooks);
        panel.add(borrowBooks);
        panel.add(displayBorrowedBooks);
        panel.add(searchJournal);
        panel.add(displaySearchedJournal);

        this.add(panel);
        this.setLocationRelativeTo(null);
        this.setVisible(true);
    }
}
