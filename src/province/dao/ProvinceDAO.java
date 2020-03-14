package province.dao;
import java.sql.Date;
import java.util.List;
import province.pojo.Province;

public interface ProvinceDAO {
		public List<Province> list();
		public Province findProvince(String date,String prov);
		public String request(String httpUrl, String httpArg);
}
