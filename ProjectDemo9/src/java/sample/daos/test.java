/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.sql.SQLException;
import java.util.Random;
import sample.dtos.DTO;
import sample.dtos.HouseDTO;
import sample.utils.DBUtils;

/**
 *
 * @author sonho
 */
public class test extends DAO {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        try {
            cnn = DBUtils.getConnection();
            String sql = "INSERT INTO tblHouses(IdHouse,PicHouse,Description,Furniture,TypeID, Price, IdWay, StatusCode)"
                    + " VALUES(?,?,?,?,?,?,?,?)";
            ps = cnn.prepareStatement(sql);
            cnn.setAutoCommit(false);
            Random r = new Random();
            for (int i = 22; i <= 36; i++) {
                System.out.println(i);
                ps.setString(1, "h" + i);
                ps.setString(2, "img/rooms/" + i + ".jpg");
                if (i % 3 == 0) {
                    ps.setString(3, "Country Style House");
                } else if (i % 4 == 0) {
                    ps.setString(3, "Modern House");
                } else if (i % 2 == 0) {
                    ps.setString(3, "Smart House With New Technology");
                }
                if (i % 2 == 0) {
                    ps.setString(4, i * 40 + "-" + (i - 20) * 2 + "-" + (i - 20) * 2 + "-" + 2);

                } else {
                    ps.setString(4, i * 40 + "-" + (i - 20) * 2 + "-" + (i - 20) * 2 + "-" + 1);
                }
                ps.setString(5, "t" + (r.nextInt(2) + 2));

                ps.setFloat(6, i * 4000 - 50);
                ps.setString(7, "d" + (r.nextInt(6) + 8));
                ps.setString(8, "1");
                ps.executeUpdate();
            }

            cnn.commit();
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            cnn.rollback();
        }
    }

}
