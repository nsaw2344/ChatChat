import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server implements ActionListener {
    private ServerSocket ss;
    private Socket s;
    private DataInputStream dataInputStream;
    private DataOutputStream dataOutputStream;
    private JFrame jFrame;
    private JScrollPane jScrollPane;
    private JTextArea jTextArea;
    private JPanel jPanel;
    private JTextField inputTextField;
    private JButton jButton;

    public Server() {
        jFrame = new JFrame("服务器");
        jTextArea = new JTextArea();
        jScrollPane = new JScrollPane(jTextArea);
        jPanel = new JPanel();
        inputTextField = new JTextField(20);
        jButton = new JButton("发送");
        jFrame.add(jScrollPane, BorderLayout.CENTER);
        jFrame.add(jPanel, BorderLayout.SOUTH);
        jPanel.add(inputTextField);
        jPanel.add(jButton);
        jFrame.setBounds(300,300,500,500);
        jFrame.setVisible(true);
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jButton.addActionListener(this);
        try {
            ss = new ServerSocket(8000);
            s = ss.accept();
            dataInputStream = new DataInputStream(s.getInputStream());
            dataOutputStream = new DataOutputStream(s.getOutputStream());

            while(true) {
                String str = dataInputStream.readUTF();
                jTextArea.append("客户端说：" + str + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==jButton){
            String str = inputTextField.getText();
            if(str.length()==0)
                JOptionPane.showMessageDialog(inputTextField,"发送内容不能为空");
            else{
                try {
                    dataOutputStream.writeUTF(str);
                    jTextArea.append("服务器说："+str + "\n");
                    inputTextField.setText("");
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
            }

        }
    }

    public static void main(String[] args) {
        new Server();
    }
}

