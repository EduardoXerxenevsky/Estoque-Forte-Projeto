<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estoqueforte", "root", "P@$$w0rd");
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
                st.setInt(1, c);
                st.setString(2, n);
                st.setString(3, m);
                st.setDouble(4, p);
                st.executeUpdate();
                out.print("<p style='color:blue;font-size:15px'>Produto cadastrado com sucesso</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color:blue;font-size:15px'>Este produto já está cadastrado</p>");
                } else {
                    out.print("<p style='color:blue;font-size:15px'>Mensagem de erro:" + erro + "</p>");
                }
            }
        %>

    </body>
</html>
