package com.donjomjo.dreamfunding.member.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
		
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {

		return new PasswordAuthentication("dreamfunding001@gmail.com", "asdqwe1!");
		
		
	}

}
