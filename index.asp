<html>
<head>
<title>Login</title>

<style type="text/css">
	h1{color:red;}
	input{margin-left:10px;}
	fieldset {
		display: block;
		width: 40%;
		float:left;
 }
</style>

<script language="javascript" type="text/javascript">




function validar() {
var usuario = form1.usuario.value;
var senha = form1.senha.value;



if (usuario == "") {
alert('Preencha o seu usuario');
form1.usario.focus();
return false;
}

if (senha == "") {
alert('Preencha sua senha"');
form1.senha.focus();
return false;
}


if (senha != rep_senha) {
alert('Senhas diferentes!');
form1.senha.focus();
return false;
}
}
</script>
</head>
<body>

<h1> Northwind</h1>


<form name="form1" action="confereLogin.asp" method="post">
<fieldset>
Usuario:
<input name="email" size = 40 type="text"><br /><br />
Senha:
<input name="senha" size = 40 type="password"><br /><br />
<input type="submit" value ="Entrar" onclick="return validar()">
<br>
<br>
<a href="formulario.asp"> Novo usuario</a>
<br>
<a href="">Esqueci senha</a>
</fieldset>
</form>
</body>
</html>
