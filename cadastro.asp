
<!DOCTYPE html>
<html>
<head> 
<title>Cadastro.asp - Projeto ASP</title>
</head>
<body>
<h1>Incluindo...</h1>


<%

Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"

'Criando variaveis...
Dim con
Dim rst
email = Request.Form ("email")
Const adOpenKeyset = 1
Const adLockOptimistic = 3

'Criar objetos e conexao
	
	
	set con = Server.CreateObject("ADODB.Connection")
	con.Open  "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sysmestra;Password=mestrasys;Initial Catalog=treinamento_java;Data Source=192.100.100.59"

	Set rst = Server.CreateObject("ADODB.Recordset")
	




'Verifica email duplicado

	StrUsuario = " SELECT DCEML FROM ASP_USUARIO WHERE DCEML = '"&email&"'" 
	set rs = Server.CreateObject("ADODB.Recordset")

	set rs = con.execute(StrUsuario)

	If not rs.EOF Then
		
		Session ("msg")= "Email ja cadastrado"
		Response.Redirect "formulario.asp"
Else
	'Cria RST baseado na tabela asp_usuario
	rst.Open "SELECT * FROM ASP_USUARIO", con, adOpenKeyset, adLockOptimistic

	'Cria registro
	rst.AddNew

	'Recebe dados do formulario

	rst ("NMUSU")  = Request.Form ("nome")
	rst ("DCEML") = Request.Form ("email")
	rst ("DTNSC") = Request.Form ("nascimento")
	rst ("DCSENUSU")= Request.Form ("senha")
	
	'Salva registros adicionados

	rst.Update	

	Response.Write "Dados cadastrados com sucesso!"
	Response.Redirect "formBusca.asp"


End If  

rst.Close
con.Close




%>


</BODY>
</HTML>