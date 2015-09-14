package com.zjlh.villa.service.util;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;









import com.zjlh.villa.dao.MemberDaoHibernate4;
import com.zjlh.villa.entity.Member;
import com.zjlh.villa.entity.weixin.menu.Button;
import com.zjlh.villa.entity.weixin.menu.ClickButton;
import com.zjlh.villa.entity.weixin.menu.Menu;
import com.zjlh.villa.entity.weixin.menu.ViewButton;
import com.zjlh.villa.entity.weixin.po.AccessToken;
import com.zjlh.villa.entity.weixin.trans.Data;
import com.zjlh.villa.entity.weixin.trans.Parts;
import com.zjlh.villa.entity.weixin.trans.Symbols;
import com.zjlh.villa.entity.weixin.trans.TransResult;

/**
 * 微信工具类
 * @author Stephen
 *
 */
@Service
public class WeixinUtilService {
	private static final String APPID = "wxdbc2bbdebe5808ab";
	private static final String APPSECRET = "7a03c6d27be77cfa57261f5b004b58b5";
	
	private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	
	private static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	
	private static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	private static final String QUERY_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	
	private static final String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
	
	private static final String GET_MEMBER_INFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	private static final String AUTHOR_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
		
	private static final String LOG_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
	private static final AccessToken ACCESS_TOKEN = new AccessToken();
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private MemberDaoHibernate4 memberDao;

	
	/**
	 * get请求
	 * @param url
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	@SuppressWarnings("deprecation")
	public static JSONObject doGetStr(String url) throws ParseException, IOException{
		DefaultHttpClient client = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(url);
		JSONObject jsonObject = null;
		HttpResponse httpResponse = client.execute(httpGet);
		HttpEntity entity = httpResponse.getEntity();
		if(entity != null){
			String result = EntityUtils.toString(entity,"UTF-8");
			jsonObject = JSONObject.fromObject(result);
		}
		return jsonObject;
	}
	
	/**
	 * POST请求
	 * @param url
	 * @param outStr
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public static JSONObject doPostStr(String url,String outStr) throws ParseException, IOException{
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost(url);
		JSONObject jsonObject = null;
		httpost.setEntity(new StringEntity(outStr,"UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(),"UTF-8");
		jsonObject = JSONObject.fromObject(result);
		return jsonObject;
	}
	
	/**
	 * POST 接受XML返回
	 */
	
	
	public static String post(String url,String outStr) throws ParseException, IOException{
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost(url);
		JSONObject jsonObject = null;
		httpost.setEntity(new StringEntity(outStr,"UTF-8"));
		HttpResponse response = client.execute(httpost);
		String result = EntityUtils.toString(response.getEntity(),"UTF-8");
		return result;
	}
	
	
	
	/**
	 * 文件上传
	 * @param filePath
	 * @param accessToken
	 * @param type
	 * @return
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchProviderException
	 * @throws KeyManagementException
	 */
	public static String upload(String filePath, String accessToken,String type) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {
		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			throw new IOException("文件不存在");
		}

		String url = UPLOAD_URL.replace("ACCESS_TOKEN", accessToken).replace("TYPE",type);
		
		URL urlObj = new URL(url);
		//连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		con.setRequestMethod("POST"); 
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false); 

		//设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		//设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		//获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		//输出表头
		out.write(head);

		//文件正文部分
		//把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		//结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");//定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		String result = null;
		try {
			//定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				reader.close();
			}
		}

		JSONObject jsonObj = JSONObject.fromObject(result);
		System.out.println(jsonObj);
		String typeName = "media_id";
		if(!"image".equals(type)){
			typeName = type + "_media_id";
		}
		String mediaId = jsonObj.getString(typeName);
		return mediaId;
	}
	
	/**
	 * 获取accessToken
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public static String getAccessToken() throws ParseException, IOException{
		Long now = new Date().getTime();
		System.out.println("now = "+now);
		
		Long ExpiresTime = ACCESS_TOKEN.getExpiresTime();
		
		
		
		if (null == ACCESS_TOKEN.getToken() || now > ExpiresTime) {
			
System.out.println("token 不存在或已过期...");
			
			String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
			JSONObject jsonObject = doGetStr(url);
			if(jsonObject!=null){
				ACCESS_TOKEN.setToken(jsonObject.getString("access_token"));
				ACCESS_TOKEN.setExpiresTime(now+jsonObject.getInt("expires_in")-200);//将失效时间设置为当前时间+token有效时间-200秒
				System.out.println("ExpiresTime = "+ACCESS_TOKEN.getExpiresTime());
			}

		}
		System.out.println("token = "+ACCESS_TOKEN.getToken());
		return ACCESS_TOKEN.getToken();
	}
	
	/**
	 * 获取用户基本信息
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public Member getMemberInfo(String openid,String token) throws ParseException, IOException {

		String url = GET_MEMBER_INFO_URL.replace("ACCESS_TOKEN", token).replace("OPENID", openid);
		JSONObject jsonObject = doGetStr(url);
		
System.out.println("return json = "+jsonObject.toString());
		
		int subscribe = jsonObject.getInt("subscribe");
		String nickname = jsonObject.getString("nickname");
		Integer sex = jsonObject.getInt("sex");
		String city = jsonObject.getString("city");
		String country = jsonObject.getString("country");
		String province = jsonObject.getString("province");
		String language = jsonObject.getString("language");
		String headimgurl = jsonObject.getString("headimgurl");
System.out.println("subscribeTime="+jsonObject.getInt("subscribe_time"));		
		Timestamp ts = new Timestamp(jsonObject.getInt("subscribe_time"));  
		
		Date subscribeTime = ts;
System.out.println(subscribeTime);		

		String remark = jsonObject.getString("remark");
	
		
		Member member = new Member(openid, nickname, sex, city, country, province, language, headimgurl, subscribe, subscribeTime, remark, null, null, null, null, 1);
		Member member2 = memberDao.get(Member.class, "openid", openid);//查询数据库看该用户是否存在
		
		if (member2==null) {
			memberDao.save(member);//保存新用户
			return memberDao.get(Member.class, "openid", openid);//从数据库里查询出带ID的用户信息并返回
		}else {
			member2.setSubscribe(1);
			memberDao.update(member2);
			return member2;
		}

		
		
	}

	
	

	
	
	/**
	 * 组装菜单
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public static Menu initMenu() throws UnsupportedEncodingException{
		String secound_redirect = java.net.URLEncoder.encode("http://gmcfe.tunnel.mobi/villa/mobile/index","UTF-8");
		String redirect_url = java.net.URLEncoder.encode("http://gmcfe.tunnel.mobi/villa/weixin/login?rd="+secound_redirect, "UTF-8");
		String btn1url = AUTHOR_URL.replace("APPID", APPID).replace("SCOPE", "snsapi_userinfo").replace("REDIRECT_URI", redirect_url);
		
		
		Menu menu = new Menu();
		ViewButton button11 = new ViewButton();
		button11.setName("别墅预定");
		button11.setType("view");
		button11.setUrl(btn1url);
		
		
		
		
		ViewButton button21 = new ViewButton();
		button21.setName("精品民宿");
		button21.setType("view");
		button21.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		ViewButton button22 = new ViewButton();
		button22.setName("玩够露营");
		button22.setType("view");
		button22.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		Button button2 = new Button();
		button2.setName("名宿露营");
		button2.setSub_button(new Button[]{button21,button22});
		
		
		
		
		
		ViewButton button31 = new ViewButton();
		button31.setName("生日惊喜");
		button31.setType("view");
		button31.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		ViewButton button32 = new ViewButton();
		button32.setName("玩够客服");
		button32.setType("view");
		button32.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		ViewButton button33 = new ViewButton();
		button33.setName("玩够论坛");
		button33.setType("view");
		button33.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		ViewButton button34 = new ViewButton();
		button34.setName("在线商城");
		button34.setType("view");
		button34.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		ViewButton button35 = new ViewButton();
		button35.setName("商务合作");
		button35.setType("view");
		button35.setUrl("http://mp.weixin.qq.com/s?__biz=MzA3MjYxMzM4OQ==&mid=204650158&idx=1&sn=d52bd293a3379938ab1358f3024348ca&scene=18#wechat_redirect");
		
		Button button3 = new Button();
		button3.setName("玩够客服");
		button3.setSub_button(new Button[]{button31,button32,button33,button34,button35});
		
		menu.setButton(new Button[]{button11,button2,button3});
		return menu;                  
	}
	
	public static int createMenu(String token,String menu) throws ParseException, IOException{
		int result = 0;
		String url = CREATE_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doPostStr(url, menu);
		if(jsonObject != null){
			result = jsonObject.getInt("errcode");
		}
		return result;
	}
	
	public static JSONObject queryMenu(String token) throws ParseException, IOException{
		String url = QUERY_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doGetStr(url);
		return jsonObject;
	}
	
	public static int deleteMenu(String token) throws ParseException, IOException{
		String url = DELETE_MENU_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = doGetStr(url);
		int result = 0;
		if(jsonObject != null){
			result = jsonObject.getInt("errcode");
		}
		return result;
	}
	
	public static String translate(String source) throws ParseException, IOException{
		String url = "http://openapi.baidu.com/public/2.0/translate/dict/simple?client_id=jNg0LPSBe691Il0CG5MwDupw&q=KEYWORD&from=auto&to=auto";
		url = url.replace("KEYWORD", URLEncoder.encode(source, "UTF-8"));
		JSONObject jsonObject = doGetStr(url);
		String errno = jsonObject.getString("errno");
		Object obj = jsonObject.get("data");
		StringBuffer dst = new StringBuffer();
		if("0".equals(errno) && !"[]".equals(obj.toString())){
			TransResult transResult = (TransResult) JSONObject.toBean(jsonObject, TransResult.class);
			Data data = transResult.getData();
			Symbols symbols = data.getSymbols()[0];
			String phzh = symbols.getPh_zh()==null ? "" : "中文拼音："+symbols.getPh_zh()+"\n";
			String phen = symbols.getPh_en()==null ? "" : "英式英标："+symbols.getPh_en()+"\n";
			String pham = symbols.getPh_am()==null ? "" : "美式英标："+symbols.getPh_am()+"\n";
			dst.append(phzh+phen+pham);
			
			Parts[] parts = symbols.getParts();
			String pat = null;
			for(Parts part : parts){
				pat = (part.getPart()!=null && !"".equals(part.getPart())) ? "["+part.getPart()+"]" : "";
				String[] means = part.getMeans();
				dst.append(pat);
				for(String mean : means){
					dst.append(mean+";");
				}
			}
		}else{
			dst.append(translateFull(source));
		}
		return dst.toString();
	}
	
	@SuppressWarnings("unchecked")
	public static String translateFull(String source) throws ParseException, IOException{
		String url = "http://openapi.baidu.com/public/2.0/bmt/translate?client_id=jNg0LPSBe691Il0CG5MwDupw&q=KEYWORD&from=auto&to=auto";
		url = url.replace("KEYWORD", URLEncoder.encode(source, "UTF-8"));
		JSONObject jsonObject = doGetStr(url);
		StringBuffer dst = new StringBuffer();
		List<Map> list = (List<Map>) jsonObject.get("trans_result");
		for(Map map : list){
			dst.append(map.get("dst"));
		}
		return dst.toString();
	}
	
	public static void main(String args[]) throws ParseException, IOException{
		getAccessToken();
	}

	public void unSubscribe(String openid) {
		Member member = memberDao.get(Member.class, "openid", openid);
		member.setSubscribe(0);
		memberDao.update(member);
	}
	
	public Member login(String code) throws ParseException, IOException {
		
		String url = LOG_ACCESS_TOKEN_URL.replace("APPID", APPID).replace("SECRET", APPSECRET).replace("CODE", code);
		JSONObject object = doGetStr(url);
		
		System.out.println(object);
		
		String openid = object.getString("openid");
		
		Member menber = memberDao.get(Member.class, "openid", openid);
		
		return menber;
		
	}
	
	

	
	
}
