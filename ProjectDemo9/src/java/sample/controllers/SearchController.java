/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
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
import sample.dtos.WayDTO;

/**
 *
 * @author sonho
 */
public class SearchController extends HttpServlet {

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
            String idCity = request.getParameter("city");
            String idWay = request.getParameter("way");
            String typeId = request.getParameter("type");
            float priceLower = Float.parseFloat(request.getParameter("priceLower"));
            float priceHigher = Float.parseFloat(request.getParameter("priceHigher"));
            request.setAttribute("PRICELOWER", priceLower + "");
            request.setAttribute("PRICEHIGHER", priceHigher + "");
            HttpSession session = request.getSession();
            List<CityDTO> listCity = null;
            List<HouseDTO> listHouse = null;
            List<TypeDTO> listType = null;
            List<WayDTO> listWay = null;
            Map<String, DetailHouseDTO> detail = new HashMap<>();
            //000
            if (idCity == null && idWay == null && typeId == null
                    || (idCity.equals("") && idWay.equals("") && typeId.equals(""))) {
                listCity = CityDAO.getAllListCity();
                //get list house with price default
                listType = TypeDAO.getAllListType();
                listHouse = HouseDAO.getListHouseWithPriceBetween(priceLower, priceHigher);
                session.setAttribute("LISTWAY", null);
                session.setAttribute("TYPEID", null);
                session.setAttribute("LISTHOUSE", listHouse);
            } //001
            else if ((idCity == null && idWay == null && typeId != null)
                    || (idCity.equals("") && idWay.equals("") && !typeId.equals(""))) {
                //    listCity = CityDAO.getAllListCity();
                listHouse = HouseDAO.getListHouseByTypeId(typeId, priceLower, priceHigher);
                session.setAttribute("LISTHOUSE", listHouse);
                session.setAttribute("IDWAY", null);
                session.setAttribute("IDCITY", null);
            } //011
            else if (idCity == null && idWay != null && typeId != null
                    || (idCity.equals("") && !idWay.equals("") && !typeId.equals(""))) {
                //vo ly
            } //100
            else if (idCity != null && idWay == null && typeId == null
                    || (!idCity.equals("") && idWay.equals("") && typeId.equals(""))) {
                listWay = WayDAO.getListWayByIdCity(idCity);
                List<String> listWayId = WayDAO.getListWayIdByIdCity(idCity);
                listHouse = HouseDAO.getListHouseWithListWay(listWayId, priceLower, priceHigher);
                session.setAttribute("LISTHOUSE", listHouse);
                session.setAttribute("TYPEID", null);
                session.setAttribute("IDWAY", null);
            }//101
            else if (idCity != null && idWay == null && typeId != null
                    || (!idCity.equals("") && idWay.equals("") && !typeId.equals(""))) {
                listWay = WayDAO.getListWayByIdCity(idCity);
                List<String> listWayId = WayDAO.getListWayIdByIdCity(idCity);
                listHouse = HouseDAO.getListHouseByTypeIdAndListWayId(priceLower, priceHigher, typeId, listWayId);
                session.setAttribute("LISTHOUSE", listHouse);
                session.setAttribute("IDWAY", null);
                
            }//110
            else if (idCity != null && idWay != null && typeId == null
                    || (!idCity.equals("") && !idWay.equals("") && typeId.equals(""))) {
                listWay = WayDAO.getListWayByIdCity(idCity);
                List<String> listWayId = WayDAO.getListWayIdByIdCity(idCity);
                boolean check = WayDAO.checkWayBelongToIdCity(idWay, idCity);
                if (listWayId.contains(idWay)) {
                    listHouse = HouseDAO.getListHouseByIdWay(idWay, priceLower, priceHigher);
                } else {
                    session.setAttribute("IDWAY", null);
                    listHouse = HouseDAO.getListHouseWithListWay(listWayId, priceLower, priceHigher);
                }
                session.setAttribute("TYPEID", null);
                session.setAttribute("LISTHOUSE", listHouse);
            }//111
            else if (idCity != null && idWay != null && typeId != null
                    || (!idCity.equals("") && !idWay.equals("") && !typeId.equals(""))) {
                //    listWay = WayDAO.getListWayByIdCity(idCity);
                listHouse = HouseDAO.getListHouseByIdWayAndTypeId(idWay, typeId, priceLower, priceHigher);
                session.setAttribute("LISTHOUSE", listHouse);
            }
            if (listHouse != null) {
                for (HouseDTO x : listHouse) {
                    String wayName = WayDAO.getWayNameByIdWay(x.getIdWay());
                    String idCity2 = WayDAO.getIdCityByIdWay(x.getIdWay());
                    String cityName = CityDAO.getCityNameByCityId(idCity2);
                    String typeName = TypeDAO.getTypeNameByTypeId(x.getTypeId());
                    DetailHouseDTO dhDTO = new DetailHouseDTO(wayName, cityName, typeName);
                    detail.put(x.getIdHouse(), dhDTO);
                }
            }
            session.setAttribute("LISTHOUSEDETAIL", detail);
            if (listCity != null) {
                session.setAttribute("LISTCITY", listCity);
            }
            if (listWay != null) {
                session.setAttribute("LISTWAY", listWay);
            }

            if (listType != null) {
                session.setAttribute("LISTTYPE", listType);
            }
            if (!idCity.equals("")) {
                session.setAttribute("IDCITY", idCity);
            }
            if (!idWay.equals("")) {
                session.setAttribute("IDWAY", idWay);
            }
            if (!typeId.equals("")) {
                session.setAttribute("TYPEID", typeId);
            }

        } catch (Exception ex) {
            log("Error at SearchController: " + ex.toString());
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
