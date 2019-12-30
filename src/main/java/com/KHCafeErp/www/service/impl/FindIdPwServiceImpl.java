package com.KHCafeErp.www.service.impl;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

import com.KHCafeErp.www.dao.face.FindIdPwDao;
import com.KHCafeErp.www.dto.Staff;
import com.KHCafeErp.www.service.face.FindIdPwService;

@Service
public class FindIdPwServiceImpl implements FindIdPwService{

	
	@Autowired 
				FindIdPwDao findidpwDao;
	private SqlSessionTemplate sqlSession;


         
		//아이디 찾는 메서드
	@Override
	public Staff findid(Staff staff) {
		
		Staff findidResult =findidpwDao.findid(staff);
		return findidResult;


		
	}

		// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}
	



		// 패스워드 찾기 이메일 발송
		public void mailSendWithPassword(int staffNo, String email, HttpServletRequest request) {
			// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
			String key = getKey(false, 6);
			
			findidpwDao.getKey(staffNo, key);
			MimeMessage mail = MailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요"
					+ "<p> 임시 비밀번호를 발급해드렸습니다.</p>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key 
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(user_email));
				MailSender.send(mail);
			} catch (MessagingException e) { 
				e.printStackTrace();
			}
			
			// 비밀번호 암호화해주는 메서드
			findidpwDao.searchPassword(staffNo, email, key);
			
		}

	
	

}
