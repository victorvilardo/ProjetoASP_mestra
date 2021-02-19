<html>
<head>
<title>Cadastro</title>

<style type="text/css">
	h1{color:red;}
	input{margin-left:10px;}
	fieldset {
		display: block;
		width: 45%;
		float:left;
	
 }
</style>

<script language="javascript" type="text/javascript">


function mascaraData(){

var nascimento= form1.nascimento.value;
   if(nascimento.length==2){
   nascimento= form1.nascimento.value = nascimento +'/';
     }
   else if (nascimento.length==5){
    nascimento= form1.nascimento.value = nascimento +'/';
   }
}
   
function validar() {
var nome = form1.nome.value;
var email = form1.email.value;
var senha = form1.senha.value;
var rep_senha = form1.rep_senha.value;
var nascimento= form1.nascimento.value;


if ((nome == "") || (nome.length <10)) {
alert('Preencha o seu nome completo');
form1.nome.focus();
return false;
}

if ((email == "") || (email.indexOf ("@")== -1 ) )  {
alert('Preencha seu email corretamente');
form1.email.focus();
return false;
}

if (nascimento == "") {
alert('Preencha sua data de nascimento!');
form1.senha.focus();
return false;
}

if (senha == "") {
alert('Preencha sua senha"');
form1.senha.focus();
return false;
}

if (senha.length <12){
alert('Sua senha deve conter pelo menos 12 caracteres!"');
form1.senha.focus();
return false;
}

if ((rep_senha == "") ||  (rep_senha.length<12)) {
alert('Repita sua senha!');
form1.rep_senha.focus();
return false;
}

if (senha != rep_senha) {
alert('Senhas diferentes!');
form1.senha.focus();
return false;
}
return true;
}
</script>
</head>
<body>

<h1> Northwind</h1>

<form name="form1" action="cadastro.asp" method="post" onsubmit="return validar()">
<fieldset>
<label class cadastroLabel>Nome:</label>
<input name="nome" maxlength= "50" size = 40 type="text" ><br /><br />
<label class cadastroLabel>Email:</label>
<input name="email" size = 40 type="text"><br /><br />
<label class cadastroLabel>Nascimento:</label>
<input name="nascimento" maxlength="10" onkeypress="mascaraData()" id = "date" size = 40 type="text"><br /><br />
<label class cadastroLabel>Senha:</label>
<input name="senha" size = 40 type="password"><br /><br />
<label class cadastroLabel>Repitir Senha:</label>
<input name="rep_senha" size = 40 type="password"><br /><br />
<input type="submit">
</fieldset>
</form>
</body>
</html>
