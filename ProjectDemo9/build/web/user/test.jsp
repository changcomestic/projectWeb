<%-- 
    Document   : test
    Created on : Dec 6, 2019, 1:20:09 PM
    Author     : sonho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
         
        <c:if test="%{#true==true}">
           <input type="checkbox" value="abc"checked> asdasd</input>
        </c:if>
            
            
    </body>
</html>
