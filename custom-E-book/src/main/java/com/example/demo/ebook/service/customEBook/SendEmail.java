package com.example.demo.ebook.service.customEBook;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.example.demo.ebook.model.payment.Payment;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

public class SendEmail {
  public SendEmail(Payment payment,String filename){
  final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
  // Get a Properties object
     Properties props = System.getProperties();
     props.setProperty("mail.smtp.host", "smtp.gmail.com");
     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
     props.setProperty("mail.smtp.socketFactory.fallback", "false");
     props.setProperty("mail.smtp.port", "465");
     props.setProperty("mail.smtp.socketFactory.port", "465");
     props.put("mail.smtp.auth", "true");
     props.put("mail.debug", "true");
     props.put("mail.store.protocol", "pop3");
     props.put("mail.transport.protocol", "smtp");
     final String username = "customebook2018@gmail.com";//
     final String password = "customebook!";
     try{
         Session session = Session.getDefaultInstance(props, 
                              new Authenticator(){
                                 protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(username, password);
                                 }});

       // -- Create a new message --
         Message msg = new MimeMessage(session);

      // -- Set the FROM and TO fields --
         msg.setFrom(new InternetAddress("kundaliya96@gmail.com"));
         msg.setRecipients(Message.RecipientType.TO, 
                          InternetAddress.parse("kundaliya96@gmail.com",false));
         msg.setSubject("Book purchased: "+payment.getTitle());
       
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setText("Hola! You've purchased your custom-ebook worth Rs"+payment.getPrice()+".Thanks for Shopping!!");
         Multipart multipart = new MimeMultipart();

         // Set text message part
         multipart.addBodyPart(messageBodyPart);

         // Part two is attachment
         messageBodyPart = new MimeBodyPart();
         DataSource source = new FileDataSource(filename);
         messageBodyPart.setDataHandler(new DataHandler(source));
         messageBodyPart.setFileName(payment.getTitle());
         multipart.addBodyPart(messageBodyPart);

         // Send the complete message parts
         msg.setContent(multipart);

         msg.setSentDate(new Date());
         Transport.send(msg);
         System.out.println("Message sent.");
      }catch (MessagingException e){ System.out.println("Erreur d'envoi, cause: " + e);}
      }
}
