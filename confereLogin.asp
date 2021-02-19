
<!DOCTYPE html>
<html>
<head> 
<title>Projeto ASP</title>
</head>
<body>
<h1>Incluindo...</h1>
<!-- #include file ="abreConexao.asp" -->
<%

Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"

'Criando variaveis...
CriaCon()
Dim rst
email = Request.Form ("email")
senha = Request.Form ("senha")
Const adOpenKeyset = 1
Const adLockOptimistic = 3

'Criar objetos e conexao


	Set rst = Server.CreateObject("ADODB.Recordset")
	



'Verifica login

	StrLogin = " SELECT DCEML, DCSENUSU FROM ASP_USUARIO WHERE DCEML = '"&email&"' and DCSENUSU = '"&senha&"'" 
	set rst = Server.CreateObject("ADODB.Recordset")
	set rst = con.execute(StrLogin)
	
	'response.write StrLogin
	'response.end

	If not rst.EOF Then
		
		Response.Write "Logado com sucesso"
		Response.Redirect "formBusca.asp"
	
		
	Else
		Session ("msg")= "Usuario e/ou senha incorreto"
		Response.Redirect "index.asp"


	End If  

	rst.Close
	con.Close




%>


</BODY>
</HTML>