import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

import static com.sun.java.accessibility.util.AWTEventMonitor.addWindowListener;

public class Client implements ActionListener {
    private Socket s;
    private DataInputStream is;
    private DataOutputStream os;
    private JFrame jFrame;
    private JScrollPane jScrollPane;
    private JTextArea jTextArea;
    private JPanel jPanel;
    private JTextField inputTextField;
    private JButton jButton;

    public Client() {
        //创建组件
        jFrame = new JFrame("客户端");
        jTextArea = new JTextArea();
        jScrollPane = new JScrollPane(jTextArea);
        jPanel = new JPanel();
        inputTextField = new JTextField(20);
        jButton = new JButton("发送");
        jFrame.add(jScrollPane, BorderLayout.CENTER);
        jFrame.add(jPanel,BorderLayout.SOUTH);
        jPanel.add(inputTextField);
        jPanel.add(jButton);
        jFrame.setBounds(300,300,500,500);
        jFrame.setVisible(true);
        jFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        jButton.addActionListener(this);

        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                disconnect();
            }
        });

        try {
            s = new Socket("127.0.0.1",8000);
            is = new DataInputStream(s.getInputStream());
            os = new DataOutputStream(s.getOutputStream());


            while (true) {
                String str = is.readUTF();
                jTextArea.append("服务器说："+str + "\n");
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
                    os.writeUTF(str);
                    jTextArea.append("客户端说："+str + "\n");
                    inputTextField.setText("");
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
            }
        }
    }

    public void disconnect() { //断开连接时同时关闭输出流和输入流以及套接字并关闭程序
        try {
            if (os != null)
                os.close();
            if (is != null)
                is.close();
            if (s != null)
                s.close();
        } catch (IOException e) {
        }
        System.exit(0);
    }

    public static void main(String[] args) {
        new Client();
    }
}

