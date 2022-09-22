import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Encrypt {
    public static void main(String[] args) throws IOException {
    	// 指定要发送的电报内容
    	String data = "你好你好，我好我好的";//替换成任意10个字
        // 将电报分割成字符数组
        char[] db = data.toCharArray();
        // 打开指定存放电报的文件，如果文件不存在，则创建文件
        File file = new File("D:\\data.txt");
        if(!file.exists()){
            file.createNewFile();
        }
        // 循环遍历字符数组，将每个字符加密处理
        for (int i = 0; i < db.length; i++) {
            db[i] = (char) (db[i] ^ 'q'); //异或运算进行加密
        }
        // 利用字符输出流FileWriter将加密后的字符数组写入文件中
        FileWriter out = new FileWriter(file);
        out.write(db,0,db.length);
        out.flush();
        out.close();
        // 利用字符输入流FileReader读取文件，将密文输出        
        int n;
        FileReader in1 = new FileReader(file);
        char[] buf = new char[10];
        System.out.println("密文：");
        while((n = in1.read(buf)) != -1){
            String s = new String(buf);
            System.out.print(s);
        }
        in1.close();
        // 利用字符输入流FileReader读取文件，将密文转换为明文输出  
        FileReader in2 = new FileReader(file);
        System.out.println("\n明文：");
        while((n = in2.read(buf)) != -1){
            for (int i = 0; i < n; i++) {
                buf[i] = (char) (buf[i] ^ 'q');
            }
            String s = new String(buf);
            System.out.print(s);
        }
        in2.close();

    }
}
