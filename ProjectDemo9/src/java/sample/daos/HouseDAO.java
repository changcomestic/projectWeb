/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.dtos.HouseDTO;
import sample.utils.DBUtils;

/**
 *
 * @author sonho
 */
public class HouseDAO extends DAO {

    public static List<HouseDTO> getListHouseByIdWayAndTypeId(String idWay, String typeId, float priceLower, float priceHigher) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID,"
                        + " Price, IdWay, StatusCode FROM tblHouses WHERE TypeID = ? AND Price BETWEEN ? AND ? AND IdWay = ?";
                ps = cnn.prepareStatement(sql);
                ps.setString(1, typeId);
                ps.setFloat(2, priceHigher);
                ps.setFloat(3, priceLower);
                ps.setString(4, idWay);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                            rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                            rs.getFloat("Price"), rs.getString("IdWay"),
                            rs.getString("StatusCode")));
                }
            }

        } catch (Exception ex) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> getListHouseByTypeIdAndListWayId(float priceLower, float priceHigher,
            String typeId, List<String> listIdWay) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID,"
                        + " Price, IdWay, StatusCode FROM tblHouses WHERE TypeID = ? AND Price BETWEEN ? AND ? AND IdWay = ?";
                ps = cnn.prepareStatement(sql);
                ps.setString(1, typeId);
                ps.setFloat(2, priceHigher);
                ps.setFloat(3, priceLower);
                for (String x : listIdWay) {
                    ps.setString(4, x);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        if (result == null) {
                            result = new ArrayList<>();
                        }
                        result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                                rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                                rs.getFloat("Price"), rs.getString("IdWay"),
                                rs.getString("StatusCode")));
                    }
                }
            }

        } catch (Exception ex) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> getListHouseByTypeId(String typeId, float priceLower, float priceHigher) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID,"
                        + " Price, IdWay, StatusCode FROM tblHouses WHERE TypeID = ? AND Price BETWEEN ? AND ?";
                ps = cnn.prepareStatement(sql);
                ps.setString(1, typeId);
                ps.setFloat(2, priceHigher);
                ps.setFloat(3, priceLower);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                            rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                            rs.getFloat("Price"), rs.getString("IdWay"),
                            rs.getString("StatusCode")));
                }
            }

        } catch (Exception ex) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> getListHouseByIdWay(String idWay, float priceLower, float priceHigher) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID, Price, IdWay,"
                        + " StatusCode FROM tblHouses WHERE IdWay = ? AND Price BETWEEN ? AND ?";
                ps = cnn.prepareStatement(sql);
                ps.setString(1, idWay);
                ps.setFloat(2, priceHigher);
                ps.setFloat(3, priceLower);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                            rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                            rs.getFloat("Price"), rs.getString("IdWay"),
                            rs.getString("StatusCode")));
                }
            }

        } catch (Exception ex) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> getListHouseWithListWay(List<String> listWayId, float priceLower, float priceHigher) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID, Price, IdWay,"
                        + " StatusCode FROM tblHouses WHERE IdWay = ? AND Price BETWEEN ? AND ?";
                ps = cnn.prepareStatement(sql);
                ps.setFloat(2, priceHigher);
                ps.setFloat(3, priceLower);
                for (String x : listWayId) {
                    ps.setString(1, x);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        if (result == null) {
                            result = new ArrayList<>();
                        }
                        result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                                rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                                rs.getFloat("Price"), rs.getString("IdWay"),
                                rs.getString("StatusCode")));
                    }
                }
            }

        } catch (Exception ex) {
        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> getListHouseWithPriceBetween(float priceLower, float priceHigher) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID, Price, IdWay, StatusCode FROM tblHouses WHERE Price"
                        + " BETWEEN ? AND ? ";
                ps = cnn.prepareStatement(sql);
                ps.setFloat(1, priceHigher);
                ps.setFloat(2, priceLower);
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                            rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                            rs.getFloat("Price"), rs.getString("IdWay"),
                            rs.getString("StatusCode")));
                }
            }

        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> getListHousetAtBegining() throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String sql = "SELECT IdHouse, PicHouse, Description, Furniture, TypeID, Price, IdWay, StatusCode FROM tblHouses WHERE TypeID = ? ";
                ps = cnn.prepareStatement(sql);
                ps.setString(1, "t3");
                rs = ps.executeQuery();
                while (rs.next()) {
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HouseDTO(rs.getString("IdHouse"), rs.getString("PicHouse"),
                            rs.getString("Description"), rs.getString("Furniture"), rs.getString("TypeID"),
                            rs.getFloat("Price"), rs.getString("IdWay"),
                            rs.getString("StatusCode")));
                }
            }

        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return result;
    }

    public static boolean insertAHouse(HouseDTO dto) throws SQLException, SQLException {
        boolean result = false;
        try {
            cnn = DBUtils.getConnection();
            cnn.setAutoCommit(false);
            if (cnn != null) {
                String url = "INSERT INTO tblHouses (IdHouse, PicHouse, Description, Price, IdWay, StatusCode) "
                        + " VALUES (?,?,?,?,?,?)";
                ps = cnn.prepareStatement(url);
//                ps.setString(1, dto.getUserID());
//                ps.setString(2, dto.getUserName());
//                ps.setString(3, dto.getPassword());
//                ps.setString(4, dto.getRoleID());
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

    public static List<HouseDTO> searchByCity(String search) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String url = "SELECT IdHouse, PicHouse, Description, Price, IdWay, StatusCode "
                        + " FROM tblHouses "
                        + " WHERE userName LIKE ?";
                ps = cnn.prepareStatement(url);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
//                    result.add(new HouseDTO(rs.getString("IdHouse"),
//                            rs.getString("PicHouse"), rs.getString("Description"),
//                            rs.getFloat("Price"), rs.getString("IdWay"), rs.getString("StatusCode")));
                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return result;
    }

    public static List<HouseDTO> searchByCounty(String search) throws SQLException {
        return null;
    }

    public static List<HouseDTO> searchByWay(String search) throws SQLException {
        List<HouseDTO> result = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String url = "SELECT IdHouse, PicHouse, Description, Price, IdWay, StatusCode FROM tblHouses WHERE userName LIKE ?";
                ps = cnn.prepareStatement(url);
                ps.setString(1, "%" + search + "%");
                rs = ps.executeQuery();
                result = new ArrayList<>();
//                while (rs.next()) {
//                    result.add(new UserDTO(rs.getString("UserID"),
//                            rs.getString("UserName"), rs.getString("Password"), rs.getString("RoleID")));
//                }
            }
        } catch (Exception ex) {

        } finally {
            closeConnection();
        }
        return result;
    }

}
