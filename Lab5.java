ApplicationPhone Project
  #1.CreateAccount
  
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

    public class CreateAccount extends JFrame {
        JLabel labelBanner, labelStatus,labelUser, labelPassword;
        JButton createButton, exitButton;
        JTextField usrTextField, pwTextField;
        JPanel newPanel;

        CreateAccount(){
            setTitle("Create Account");
            setLayout(new BorderLayout());
            labelBanner = new JLabel("Create Account");
            labelBanner.setFont(new Font("Serif", Font.BOLD, 40));
            labelBanner.setForeground(Color.BLUE);


            labelStatus = new JLabel("Status: In Progress...");
            createButton = new JButton("Create");
            exitButton = new JButton("Exit");
            labelUser = new JLabel("User Name");
            labelPassword =  new JLabel("Password");
            usrTextField = new JTextField(15);
            pwTextField = new JTextField(15);
            newPanel = new JPanel();
            newPanel.setLayout(new GridLayout(3,2));
            newPanel.add(labelUser);
            newPanel.add(usrTextField);
            newPanel.add(labelPassword);
            newPanel.add(pwTextField);
            newPanel.add(createButton);
            newPanel.add(exitButton);
            add(labelBanner,BorderLayout.NORTH);
            add(newPanel,BorderLayout.CENTER);
            add(labelStatus,BorderLayout.SOUTH);


            createButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    try {
                        FileWriter fileWriter = new FileWriter("users.txt", true);
                        // Open the file.
                        PrintWriter outputFile = new PrintWriter(fileWriter);
                        outputFile.print(usrTextField.getText());
                        outputFile.print(" ");
                        outputFile.println(pwTextField.getText());
                        outputFile.close();
                        System.out.println("Data written to the file.");
                        labelStatus.setText("Status: Success");

                    }
                    catch (IOException io){System.out.println("Error: " + io.getMessage());}
                }
            });
            exitButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    System.exit(0);
                }
            });
        }
    }
    class CreateAccountFormDemo
    {
        //main() method start
        public static void main(String arg[])
        {
            //create instance of the CreateLoginForm
            CreateAccount form = new CreateAccount();
            form.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            form.setSize(300,220);  //set size of the frame
            form.setVisible(true);  //make form visible to the user

        }
    }

#2.Create Login form
  
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


    //create CreateLoginForm class to create login form
//class extends JFrame to create a window where our component add
//class implements ActionListener to perform an action on button click
    class CreateLoginForm extends JFrame implements ActionListener
    {
        //initialize button, panel, label, and text field
        JButton jButtonSubmit, jButtonExit,jButtonCreateAccount;
        JPanel newPanel;
        JLabel userLabel, passLabel,infoLabel;
        final JTextField  textField1, textField2;

        //calling constructor
        CreateLoginForm()
        {
            setTitle("Lab 5 Login Window");
            setLayout(new BorderLayout());
            Icon logo = new ImageIcon(getClass().getResource("user-login-305.png"));
            infoLabel = new JLabel(logo);
            infoLabel.setSize(new Dimension(20,20));
            //create label for username
            userLabel = new JLabel();
            userLabel.setText("Username");      //set label value for textField1

            //create text field to get username from the user
            textField1 = new JTextField(15);    //set length of the text

            //create label for password
            passLabel = new JLabel();
            passLabel.setText("Password");      //set label value for textField2

            //create text field to get password from the user
            textField2 = new JPasswordField(15);    //set length for the password

            //create submit button
            jButtonSubmit = new JButton("SUBMIT"); //set label to button
            jButtonExit = new JButton("EXIT");
            jButtonCreateAccount = new JButton("Create an Account");

            //create panel to put form elements
            newPanel = new JPanel(new GridLayout(4, 1));
            newPanel.add(userLabel);    //set username label to panel
            newPanel.add(textField1);   //set text field to panel
            newPanel.add(passLabel);    //set password label to panel
            newPanel.add(textField2);   //set text field to panel
            newPanel.add(jButtonSubmit);
            newPanel.add(jButtonExit);

            //add panel to frame
            add(infoLabel,BorderLayout.NORTH);
            add(newPanel,BorderLayout.CENTER);
            add(jButtonCreateAccount,BorderLayout.SOUTH);

            //perform action on button click
            jButtonSubmit.addActionListener(this);     //add action listener to button

            jButtonExit.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    int r = JOptionPane.showConfirmDialog(null,
                            "Are you sure?", "Confirmation window", JOptionPane.YES_NO_OPTION);
                    if(r == 0)
                        System.exit(0);
                }
            });

            jButtonCreateAccount.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    CreateAccount createAccountForm = new CreateAccount();
                    createAccountForm.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    createAccountForm.setSize(300,220);  //set size of the frame
                    createAccountForm.setVisible(true);  //make form visible to the user
                }
            });

        }

        //define abstract method actionPerformed() which will be called on button click
        public void actionPerformed(ActionEvent ae)     //pass action listener as a parameter
        {
            String userValue = textField1.getText();        //get user entered username from the textField1
            String passValue = textField2.getText();        //get user entered pasword from the textField2
            String user = "";
            String pw = "";
            boolean isSuccess = false;

            // Lab 5 Step 5: use username and password from users.txt file
            //
            //
            //


            //check whether the credentials are authentic or not
            if (userValue.equals("start") && passValue.equals("lab5")) {  //if authentic, navigate user to a new page

                //create instance of the ConvertFrame
                CellPhoneInventory page = new CellPhoneInventory();
                page.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                page.setSize(350, 250); // set frame size
                page.setVisible(true); // display frame
                CreateLoginForm.this.dispose();
                isSuccess = true;
            }
            if (!isSuccess) {
                //show error message
                JOptionPane.showMessageDialog(null, "Please enter valid username and password");
                System.out.println("Please enter valid username and password");
            }
        }
    }
    //create the main class
    class LoginFormDemo
    {
        //main() method start
        public static void main(String arg[])
        {
            //create instance of the CreateLoginForm
            //Login window for Lab 5
            CreateLoginForm form = new CreateLoginForm();
            form.setSize(320,240);  //set size of the frame
            form.setVisible(true);  //make form visible to the user

        }
    }


#3.Invalid Model Exception
  public class InvalidModelException extends  Exception{
    public InvalidModelException(String s){
        super("Invalid Model Exception");
    }
}

#4. Invalid Manufacture Exception
  public class InvalidManufacturerException extends Exception{
    public InvalidManufacturerException(){
        super("Invalid Manufacturer");
    }
}
#5.Invalid Retail Price
  public class InvalidRetailPrice extends Exception{
    private static final String price =;

    public InvalidRetailPrice(String s){
        super("Invalid Retail Price");
    }
    public InvalidRetailPrice(){
        super("Invalid Retail Price:" + price);
    }
}
