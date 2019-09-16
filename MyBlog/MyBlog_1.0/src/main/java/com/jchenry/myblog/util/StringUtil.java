package com.jchenry.myblog.util;

import com.jchenry.myblog.dto.Msg;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * StringUtil
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/22 11:21
 * @Version 1.0
 **/
public class StringUtil {

    // 非法字符过滤
    private static final String illegalCharFilter = "[`~!@#$%^&*()+=|{}':;',\\[\\]" +
            ".<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";

    public static boolean isEmpty(String input) {
        return input == null || input.trim().length() == 0;
    }

    public static String getSuffix(String input) {
        return getSuffix(input, ".");
    }

    public static String getSuffix(String input, String separator) {
        if (input.lastIndexOf(separator) != -1) {
            return input.substring(input.lastIndexOf(separator));
        }
        return "";
    }

    public static boolean containsChars(String input){
        Pattern pattern = Pattern.compile(illegalCharFilter);
        Matcher matcher = pattern.matcher(input);
        return matcher.find();
    }

    public static boolean composedOfOneChar(String typeName) {
        char[] chars = typeName.toCharArray();
        char temp = chars[0];
        for (int i = 1; i < chars.length; i++) {
            if (temp != chars[i])
                return false;
        }
        return true;
    }
}
