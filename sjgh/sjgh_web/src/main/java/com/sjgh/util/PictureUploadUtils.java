package com.sjgh.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 图片上传的工具类
 *
 * 以图片上传的时间作为文件名和文件夹名称
 *
 * @author 陈政
 */
public class PictureUploadUtils {
    //需要传入 文件file 和 文件根目录名字（imgs下的哪个文件夹）
    public List upload(MultipartFile file, String rootFileName) {

        //获取项目中专门存放图片的文件的地址
        // 获得项目的路径
        //ServletContext sc = request.getSession().getServletContext();
        // 上传位置
        //String rootPath = sc.getRealPath("/") + "WEB-INF" + "\\" + "imgs"; // 设定
        //String rootPath = request.getServletContext().getRealPath("/imgs");//获取项目/imgs的动态绝对路径
        //System.out.println(rootPath+ "================================");
        //String rootPath = request.getSession().getServletContext().getRealPath("/imgs");

        //主目录都是在imgs下
        String rootPath = "C:\\Users\\asus\\Desktop\\SJGH\\sjgh\\sjgh_web\\src\\main\\webapp\\imgs\\" + rootFileName;
        String realFileName;
        ArrayList<String> list = new ArrayList<String>();

        if (!file.isEmpty()) {
            //获取上传图片名称
            String fileName = file.getOriginalFilename();
            // 将文件名的前面部分进行截取：xx.jpg   --->   .jpg
            int idx = fileName.lastIndexOf(".");
            String extention = fileName.substring(idx);

            /*以上传时间给图片命名（在服务器磁盘上的名称）
             *
             */
            //格式化时间---文件夹
            SimpleDateFormat formatterForFolder = new SimpleDateFormat("yyyy-MM");
            String forFolder = formatterForFolder.format(new Date());

            //格式化时间--文件名   ==后面还加上了毫秒数，防止有用户同一时间内，产生错误
            SimpleDateFormat formatterForFile = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
            String forFile = formatterForFile.format(new Date()) + "-" + System.currentTimeMillis();

            /**
             *
             *用户图片上传到那个文件夹
             *放在传入的根目录下
             *以时间作为文件夹分区的原因是提高数据IO
             **/
            //真实的文件夹路径
            String folderPath = rootPath + "\\" + forFolder + "-c";

            //最终存储时的图片名
            realFileName = forFile + extention;
            File theFile = new File(folderPath, realFileName);

            //真实的完整路径  ==路径 + 图片名称==   路径;如果需要进行压缩，则需要传入此路径
            String fileRealPath = folderPath + "\\" +realFileName;
            //System.out.println("完整的路径=========================" + fileRealPath);

            //存放到MySQL的路径
            String mysqlPath = "\\imgs" + rootFileName + "\\" + forFolder + "-c" + "\\" + realFileName;
            //System.out.println(mysqlPath + "=============================");
            //list.get(0)返回存入SQL的路径
            list.add(mysqlPath);
            //数组放入此图片的完整路径===list.get(1)
            list.add(fileRealPath);

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

        //返回存入的图片的完整路径
        return list;
    }


}

