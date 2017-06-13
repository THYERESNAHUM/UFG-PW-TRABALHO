package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Visita;

/**
 * 
 * Classe de PersistÃªncia de dados dos objetos de Visita
 * É "filha" da Classe ConectaBanco. 
 *
 */

public class VisitaDAO extends ConectaBanco {

	public void alterar(Visita visita) {
		try {
			Connection conexao = getConexao();

			PreparedStatement pstmt = conexao
					.prepareStatement("Update visita SET matricula = ?, nome = ?, funcao = ?, email = ?, senha = ? WHERE idvisita = ? ");
			pstmt.setString(1, visita.getMatricula());
			pstmt.setString(2, visita.getNome());
			pstmt.setString(3, visita.getFuncao());
			pstmt.setString(4, visita.getEmail());
			pstmt.setString(5, visita.getSenha());
			pstmt.execute();
			pstmt.close();
			conexao.close();

		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "NÃO FOI POSSIVEL EFETUAR ALTERAÇÂO",null, JOptionPane.ERROR_MESSAGE);
		}
	}

	public void excluir(Visita visita) {
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Delete from visita where idvisita = ?");
			pstm.setInt(1, visita.getIdvisita());
			pstm.execute();
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "NÃO FOI POSSIVEL EFETUAR EXCLUSÃO",null, JOptionPane.ERROR_MESSAGE);
		}
	}

	public boolean existe(Visita visita) {
		boolean achou = false;
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Select * from visita where idvisita = ?");
			//if(pstm==null)				
			pstm.setInt(1, visita.getIdvisita());
			ResultSet rs = pstm.executeQuery();
			
			if (rs.next()) {
				achou = true;
			}
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERRO AO INCLUIR");
		}
		return achou;
	}

	public void inserir(Visita visita) {
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Insert into	visita (matricula, nome, funcao, email, senha) values	(?,?,?,?,?)");
			pstm.setString(1, visita.getMatricula());
			pstm.setString(2, visita.getNome());
			pstm.setString(3, visita.getFuncao());
			pstm.setString(4, visita.getEmail());
			pstm.setString(5, visita.getSenha());
			pstm.execute();
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Visita> listar(String par_nome, String par_funcao, String par_matricula) {
		
		List<Visita> lista = new ArrayList<Visita>();
		
		try {
			/*Statement stm = conexao.createStatement();*/
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Select * from fucncionario where nome like ? and funcao like ? and matricula like ? order by nome asc");
			pstm.setString(1, "%" + par_nome +"%");
			pstm.setString(2, "%" + par_funcao +"%");
			pstm.setString(3, "%" + par_matricula +"%");
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				Visita visita = new Visita();
				visita.setIdvisita(rs.getInt("idvisita"));
				visita.setMatricula(rs.getString("matricula"));
				visita.setNome(rs.getString("nome"));
				visita.setFuncao(rs.getString("funcao"));
				visita.setEmail(rs.getString("email"));
				visita.setSenha(rs.getString("senha"));
				lista.add(visita);
			}
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	public Visita consultar_editar(Visita visita) {
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Select * from visita where idvisita = ?");
			pstm.setInt(1, visita.getIdvisita());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				visita.setIdvisita(rs.getInt("idvisita"));
				visita.setMatricula(rs.getString("matricula"));
				visita.setNome(rs.getString("nome"));
				visita.setFuncao(rs.getString("funcao"));
				visita.setEmail(rs.getString("email"));
				visita.setSenha(rs.getString("senha"));
			}
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return visita;
	}
}