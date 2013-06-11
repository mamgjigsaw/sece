/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daoImpl.AvanceDaoImpl;
import daoImpl.ContratoDaoImpl;
import daoImpl.UsuarioDaoImpl;
import daoImpl.avanceVCEdaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import pojo.Contrato;
import pojo.Usuario;
import pojo.avanceVCE;

/**
 *
 * @author Mendieta
 */
public class finalReport extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        ServletOutputStream out = response.getOutputStream();
        try{
            
        int contra;
        contra = Integer.parseInt(request.getParameter("contra"));
        
        Contrato c = new Contrato();
        ContratoDaoImpl cdi = new ContratoDaoImpl();
        c = cdi.findById(contra);
        UsuarioDaoImpl udi = new UsuarioDaoImpl();
        Usuario u = udi.findById(c.getUsuario().getIdUsuario());
        
        String nombreEmpresa = u.getEmpresa().getNombre();
        avanceVCEdaoImpl avdi = new avanceVCEdaoImpl();
        List<avanceVCE> listAvance = avdi.findByContrato(contra); 
        
            Map<String, Object> param = new HashMap<String, Object>();             
             param.put("empresa",nombreEmpresa);
        
        JasperReport reporte = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("WEB-INF/VCE_report.jasper"));
        JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, param,new JRBeanCollectionDataSource(listAvance)); 

      JRExporter exporter = new JRPdfExporter();
      exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
      exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
      exporter.exportReport();
      }catch(Exception e){e.printStackTrace();
      }
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
