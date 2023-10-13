<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alteração de produtos</title>
        <link rel="stylesheet" href="../styles/opcao_1.css">
    </head>
    <body>
        <section>
        <%
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estoqueforte", "root", "P@$$w0rd");
            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
            st.setInt(1, c);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("Este produto não foi encontrado");
            } else { //se encontrou o produto
        %>
        <form method="post" action="update.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo") %>"  readonly>
            </p>
            <p>
                <label for="nome">Nome do produto:</label>
                <input type="text" name="nome" id="nome" " value="<%= resultado.getString("nome") %>">
            </p>  
            <p>
                <label for="marca">Marca:</label>
                <input type="text" name="marca" id="marca" value="<%= resultado.getString("marca") %>" >
            </p> 
            <p>
                <label for="preco">Preço:</label>
                <input type="number" step="0.1" name="preco" id="preco" value="<%= resultado.getString("preco") %>" >
            </p>              
            <p>
                <input type="submit" value="Salvar Alterações">   
            </p>
        </form>    
        <%
            }
        %>    
        </section>
    </body>
</html>
