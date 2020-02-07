<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kotsovolos with JSP</title>
</head>
<body>

	<table>
		<tbody>
	<%
	Class.forName("org.sqlite.JDBC");
    Connection conn = DriverManager.getConnection("jdbc:sqlite:/ScrapingDB.db");
    Statement stat = conn.createStatement();

    ResultSet rs = stat.executeQuery("SELECT * FROM products;");
    
    while (rs.next()) {
        out.println("<div>");
        out.println("<div class='top'>");
        
        out.println("<div style='float: center'><h3>" + rs.getString("title") + "</h3>");
        out.println("<p>" + rs.getInt("id") + "</p></div>");
        
        out.println("<div class='price' style='float: right'>");
        if (rs.getString("priceBefore") != "€ 0") {
        	out.println("<div>από <del>" + rs.getString("priceBefore") + "</del></div>");
            out.println("<div style='font-size:150%;'>" + rs.getString("priceActual") + "</div>");
            out.println("<div>κερδίζεις <mark>" + rs.getString("priceSale") + "</mark></div>");
        }
        else {
        	out.println("<div style='font-size:150%;'>" + rs.getString("priceActual") + "</div>");
        }
        out.println("</div></div>");
        
        out.println("<div class='Description' style='float: center'>");
        out.println("<p>Έκδοση Λειτουργικού: <span>" + rs.getString("os") + "</span></p>");
        out.println("<p>Επεξεργαστής: <span>" + rs.getString("cpu") + "</span></p>");
        out.println("<p>Μνήμη RAM: <span>" + rs.getString("ram") + "</span></p>");
        out.println("<p>Μέγεθος Οθόνης: <span>" + rs.getString("size") + "</span></p>");
        out.println("<p>Βασική Κάμερα: <span>" + rs.getString("cam") + "</span></p>");
        out.println("</div><br><br><br><br>");
    }

    rs.close();
    conn.close();
	
	%>
	
	</tbody>
        </table>

</body>
</html>