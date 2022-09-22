import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerPlus {
    public static void main(String[] args) {
        try {
            //创建服务器端ServerSocket ，指定端口号8000
            ServerSocket ss = new ServerSocket(8000);
            while(true) {
                Socket s = ss.accept();
                DataOutputStream dos = new DataOutputStream(s.getOutputStream());
                DataInputStream dis = new DataInputStream(s.getInputStream());
                ReceiveThread thread = new ReceiveThread(s, dos, dis);
                thread.start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
// 创建通信线程
class ReceiveThread extends Thread {
    DataOutputStream dos;
    DataInputStream dis;
    Socket s;
    public ReceiveThread(Socket s, DataOutputStream dos, DataInputStream dis) {
        this.s = s;
        this.dos = dos;
        this.dis = dis;
    }
    @Override
    public void run() {
        try {
            dos.writeUTF("请输入一个整数，我知道是奇数还是偶数");
            while(true) {
                String num = dis.readUTF();
                String result = (Integer.parseInt(num)%2==0)?"偶数":"奇数";
                dos.writeUTF(num + " 是 " + result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
