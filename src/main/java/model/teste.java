package model;

import java.sql.SQLException;

public class teste {
	
	public static void main(String args[]) throws SQLException{
	
		FuncionarioDAO teste = new FuncionarioDAO();
		Funcionario funcionario  =  new Funcionario();
		int indice = 1;
		String matricula = "";
		funcionario.setIdfuncionario(indice);		
		funcionario.setMatricula(matricula);
		System.out.println(teste.existe(funcionario));
		
	}

}
