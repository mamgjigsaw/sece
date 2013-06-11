<%-- 
    Document   : reCaptcha
    Created on : Nov 23, 2012, 10:25:25 PM
    Author     : mamg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post">
        <%
          ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LdZg9kSAAAAAEXVT_nfv-kR_DZ7twTYtTzpO__B ", "6LdZg9kSAAAAAM-ymEtUjt2yerNYGrEaRV9WUat3", false);
          out.print(c.createRecaptchaHtml(null, null));
        %>
        <input type="submit" value="submit" />
        </form>
      </body>

</html>