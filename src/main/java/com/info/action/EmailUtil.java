package com.info.action;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {
	public static void sendEmail(String recipientEmail, String otp) throws MessagingException {
        // SMTP server configuration
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "sandbox.smtp.mailtrap.io");
        properties.put("mail.smtp.port", "2525");
        properties.put("mail.smtp.auth", "true");

        // SMTP authentication credentials
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("5ac5ce87859a6f", "89fb86a044d25d");
            }
        };

        // Create a session with SMTP server
        Session session = Session.getInstance(properties, authenticator);

        // Create an email message
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("no-reply@buddhadp.com"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
        message.setSubject("Password Reset OTP");
        message.setText("Your OTP for password reset is: " + otp);

        // Send the email
        Transport.send(message);
    }
}
