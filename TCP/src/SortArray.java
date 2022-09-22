import java.io.*;

import java.util.Arrays;
public class SortArray {
	public static void main(String[] args) {
		// 创建保存整型数据的数组(数组大小10)
		int[] data = new int[10];
		// 给数组赋随机值，取值范围1~100
		for (int i = 0; i < data.length; i++) {

			data[i] = 1 + (int) (Math.random() * 100);

		}

		// 将数组元素按有小到大顺序排列
		Arrays.sort(data);
		try {
			// 创建数据保存文件，如果文件不存在，重新创建
			File file = new File("d:\\data.txt");

			if (!file.exists()) {

				file.createNewFile();

			}
			// 创建FileOutputStream和DataOutputStream 输出流
			FileOutputStream fout = new FileOutputStream(file);

			DataOutputStream dout = new DataOutputStream(fout);
			// 利用输出流向文件中写入数组数据
			for (int i = 0; i < data.length; i++) {

				dout.writeInt(data[i]);

			}
			// 关闭输出流
			dout.close();
			// 创建FileInputStream和DataInputStream 输入流
			FileInputStream fin = new FileInputStream(file);

			DataInputStream in = new DataInputStream(fin);
			// 利用输入流从文件读取数据并输出
			for (int i = 0; i < data.length; i++) {

				if (i <= data.length - 2) {

					System.out.print(in.readInt() + "<");

				} else {

					System.out.print(in.readInt());

				}

			}
			// 关闭输入流
			in.close();
		} catch (IOException e) {
			// 异常处理
			System.out.println("读写发生异常");
		}
	}
}
