

<!DOCTYPE html>
<html>
<head> 
<title>Busca produtos - Projeto ASP</title>
<style type="text/css">

	#principal {

	width: 1080px;
	height:1118px;
	margin-left:auto;
	margin-right:auto;
	background-color: #EBF4FA;

	
 }
</style>
</head>
<body>
<!-- #include file ="abreConexao.asp" -->
<%
	CriaCon()
	
	Dim Sql
	Dim codigo
	Dim nome
	Dim valor
	dim pesquisa
	dim acao
	dim sqlCat
	
	

  

%>
<div id="principal">

<!-- #include file ="header.asp" -->

<div id= "meio">
	
	<br><br>
	<form action="?acao=pesquisa" method="POST" name="busca">
		 <h3>Produto</h3> <input type ="text" size="30" name="nome" />
		 <br><br>
		 <input type="submit" value="Pesquisar">
	<br>	
	<br>
	<select name="category" >
	<option value="">Categoria:</option>
<%	
	sqlCat = "select CategoryID, CategoryName from Categories order by CategoryName"
	set rsCat = Server.CreateObject("ADODB.Recordset")
	set rsCat  = con.execute(sqlCat)

	While not rsCat.eof 	
	%>

	<option value="<%=rsCat("CategoryID")%>"><%=rsCat("CategoryName")%></option>
	<%

	rsCat.movenext

	WEND
	
%>	
	</select>
</form>



	
	<br>

<%	

'response.write ( Request.QueryString("acao") )
'response.write (  Request.Form ("category") )
acao = Request.QueryString("acao")

nome = Request.Form ("nome")
IF acao = "pesquisa" then
	 
	SQL= "	select P.ProductID, P.ProductName, P.UnitPrice,C.CategoryName "
	SQL = 	SQL & " from Products P "	
	SQL =	SQL & " inner join Categories C on P.CategoryID = C.CategoryID"
	SQL =	SQL & " where ProductName "
	SQL =	SQL & " like '%"&nome&"%' "

	IF Request.Form("category") <> "" then
	 SQL =	SQL & " and C.CategoryID = " & Request.Form("category")
	END IF

	SQL =	SQL & " order by CategoryName"


	Set rs = Server.CreateObject("ADODB.Recordset")
	Set rs = con.execute(SQL)

	'response.write "<h1>" & SQL & "</h1>"
	 
		'Conferir se gerou registro
		
		IF Rs.EOF Then

			Responde.Write "Nenhuma informacao encontrada"
			con.close
			set con = nothing
			rs.close
		Else
		
	
%>
	<!-- Formacao da Tabela -->
	
	<table border=2 bgcolor="#FFFFFF">
		<tr>
			<td>Categoria</td>
			<td>Produto</td>
			<td>Preco</td>
			
		</tr>
<%

    DO UNTIL rs.eof

%>
<tr>
	<td><%=rs("CategoryName")%></td>
	<td><%=rs("ProductName")%></td>
	<td><%=rs("UnitPrice")%></td>
	
</tr>
<%
	rs.movenext
		
	LOOP
	%>
	</table>
<%	

		End If
	
	rs.close
	set rs=nothing
	con.close
	set con=nothing

END IF 

%>

	
</div>

</div>
<!-- #include file ="footer.asp" -->
</body>
</html>
