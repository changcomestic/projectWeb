/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

import java.util.List;

/**
 *
 * @author sonho
 */
public class ProductsInBillDTO {

    String idBill;
    List<String> idHouse;

    public ProductsInBillDTO(String idBill, List<String> idHouse) {
        this.idBill = idBill;
        this.idHouse = idHouse;
    }

    public String getIdBill() {
        return idBill;
    }

    public void setIdBill(String idBill) {
        this.idBill = idBill;
    }

    public List<String> getIdHouse() {
        return idHouse;
    }

    public void setIdHouse(List<String> idHouse) {
        this.idHouse = idHouse;
    }
    
    
}
