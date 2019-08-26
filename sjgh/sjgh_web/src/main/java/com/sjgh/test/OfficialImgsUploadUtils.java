package com.sjgh.test;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**官方宣传图片，广告上传的工具类
 * 以图片上传的时间作为文件名和文件夹名称
 *
 * @author 陈政
 */
public class OfficialImgsUploadUtils {
    //需要传入 文件file 和 文件根目录
    public String upload(MultipartFile file) {

        String rootPath = "C:\\Users\\asus\\Desktop\\SJGH\\sjgh\\sjgh_web\\src\\main\\webapp\\official_imgs";
        String realFileName;
        ArrayList<String> list = new ArrayList<String>();

        if (!file.isEmpty()) {
            //获取上传图片名称
            String fileName = file.getOriginalFilename();
            // 将文件名的前面部分进行截取：xx.jpg   --->   .jpg
            int idx = fileName.lastIndexOf(".");
            //上传的图片的后缀
            String extention = fileName.substring(idx);

            //文件夹名就是学校的id名称
            String folderPath = rootPath + "\\" + "c";
            System.out.println("文件夹路径========================" + folderPath);

            //格式化时间--文件名   ==后面还加上了毫秒数，防止有用户同一时间内，产生错误
            SimpleDateFormat formatterForFile = new SimpleDateFormat("yyyy-M-dd-HH-mm-ss");
            String forFile = formatterForFile.format(new Date()) + "-" + System.currentTimeMillis();

            //最终存储时的文件名
            realFileName = forFile + extention;
            File theFile = new File(folderPath, realFileName);

            //真实的路径
            String fileRealPath = folderPath + "\\" +realFileName;
            System.out.println("真实路径=========================" + fileRealPath);
            //存放到MySQL的路径
            String mysqlPath = "\\official_imgs" + "\\" + "c" + "\\" + realFileName;
            System.out.println(mysqlPath + "=============================");
            list.add(mysqlPath);

            try {
                /*判断文件夹是否存在
                 * */
                File folder = new File(folderPath);
                if (!folder.exists()) {//如果文件夹不存在
                    folder.mkdir();//创建文件夹
                }

                //保存图片
                file.transferTo(theFile);

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        //返回存入MySQL的文件地址
        return list.get(0);
    }

}

