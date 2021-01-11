package com.wondersgroup.commons.utils;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

public class SzDESUtil {


	private static String key = "chiscdc@2018#$%^&";
	private static final String CHARSET = "UTF-8";
	private static final String ALGORITHM = "DES"; // 密钥算法
	private static final String ALGORITHM_STR = "DES/ECB/NoPadding";// 加解密算法/工作模式/填充方式

	private static final String HEX_STRING_MAPPING = "0123456789ABCDEF";

	/**
	 * 加密
	 * 
	 * @param datasource
	 *            byte[]
	 * @param password
	 *            String
	 * @return byte[]
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 * @throws NoSuchPaddingException
	 * @throws BadPaddingException
	 * @throws IllegalBlockSizeException
	 */
	public static String encrypt(String datasource) throws Exception {
		SecureRandom random = new SecureRandom();
		DESKeySpec desKey = new DESKeySpec(pkcs5Pad(key));
		// 创建一个密匙工厂，然后用它把DESKeySpec转换成
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
		SecretKey securekey = keyFactory.generateSecret(desKey);
		// Cipher对象实际完成加密操作
		Cipher cipher = Cipher.getInstance(ALGORITHM_STR);
		// 用密匙初始化Cipher对象
		cipher.init(Cipher.ENCRYPT_MODE, securekey, random);
		// 现在，获取数据并加密
		// 正式执行加密操作
		byte[] bb = cipher.doFinal(pkcs5Pad(datasource));
		return byteArr2HexStr(bb);
	}

	/**
	 * 解密
	 * 
	 * @param src
	 *            byte[]
	 * @param password
	 *            String
	 * @return byte[]
	 * @throws Exception
	 */
	public static String decrypt(String src) throws Exception {
		// DES算法要求有一个可信任的随机数源
		SecureRandom random = new SecureRandom();
		// 创建一个DESKeySpec对象
		DESKeySpec desKey = new DESKeySpec(pkcs5Pad(key));
		// 创建一个密匙工厂
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
		// 将DESKeySpec对象转换成SecretKey对象
		SecretKey securekey = keyFactory.generateSecret(desKey);
		// Cipher对象实际完成解密操作
		Cipher cipher = Cipher.getInstance(ALGORITHM_STR);
		// 用密匙初始化Cipher对象
		cipher.init(Cipher.DECRYPT_MODE, securekey, random);
		// 真正开始解密操作
		byte[] cc = cipher.doFinal(hexStringToBytes(src));
		return (new String(cc, Charset.forName(CHARSET))).trim();
	}

	public static String byteArr2HexStr(byte[] arrB) {
		int iLen = arrB.length;
		// 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];
			// 把负数转换为正数
			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}
			// 小于0F的数需要在前面补0
			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}
	
	public static byte[] hexStr2ByteArr(String strIn) throws Exception {
		byte[] arrB = strIn.getBytes();
		int iLen = arrB.length;

		// 两个字符表示一个字节，所以字节数组长度是字符串长度除以2
		byte[] arrOut = new byte[iLen / 2];
		for (int i = 0; i < iLen; i = i + 2) {
			String strTmp = new String(arrB, i, 2);
			arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
		}
		return arrOut;
	}

	public static byte[] hexStringToBytes(String hexString) {
		if (hexString == null) {
			return null;
		}
		if (hexString.length() <= 0) {
			return new byte[1024];
		}
		hexString = hexString.toUpperCase();
		int length = hexString.length() / 2;
		char[] hexChars = hexString.toCharArray();
		byte[] result = new byte[length];
		for (int i = 0; i < length; i++) {
			int step = i * 2;
			result[i] = (byte) (charToByte(hexChars[step]) << 4 | charToByte(hexChars[step + 1]));
		}
		return result;
	}

	public static byte charToByte(char c) {
		return (byte) HEX_STRING_MAPPING.indexOf(c);
	}

	private static byte[] pkcs5Pad(final String inSouce) {
		byte[] bySource = new byte[1024];
		try {
			bySource = inSouce.getBytes(CHARSET);
			// 密文和密钥的长度必须是8的倍数
			if (0 == bySource.length % 8) {
				return bySource;
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		int length = bySource.length;
		int nPaddedLength = (length / 8 + 1) * 8;
		byte[] byReturn = new byte[nPaddedLength];
		System.arraycopy(bySource, 0, byReturn, 0, length);
		int i = length;
		while (i < nPaddedLength) {
			byReturn[i] = (byte) (nPaddedLength - length);
			i++;
		}
		return byReturn;
	}

	public static void main(String args[]) throws Exception {
		String resStr = "SZSHQQGLY";
		String toStr = SzDESUtil.encrypt(resStr);
		System.out.println(toStr);
		System.out.println(SzDESUtil.decrypt(toStr));
	}

}
