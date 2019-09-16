package com.jchenry.myblog.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JwtUtil
 *
 * @Description 生成token的工具
 * @Author jc-henry
 * @Date 2019/09/01 13:29
 * @Version 1.0
 **/
public class JwtUtil {

    /**
     * 过期时间：15分钟
     */
    private static final Long EXPIRE_TIME = 15 * 60 * 1000L;

    /**
     * 选取UUID作为私钥
     */
    private static final String TOKEN_SECRET = "92bb0161bdc6474d93192ba81fdf4846";


    /**
     * 加密token
     *
     * @param username
     * @param userId
     * @return
     */
    public static String sign(String username, String userId) {
        // 过期时间
        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
        // 私钥及加密算法
        Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
        // 设置头部信息
        Map<String, Object> header = new HashMap<>(2);
        header.put("typ", "JWT");
        header.put("alg", "HS256");
        // 附带username,userId信息，生成签名
        try {
            String token = JWT.create()
                    .withHeader(header)
                    .withClaim("loginName", username)
                    .withClaim("userId", userId)
                    .withExpiresAt(date)
                    .sign(algorithm);
            return token;
        } catch (JWTCreationException e) {
            return null;
        }
    }

    /**
     * 校验token
     *
     * 验证成功返回true，失败则返回false
     * 如果签名无效或者无法找到声明要求，将会抛出异常
     * @param token
     * @return
     */
    public static boolean verify(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            return true;
        } catch (JWTVerificationException e) {
            return false;
        }
    }
}
