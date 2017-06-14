package controller;

public class ExibeMensagem {
	
	private String msg = "";
	
	public String erro(){
		 
		msg = "Registro de matricula duplicado.";
	
	return msg;
	}
	
	public String sucesso(){
		 
		msg = "Registro alterado com sucesso.";
	
	return msg;
	}
}
