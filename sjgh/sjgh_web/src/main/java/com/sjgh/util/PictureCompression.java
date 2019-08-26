package com.sjgh.util;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * 图片压缩，添加水印工具类
 * <p>
 * 读取图片尺寸大小，
 * 有选择的进行图片压缩，添加水印工具类
 *
 *
 * <dependency>
 * <groupId>net.coobird</groupId>
 * <artifactId>thumbnailator</artifactId>
 * <version>0.4.8</version>
 * </dependency>
 * 谷歌图片压缩
 */

public class PictureCompression {

    //需要传入要压缩的图片的完整路径；以及水印的完整路径
    public void googleCompress(String olderImgRoad, String watermarkImgRoad) {
        try {
            //要压缩的图片路径
            File olderImg = new File(olderImgRoad);
            //水印图片路径
            File watermarkImg = new File(watermarkImgRoad);

            //对待压缩的图片进行尺寸大小的判断
            BufferedImage sourceImg = ImageIO.read(new FileInputStream(olderImg));
            Double size = Double.valueOf(String.format("%.1f", olderImg.length() / 1024.0));// 源图大小kb
            //Double size = Double.valueOf(String.format("%.1f", olderImg.length()));// 源图大小kb
            //System.out.println("=====================" + size);
            int width = sourceImg.getWidth(); // 源图宽度
            int height = sourceImg.getHeight(); // 源图高度

            //只对大于的图片才进行处理
            if(size > 150.0){
                if (width < height || width == height) {
                    Thumbnails.of(olderImg)
                            //裁剪
                            //.sourceRegion(Positions.CENTER, 700, 700)
                            //要压缩的图片的宽和高
                            .size(550, 730)
                            .keepAspectRatio(false)
                            //水印的位置；水印路径；压缩比例
                            .watermark(Positions.BOTTOM_RIGHT, ImageIO.read(watermarkImg), 1f)
                            //图片压缩比例
                            .outputQuality(0.9f)
                            .toFile(olderImgRoad);
                } else {
                    Thumbnails.of(olderImg)
                            //裁剪
                            //.sourceRegion(Positions.CENTER, 700, 700)
                            //要压缩的图片的宽和高
                            .size(730, 550)
                            .keepAspectRatio(false)
                            //水印的位置；水印路径；压缩比例
                            .watermark(Positions.BOTTOM_RIGHT, ImageIO.read(watermarkImg), 1f)
                            //图片压缩比例
                            .outputQuality(0.9f)
                            .toFile(olderImgRoad);
                }
            }


            /**
             * scale图片长宽  outputQuality图片质量
             */
            //Thumbnails.of(olderImg).scale(0.5f).outputQuality(0.5f).toFile(newImg);
            /**
             * 指定大小
             */
            //Thumbnails.of(olderImg).size(300, 300).toFile(newImg);
            /**
             * keepAspectRatio(false)按比例
             */
            //Thumbnails.of(olderImg).size(120, 120).keepAspectRatio(false).toFile(newImg);
            /**
             * rotate(角度),正数：顺时针 负数：逆时针
             */
            // Thumbnails.of(olderImg).size(1280, 1024).rotate(90).toFile(newImg);
            /**
             *  watermark(位置，水印图，透明度)
             */

            /**
             * 裁剪
             */
            //  Thumbnails.of(olderImg).sourceRegion(Positions.CENTER, 400, 400).size(200, 200).keepAspectRatio(false).toFile(newImg);
            /**
             * 转换图像格式
             */
            // Thumbnails.of(olderImg).size(1280, 1024).outputFormat("png").toFile(newImg);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            //没用的时候会自动关闭io流
            //java7中实现了AutoCloseable接口的类的对象可以在通过声明在try代码中自动关闭
        }
    }


}
