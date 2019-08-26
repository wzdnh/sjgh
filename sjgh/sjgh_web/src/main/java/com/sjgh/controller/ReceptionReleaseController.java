package com.sjgh.controller;

import com.sjgh.entity.AgentEvent;
import com.sjgh.entity.LostAndFound;
import com.sjgh.entity.TransactionOfThings;
import com.sjgh.entity.User;
import com.sjgh.global.Content;
import com.sjgh.services.AgentEventServices;
import com.sjgh.services.LostAndFoundServices;
import com.sjgh.services.OfficialPictureServices;
import com.sjgh.services.TransactionOfThingsServices;
import com.sjgh.util.PictureCompression;
import com.sjgh.util.PictureUploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

/**
 * 用户页面之
 * 信息发布页面
 *
 * 此功能用户必须登录才可进行
 *
 * */

@Controller("receptionRelease")
@RequestMapping("/release")
public class ReceptionReleaseController {

    @Autowired
    AgentEventServices agentEventServices;
    @Autowired
    LostAndFoundServices lostAndFoundServices;
    @Autowired
    TransactionOfThingsServices transactionOfThingsServices;
    @Autowired
    OfficialPictureServices officialPictureServices;

    //去添加
    @RequestMapping("/to_add")
    public String toAdd(Map<String, Object> map){
        map.put("agentEvent", new AgentEvent());
        //此处放着做权限校验
        return "/reception/release_jobs";
    }

    //事件代办添加控制器
    @ResponseBody
    @RequestMapping(value = "/sjdb_add", produces="application/json;charset=utf-8")
    public String sjdbAdd(@RequestParam(value ="img", required = false) MultipartFile file,
                      @RequestParam(value = "event_tags", required = false) String event_tags,
                      @RequestParam(value = "price", required = false) Integer price,
                      @RequestParam(value = "authentication", required = false ) Integer authentication,
                      @RequestParam(value = "deposit", required = false ) Integer deposit,
                      @RequestParam(value = "event_describe", required = false ) String event_describe,
                      OutputStream os,
                      HttpSession session) throws IOException {
        //System.out.println("event_tags = [" + event_tags + "], price = [" + price + "], authentication = [" + authentication + "], deposit = [" + deposit + "], event_describe = [" + event_describe + "], os = [" + os + "]");

        //从session中获取user的信息
        User user = (User)session.getAttribute("user");
        AgentEvent agentEvent = new AgentEvent();

        //如果price为空，则重置为0
        if(price == null){
            price = 0;
            System.out.println("============" + price);
        }

        /**使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        //图片不为空时，才执行图片的相关操作
        if(!file.isEmpty()){
            PictureUploadUtils pictureUploadUtils = new PictureUploadUtils();
            //完成上传功能
            List list = pictureUploadUtils.upload(file, "\\emoticon");
            //将工具类返回的真实路径赋值给road
            String road = (String)list.get(0);
            agentEvent.setRoad(road);

            PictureCompression pictureCompression = new PictureCompression();
            //将图片进行压缩，添加水印
            pictureCompression.googleCompress((String)list.get(1), Content.WaterMarkImgRoad);
            //System.out.println("==================" + list.get(1));
        }else {
            //如果用户没有上传图片，就会使用我们的默认图片
            if (event_tags.equals("代取快递")){
                agentEvent.setRoad(officialPictureServices.getRoad(Content.SJDB_dai_qu_kuai_di_ID));
            }else if (event_tags.equals("辅助学习")){
                agentEvent.setRoad(officialPictureServices.getRoad(Content.SJDB_fu_zhu_xue_xi_ID));
            }else if (event_tags.equals("代跑腿")){
                agentEvent.setRoad(officialPictureServices.getRoad(Content.SJDB_dai_pao_tui_ID));
            }
        }

        agentEvent.setDeposit(deposit);
        agentEvent.setAuthentication(authentication);
        agentEvent.setEvent_tags(event_tags);
        agentEvent.setEvent_describe(event_describe);
        agentEvent.setPrice(price);

        agentEvent.setSchool_id(user.getSchool_id());
        agentEvent.setUser_id(user.getUser_id());
        //agentEvent.setUsername(user.getUser_name());
        //执行业务
        agentEventServices.add(agentEvent);
        System.out.println("===============" + officialPictureServices.getRoad(Content.SJDB_dai_qu_kuai_di_ID));
        os.write("1".getBytes("UTF-8"));
        return null;

    }

    //失物招领添加处理
    @ResponseBody
    @RequestMapping(value = "/swzl_add", produces="application/json;charset=utf-8")
    public String swzlAdd(@RequestParam(value ="img", required = false) MultipartFile file,
                      @RequestParam(value = "event_tags", required = false) String event_tags,
                      @RequestParam(value = "free", required = false) int free,
                      @RequestParam(value = "goods", required = false) String goods,
                      @RequestParam(value = "event_describe", required = false ) String event_describe,
                      OutputStream os,
                      HttpSession session) throws IOException {
        User user = (User)session.getAttribute("user");
        LostAndFound lostAndFound = new LostAndFound();

        /**使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        //图片不为空时，才执行图片的相关操作
        if(!file.isEmpty()){
            PictureUploadUtils pictureUploadUtils = new PictureUploadUtils();
            //完成上传功能
            List list = pictureUploadUtils.upload(file, "\\emoticon");
            //将工具类返回的真实路径赋值给road
            String road = (String)list.get(0);
            lostAndFound.setRoad(road);

            PictureCompression pictureCompression = new PictureCompression();
            //将图片进行压缩，添加水印
            pictureCompression.googleCompress((String)list.get(1), Content.WaterMarkImgRoad);
            //System.out.println("==================" + list.get(1));
        }else{
            //图片为空时，使用系统默认的图片
            lostAndFound.setRoad(officialPictureServices.getRoad(Content.SWZL_mo_ren_ID));
        }

        lostAndFound.setSchool_id(user.getSchool_id());
        lostAndFound.setUser_id(user.getUser_id());
        //lostAndFound.setUsername(user.getUser_name());
        lostAndFound.setEvent_tags(event_tags);
        lostAndFound.setFree(free);
        lostAndFound.setEvent_describe(event_describe);
        lostAndFound.setGoods(goods);

        //System.out.println("file = [" + file + "], event_tags = [" + event_tags + "], free = [" + free + "], goods = [" + goods + "], event_describe = [" + event_describe + "], os = [" + os + "], session = [" + session + "]");

        lostAndFoundServices.add(lostAndFound);
        os.write("1".getBytes("UTF-8"));

        return null;
    }


    //事物交易添加处理
    @ResponseBody
    @RequestMapping(value = "/swjy_add", produces="application/json;charset=utf-8")
    public String swjyAdd(@RequestParam(value ="img", required = false) MultipartFile file,
                          @RequestParam(value = "event_tags", required = false) String event_tags,
                          @RequestParam(value = "price", required = false) Integer price,
                          @RequestParam(value = "event_describe", required = false ) String event_describe,
                          OutputStream os,
                          HttpSession session) throws IOException {

        if(price == null){
            price = 0;
        }
        TransactionOfThings transactionOfThings = new TransactionOfThings();
        User user = (User)session.getAttribute("user");

        /**使用图片上传工具类
         *直接返回图片上传到服务器后的真实位置
         *
         * */
        //图片不为空时，才执行图片的相关操作
        if(!file.isEmpty()){
            PictureUploadUtils pictureUploadUtils = new PictureUploadUtils();
            //完成上传功能
            List list = pictureUploadUtils.upload(file, "\\emoticon");
            //将工具类返回的真实路径赋值给road
            String road = (String)list.get(0);
            transactionOfThings.setRoad(road);

            PictureCompression pictureCompression = new PictureCompression();
            //将图片进行压缩，添加水印
            pictureCompression.googleCompress((String)list.get(1), Content.WaterMarkImgRoad);
            //System.out.println("==================" + list.get(1));
        }else{
            //图片为空时，使用系统默认的图片
            transactionOfThings.setRoad(officialPictureServices.getRoad(Content.SWJY_mo_ren_ID));
        }

        transactionOfThings.setUser_id(user.getUser_id());
        transactionOfThings.setSchool_id(user.getSchool_id());
        transactionOfThings.setEvent_tags(event_tags);
        transactionOfThings.setPrice(price);
        transactionOfThings.setEvent_describe(event_describe);

        transactionOfThingsServices.add(transactionOfThings);

        //System.out.println("file = [" + file + "], event_tags = [" + event_tags + "], price = [" + price + "], event_describe = [" + event_describe + "], os = [" + os + "], session = [" + session + "]");
        return null;
    }

}
