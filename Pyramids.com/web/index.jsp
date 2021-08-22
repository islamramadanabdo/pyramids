<%-- 
    Document   : home
    Created on : Jan 5, 2021, 5:26:18 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <style>
            .engine{
                padding:15px;
                height: 65px;
                margin-top: 80px;
                background: #CCCCCC;
                text-align: center;
            }
            input , select , button{
                padding:7px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <form action="resultofsearch.jsp" class="engine" method="post">
            <label>Where you going:</label>
            <input type="text" id="going" name="going">
            <label>Check in:</label>
            <input type="date" id="Checkin" name="Checkin">
            <label>Check out:</label>
            <input type="date" id="Checkout" name="Checkout">

            <label>Adults: </label>
            <select name="adults" id="adults">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
            </select>

            <label>Children: </label>
            <select name="Children" id="Children">
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
            </select>

            <button type="submit">Search</button>
        </form>

       <jsp:include page="load-hotel.jsp" />
        
    </body>
</html>
