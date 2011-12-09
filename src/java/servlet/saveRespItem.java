/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import daoImpl.ContratoDaoImpl;
import daoImpl.ItemDaoImpl;
import daoImpl.RespItemDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.Contrato;
import pojo.Item;
import pojo.RespItem;
import pojo.Variable;

/**
 *
 * @author Personal
 */


public class saveRespItem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       /* HttpSession s = request.getSession();
        int idUser = (Integer)s.getAttribute("idUser");

        int r = 0;

      //  int idVariable = (Integer)s.getAttribute("idVariable");

       int idVariable = Integer.parseInt(request.getParameter("idvariable"));
        List<Item> item1 = new ArrayList<Item>();
       ItemDaoImpl idi = new ItemDaoImpl();
         item1 = idi.findByVar(idVariable);

         for(int i = 0; i<item1.size(); i++){

                              Item item_act = (Item)item1.get(i);
                                   int iditem = item_act.getIdItem();


                                 String t = request.getParameter("check"+iditem );
                                 r=0;
                                if(t.equals("on") ){
                                             r = 1;
                                           }
                                    String obs = request.getParameter("obser"+iditem);


                                       Contrato c = new Contrato();
                                       ContratoDaoImpl cdi = new ContratoDaoImpl();
                                       c = cdi.findById_Empresa(idUser);

                                    RespItem ri = new RespItem(item_act, c, r, obs);
                                       RespItemDaoImpl ridi = new RespItemDaoImpl();

                                       ridi.create(ri);





         }



        response.sendRedirect("initEnterprise.jsp");








*/




    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
