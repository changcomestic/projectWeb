/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.dtos.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author sonho
 */
public class UserDAO extends DAO {

    public static UserDTO checkLogin(String userID, String pass) throws SQLException {
        UserDTO result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String url = "SELECT UserName,RoleID, Email FROM tblUsers WHERE userID = ? and password = ?";
                ps = cnn.prepareStatement(url);
                ps.setString(1, userID);
                ps.setString(2, pass);
                rs = ps.executeQuery();
                if (rs.next()) {
                    if (rs.getString("Email") == null) {
                        result = new UserDTO(userID, rs.getString("UserName"), pass, rs.getString("RoleID"));
                    } else {
                        result = new UserDTO(userID, rs.getString("UserName"), rs.getString("Email"), pass, rs.getString("RoleID"));
                    }
                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<UserDTO> searchByLikeName(String search) throws SQLException {
        List<UserDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String url = "SELECT UserID,UserName,Password,RoleID FROM tblUsers WHERE userName LIKE ?";
                ps = cnn.prepareStatement(url);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    result.add(new UserDTO(rs.getString("UserID"),
                            rs.getString("UserName"), rs.getString("Password"), rs.getString("RoleID")));
                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return result;
    }

    public static boolean insertAUser(UserDTO dto) throws SQLException, SQLException {
        boolean result = false;
        try {
            cnn = DBUtils.getConnection();
            cnn.setAutoCommit(false);
            if (cnn != null) {
                String url = "INSERT INTO tblUsers (UserID, UserName, Password, RoleID) "
                        + " VALUES (?,?,?,?)";
                ps = cnn.prepareStatement(url);
                ps.setString(1, dto.getUserID());
                ps.setString(2, dto.getUserName());
                ps.setString(3, dto.getPassword());
                ps.setString(4, dto.getRoleID());
                ps.executeUpdate();
                result = true;
            }
        } catch (Exception ex) {
            cnn.rollback();
        } finally {
            closeConnection();
        }
        return result;
    }

    public static boolean deleteAUser(String userID) throws SQLException {
        boolean result = false;
        try {
            cnn = DBUtils.getConnection();
            cnn.setAutoCommit(false);
            if (cnn != null && userID != null) {
                String sql = "DELETE FROM tblUsers WHERE userID = ?";
                ps = cnn.prepareStatement(sql);
                ps.setString(1, userID);
                ps.executeUpdate();
                result = true;
                cnn.commit();
            }
        } catch (Exception ex) {
            cnn.rollback();
        } finally {
            closeConnection();
        }
        return result;
    }

}
