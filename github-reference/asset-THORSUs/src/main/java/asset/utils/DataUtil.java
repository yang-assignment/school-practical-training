package asset.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DataUtil {
    /**
     * 获取当前时间
     *
     * @param dateFormat 时间格式
     * @return
     */
    public static String currentDate(String dateFormat) {
        SimpleDateFormat df = new SimpleDateFormat(dateFormat);
        String date = df.format(new Date());
        return date;
    }
}
