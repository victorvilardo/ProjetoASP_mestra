
<%

'abre conexao banco de dados 
Dim con
Sub CriaCon()
	set con = Server.CreateObject("ADODB.Connection")
	con.Open  "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sysmestra;Password=mestrasys;Initial Catalog=treinamento_java;Data Source=192.100.100.59"
End Sub

%>