<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produtos</title>
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
           try{
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estoqueforte", "root", "P@$$w0rd");
            st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, preco = ? WHERE codigo = ?");
            st.setString(1, n);
            st.setString(2, m);
            st.setDouble(3, p);
            st.setInt(4, c);
            st.executeUpdate();
            out.print("Os dados do produto " + c + " foram alterados com sucesso");
       } catch (Exception erro){
          out.print ("Entre em contato com o suporte e informe o erro " + erro.getMessage());
       }
%>    
    </body>
</html>
