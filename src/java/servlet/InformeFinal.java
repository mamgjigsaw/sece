/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.mysql.jdbc.Connection;
import daoImpl.ContratoDaoImpl;
import daoImpl.EmpresaDaoImpl;
import daoImpl.IndicadorDaoImpl;
import daoImpl.UsuarioDaoImpl;
import dwrScripts.initCapacitadores;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import pojo.Contrato;
import pojo.Empresa;
import pojo.Indicador;
import pojo.Usuario;
import pojo.vce;

/**
 *
 * @author Dave
 */
public class InformeFinal extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idContrato = Integer.parseInt(request.getParameter("idContrato"));
        String nombreEmpresa ="";
        String direccion ="";
        
        response.setContentType("application/pdf");
        ServletOutputStream out = response.getOutputStream();
        
        initCapacitadores init = new initCapacitadores();
        
        //id_contrato 25
        Contrato contrato = new Contrato();
        ContratoDaoImpl contraDao = new ContratoDaoImpl();
        contrato = contraDao.findById(idContrato);
        
        Usuario usuario = new Usuario();
        UsuarioDaoImpl usuDao = new UsuarioDaoImpl();
        usuario = usuDao.findById(contrato.getUsuario().getIdUsuario());
        
        Empresa empresa = new Empresa();
        EmpresaDaoImpl empresaDao = new EmpresaDaoImpl();
        empresa = empresaDao.findByID(usuario.getEmpresa().getIdEmpresa());
        
        nombreEmpresa = empresa.getNombre();
        
        // 
        String passBD, ipPublica,userDB;
        Properties archivoConf = new Properties();
        archivoConf.load(this.getClass().getClassLoader().getResourceAsStream("/micelanea.properties"));
        userDB = (String) archivoConf.getProperty("userDB");
        passBD = (String) archivoConf.getProperty("passwordDB");
        ipPublica = (String) archivoConf.getProperty("ipPublica");
        
         int av = init.AvancePorcXcontrato(contrato); 
         
         if(av==100){        
       
         try
         {
             Class.forName("com.mysql.jdbc.Driver");
             Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/sece", userDB, passBD);
             
             JasperReport reporte = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("WEB-INF/finalReport.jasper"));
             
             Map<String, Object> param = new HashMap<String, Object>();
             param.put("idContrato", idContrato);
             param.put("empresa",nombreEmpresa);
            
             JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, param, conexion); 

            JRExporter exporter = new JRPdfExporter();
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
            exporter.exportReport();
        }
           catch (Exception e){
                e.printStackTrace();
               }        
         }else{
          //Aqui imprimir que no ha terminado el instrumento
            try
            {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conexion = (Connection) DriverManager.getConnection("jdbc:mysql://"+ ipPublica +":3306/sece", userDB, passBD);

                 JasperReport reporte = (JasperReport) JRLoader.loadObject(getServletContext().getRealPath("WEB-INF/valoracionNoTerminada.jasper"));

                 JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, null, conexion); 

                JRExporter exporter = new JRPdfExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
                exporter.exportReport();
           }
              catch (Exception e){
                  e.printStackTrace();
                  }
         }//End the else of validate av==100   
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
