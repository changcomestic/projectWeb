/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.CityDAO;
import sample.daos.HouseDAO;
import sample.daos.TypeDAO;
import sample.daos.WayDAO;
import sample.dtos.CityDTO;
import sample.dtos.DetailHouseDTO;
import sample.dtos.HouseDTO;
import sample.dtos.TypeDTO;

/**
 *
 * @author sonho
 */
public class GetListWhenBeginningController extends HttpServlet {

    private final String SUCCESS = "index.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            List<CityDTO> listCity = CityDAO.getAllListCity();
            List<HouseDTO> listHouse = HouseDAO.getListHousetAtBegining();
            List<TypeDTO> listType = TypeDAO.getAllListType();
            Map<String, DetailHouseDTO> detail = new HashMap<>();
            HttpSession session = request.getSession();
            for (HouseDTO x : listHouse) {
                String wayName = WayDAO.getWayNameByIdWay(x.getIdWay());
                String idCity = WayDAO.getIdCityByIdWay(x.getIdWay());
                String cityName = CityDAO.getCityNameByCityId(idCity);
                String typeName = TypeDAO.getTypeNameByTypeId(x.getTypeId());
                DetailHouseDTO dhDTO = new DetailHouseDTO(wayName, cityName, typeName);
                detail.put(x.getIdHouse(), dhDTO);
            }
            session.setAttribute("LISTHOUSEDETAIL", detail);
            if (listCity != null && listHouse != null) {
                session.setAttribute("LISTCITY", listCity);
                session.setAttribute("LISTHOUSE", listHouse);
                session.setAttribute("LISTTYPE", listType);
            }
        } catch (SQLException ex) {
            log("Error at GetLitWhenBeginningController: " + ex.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
