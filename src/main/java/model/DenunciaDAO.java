package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Denuncia;

/**
 * 
 * Classe de PersistÃªncia de dados dos objetos de Denuncia
 * É "filha" da Classe ConectaBanco. 
 *
 */

public class DenunciaDAO extends ConectaBanco {

	public void alterar(Denuncia denuncia) {
		try {
			Connection conexao = getConexao();

			PreparedStatement pstmt = conexao
					.prepareStatement("Update denuncia SET matricula = ?, nome = ?, funcao = ?, email = ?, senha = ? WHERE iddenuncia = ? ");
			pstmt.setString(1, denuncia.getMatricula());
			pstmt.setString(2, denuncia.getNome());
			pstmt.setString(3, denuncia.getFuncao());
			pstmt.setString(4, denuncia.getEmail());
			pstmt.setString(5, denuncia.getSenha());
			pstmt.execute();
			pstmt.close();
			conexao.close();

		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "NÃO FOI POSSIVEL EFETUAR ALTERAÇÂO",null, JOptionPane.ERROR_MESSAGE);
		}
	}

	public void excluir(Denuncia denuncia) {
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Delete from denuncia where iddenuncia = ?");
			pstm.setInt(1, denuncia.getIddenuncia());
			pstm.execute();
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "NÃO FOI POSSIVEL EFETUAR EXCLUSÃO",null, JOptionPane.ERROR_MESSAGE);
		}
	}

	public boolean existe(Denuncia denuncia) {
		boolean achou = false;
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Select * from denuncia where iddenuncia = ?");
			//if(pstm==null)				
			pstm.setInt(1, denuncia.getIddenuncia());
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

	public void inserir(Denuncia denuncia) {
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Insert into	denuncia (matricula, nome, funcao, email, senha) values	(?,?,?,?,?)");
			pstm.setString(1, denuncia.getMatricula());
			pstm.setString(2, denuncia.getNome());
			pstm.setString(3, denuncia.getFuncao());
			pstm.setString(4, denuncia.getEmail());
			pstm.setString(5, denuncia.getSenha());
			pstm.execute();
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Denuncia> listar(String par_nome, String par_funcao, String par_matricula) {
		
		List<Denuncia> lista = new ArrayList<Denuncia>();
		
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
				Denuncia denuncia = new Denuncia();
				denuncia.setIddenuncia(rs.getInt("iddenuncia"));
				denuncia.setMatricula(rs.getString("matricula"));
				denuncia.setNome(rs.getString("nome"));
				denuncia.setFuncao(rs.getString("funcao"));
				denuncia.setEmail(rs.getString("email"));
				denuncia.setSenha(rs.getString("senha"));
				lista.add(denuncia);
			}
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}

	public Denuncia consultar_editar(Denuncia denuncia) {
		try {
			Connection conexao = getConexao();
			PreparedStatement pstm = conexao
					.prepareStatement("Select * from denuncia where iddenuncia = ?");
			pstm.setInt(1, denuncia.getIddenuncia());
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				denuncia.setIddenuncia(rs.getInt("iddenuncia"));
				denuncia.setMatricula(rs.getString("matricula"));
				denuncia.setNome(rs.getString("nome"));
				denuncia.setFuncao(rs.getString("funcao"));
				denuncia.setEmail(rs.getString("email"));
				denuncia.setSenha(rs.getString("senha"));
			}
			pstm.close();
			conexao.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return denuncia;
	}
}