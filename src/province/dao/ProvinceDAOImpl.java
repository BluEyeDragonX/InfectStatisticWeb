package province.dao;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import province.pojo.Province;


public class ProvinceDAOImpl implements ProvinceDAO {
	String httpUrl = "https://api.tianapi.com/txapi/ncovcity/index";
	String key = "key=b3388274f660026ea40ee459bab1f4b1";
	
	public List<Province> list() {
		String jsonResult = request(httpUrl,key);
		List<Province> list=new ArrayList<Province>();
		
		Pattern p = Pattern.compile("\"provinceShortName\":\".*?\"locationId\":.*?,\"");
		Pattern psn = Pattern.compile("(\"provinceShortName\":\")([\\u4E00-\\u9FA5]*)");
		Pattern ccf = Pattern.compile("(currentConfirmedCount\":)([0-9]+)");
		Pattern cf = Pattern.compile("(confirmedCount\":)([0-9]+)");
		Pattern sc = Pattern.compile("(suspectedCount\":)([0-9]+)");
		Pattern cc = Pattern.compile("(curedCount\":)([0-9]+)");
		Pattern dc = Pattern.compile("(deadCount\":)([0-9]+)");
		
		Matcher m = p.matcher(jsonResult);  
		while(m.find()){
			Province province =new Province();
			
			Matcher m2 = psn.matcher(m.group());
			while(m2.find()) {
				province.setName(m2.group(2));
			}
			
			m2 = ccf.matcher(m.group());
			while(m2.find()) {
				province.setCurrentConfirmed(Integer.parseInt(m2.group(2)));
			}
			
			m2 = cf.matcher(m.group());
			while(m2.find()) {
				province.setConfirmed(Integer.parseInt(m2.group(2)));
			}
			
			m2 = sc.matcher(m.group());
			while(m2.find()) {
				province.setSuspected(Integer.parseInt(m2.group(2)));
			}
			
			m2 = cc.matcher(m.group());
			while(m2.find()) {
				province.setCured(Integer.parseInt(m2.group(2)));
			}
			
			m2 = dc.matcher(m.group());
			while(m2.find()) {
				province.setDead(Integer.parseInt(m2.group(2)));
			}
			
        	list.add(province);
		}

		return list;
	}
	
	public Province findProvince(String date,String prov) {
		String jsonResult = request(httpUrl,key + "&" + date);
		
		Province province =new Province();
		Pattern p = Pattern.compile("\"provinceShortName\":\"" + prov + ".*?\"locationId\":.*?,\"");
		Pattern psn = Pattern.compile("(\"provinceShortName\":\")([\\u4E00-\\u9FA5]*)");
		Pattern ccf = Pattern.compile("(currentConfirmedCount\":)([0-9]+)");
		Pattern cf = Pattern.compile("(confirmedCount\":)([0-9]+)");
		Pattern sc = Pattern.compile("(suspectedCount\":)([0-9]+)");
		Pattern cc = Pattern.compile("(curedCount\":)([0-9]+)");
		Pattern dc = Pattern.compile("(deadCount\":)([0-9]+)");
		
		Matcher m = p.matcher(jsonResult);  
		while(m.find()){
			
			Matcher m2 = psn.matcher(m.group());
			while(m2.find()) {
				province.setName(m2.group(2));
			}
			
			m2 = ccf.matcher(m.group());
			while(m2.find()) {
				province.setCurrentConfirmed(Integer.parseInt(m2.group(2)));
			}
			
			m2 = cf.matcher(m.group());
			while(m2.find()) {
				province.setConfirmed(Integer.parseInt(m2.group(2)));
			}
			
			m2 = sc.matcher(m.group());
			while(m2.find()) {
				province.setSuspected(Integer.parseInt(m2.group(2)));
			}
			
			m2 = cc.matcher(m.group());
			while(m2.find()) {
				province.setCured(Integer.parseInt(m2.group(2)));
			}
			
			m2 = dc.matcher(m.group());
			while(m2.find()) {
				province.setDead(Integer.parseInt(m2.group(2)));
			}
		}

		return province;
	}
	
	
    public String request(String httpUrl, String httpArg) {
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?" + httpArg;

	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
    
}
