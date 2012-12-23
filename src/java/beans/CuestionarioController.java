/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import internacionalizacionbeans.PreguntasInternacionalizacion;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;


/**
 *
 * @author davidalmanza
 */
@ManagedBean(name = "cuestionarioController")
@ViewScoped
public class CuestionarioController implements Serializable {
   
    private PreguntasInternacionalizacion pi  = PreguntasInternacionalizacion.getinstancia();
    
    private List<String> p15Opciones,p18Opciones,p20Opciones,p21Opciones,p22Opciones,pc4Opciones,pc6Opciones,pc11Opciones,
            pc13Opciones,pc15Opciones,pd2Opciones,pd3Opciones,pd7Opciones,pd9Opciones,pd10Opciones,pd11Opciones,pd12Opciones,
            pd17Opciones,pd18Opciones,pd21Opciones,pe1Opciones,pe3Opciones,pe5Opciones,pe10Opciones = new ArrayList<String>();   
    
    private String nombreComercial = "La Comercial";
    
    private int[] preguntas = new int[2];

    public CuestionarioController() {
        pi.setB1(10);
        pi.setB5(3);
        pi.setB92(1);
        pi.setB16(3);
        pi.setB17(5);
        pi.setC5(10);
        pi.setC9(5);
        pi.setC10(4);
        pi.setC12(3);
        pi.setC17(2);
        pi.setC22(3);
        pi.setD8(2);
        pi.setE2(10);
        pi.setE6(10);
        pi.setE15(10);
    }
    
    @PostConstruct
    public void init(){
     HttpServletRequest request=(HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
     pi.setId_contrato(Integer.parseInt(request.getParameter("idcontrato")));     
    }
    
    public void sumarOpcion15(){
        Iterator<String> it = p15Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        pi.setB15(suma);
    }
     
    public void sumarOpcion18(){
        Iterator<String> it = p18Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        pi.setB18(suma);
    }
    
    public void sumarOpcion20(){
        Iterator<String> it = p20Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma >10){
            pi.setB20(10);
        }else{
            pi.setB20(suma);
        }
            
        
    }
    
    public void sumarOpcion21(){
        Iterator<String> it = p21Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma >10){
         pi.setB21(10);   
        }else{
         pi.setB21(suma);   
        }        
    }
    
    public void sumarOpcion22(){
        Iterator<String> it = p22Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma >10){
            pi.setB22(10);
        }else{
            pi.setB22(suma);
        }
        
    }
    
    public void calcularB23(){
       pi.setB23(6+pi.getA12()-pi.getA11_1());       
    }
    
    public void calcularB24(){
        int logica_evaluar = 5 + pi.getB5() - pi.getB6();
        
        if ( logica_evaluar >10){
            pi.setB24(10);
        }else if ( logica_evaluar < 0){
            pi.setB24(0);
        }else{
            pi.setB24(logica_evaluar);    
        }
    }
    
    public void sumarOpcionc4(){
        Iterator<String> it = pc4Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma > 10){
         pi.setC4(10);   
        }else{
            pi.setC4(suma);
        }
    }
    
    public void sumarOpcionc6(){
        Iterator<String> it = pc6Opciones.iterator();
        int suma =0,num=0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());
            num ++;
        }
        System.out.println(suma);
        
        if(num ==0 ){
            pi.setC6(0);
        }else{
            pi.setC6(suma/num);
        }
    }
    
    public void sumarOpcionc11(){
        Iterator<String> it = pc11Opciones.iterator();
        int suma =0,num=0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
            num ++;
        }
        System.out.println(suma);
        
            if(num == 0){
               pi.setC11(0);
            }else{
               if(((suma/2)+((suma/num)*1.5)) > 10){
                pi.setC11(10);
                }else{
                    pi.setC11(((suma/2)+((suma/num)*1.5))); 
                }
            }
    }
 
    public void sumarOpcionc13(){
        Iterator<String> it = pc13Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        pi.setC13(suma);
    }
    
    public void sumarOpcionc15(){
        Iterator<String> it = pc15Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma >10){
          pi.setC15(10);  
        }else{
          pi.setC15(suma);  
        }        
    }
    
    public void sumarOpciond2(){
        Iterator<String> it = pd2Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
       
        
        if(suma>10){
            pi.setD2(10);
        }else{
            pi.setD2(suma);
        }
        
    }
    
    public void sumarOpciond3(){
        Iterator<String> it = pd3Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if((suma + (pi.getD2() /2 )) > 10){
            pi.setD3(10);
        }else{
            pi.setD3(suma);
        }
      
    }
    
    public void sumarOpciond7(){
        Iterator<String> it = pd7Opciones.iterator();
        Double suma =0.0;
        while (it.hasNext()){
            suma += Double.parseDouble(it.next());            
        }
        System.out.println(suma);
        pi.setD7(suma);
    }
    
    public void sumarOpciond9(){
        Iterator<String> it = pd9Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if( (5 + suma) < 0){
            pi.setD9(0);
        }else{
            pi.setD9(suma);
        }
    }
    
     public void sumarOpciond10(){
        Iterator<String> it = pd10Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma > 10){
            pi.setD10(10);
        }else{
            pi.setD10(suma);
        }
    }
     
     public void sumarOpciond11(){
        Iterator<String> it = pd11Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma > 10){
            pi.setD11(10);
        }else{
            pi.setD11(suma);
        }
    }
     
    public void sumarOpciond12(){
        Iterator<String> it = pd12Opciones.iterator();
        int suma =0,num=0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
            num ++;
        }
        System.out.println(suma);
        
        if(num ==0){
           pi.setD12(0); 
        }else{
           if((10 + ((suma + (suma/num)) / 2)) < 0){
             pi.setD12(0);
           } else{
               pi.setD12((10 + ((suma + (suma/num)) / 2)));
           }
        }
        pi.setD12(suma);
    }
    
    public void sumarOpciond17(){
        Iterator<String> it = pd17Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        pi.setD17(suma);
    }
    
    public void sumarOpciond18(){
        Iterator<String> it = pd18Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        pi.setD18(suma);
    }
    
    public void sumarOpciond21(){
        Iterator<String> it = pd21Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma > 10){
            pi.setD21(10);
        }else{
            pi.setD21(suma);
        }
    }
    
    public void sumarOpcione1(){
        Iterator<String> it = pe1Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        pi.setE1(suma);
    }
   
    public void sumarOpcione3(){
        Iterator<String> it = pe3Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma > 10){
            pi.setE3(10);
        }else{
            pi.setE3(suma);
        }
    }
    
    public void sumarOpcione5(){
        Iterator<String> it = pe5Opciones.iterator();
        int suma =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
        }
        System.out.println(suma);
        
        if(suma > 10){
            pi.setE5(10);
        }else{
            pi.setE5(suma);
        }
    }
    
    public void sumarOpcione10(){
        Iterator<String> it = pe10Opciones.iterator();
        int suma =0,num =0;
        while (it.hasNext()){
            suma += Integer.parseInt(it.next());            
            num ++;
        }
        System.out.println(suma);
        
        if(num ==0){
            pi.setE10(0);
        }else{
            pi.setE10((suma /2) + ((suma/num) *1.5) );
        }
        pi.setE10(suma);
    }
    
    public String getNombreComercial() {
        return nombreComercial;
    }
    
    public List<String> getP15Opciones() {
        return p15Opciones;
    }
       
    public PreguntasInternacionalizacion getPi() {
        return pi;
    }
    
    public void setPi(PreguntasInternacionalizacion pi) {
        this.pi = pi;
    }

    public void setP15Opciones(List<String> p15Opciones) {
        this.p15Opciones = p15Opciones;
    }

    public List<String> getP18Opciones() {
        return p18Opciones;
    }

    public void setP18Opciones(List<String> p18Opciones) {
        this.p18Opciones = p18Opciones;
    }

    public List<String> getP21Opciones() {
        return p21Opciones;
    }

    public void setP21Opciones(List<String> p21Opciones) {
        this.p21Opciones = p21Opciones;
    }

    public List<String> getP20Opciones() {
        return p20Opciones;
    }

    public void setP20Opciones(List<String> p20Opciones) {
        this.p20Opciones = p20Opciones;
    }

    public List<String> getP22Opciones() {
        return p22Opciones;
    }

    public void setP22Opciones(List<String> p22Opciones) {
        this.p22Opciones = p22Opciones;
    }

    public int[] getPreguntas() {
        return preguntas;
    }

    public List<String> getPc4Opciones() {
        return pc4Opciones;
    }

    public void setPc4Opciones(List<String> pc4Opciones) {
        this.pc4Opciones = pc4Opciones;
    }

    public List<String> getPc6Opciones() {
        return pc6Opciones;
    }

    public void setPc6Opciones(List<String> pc6Opciones) {
        this.pc6Opciones = pc6Opciones;
    }

    public List<String> getPc11Opciones() {
        return pc11Opciones;
    }

    public void setPc11Opciones(List<String> pc11Opciones) {
        this.pc11Opciones = pc11Opciones;
    }

    public List<String> getPc13Opciones() {
        return pc13Opciones;
    }

    public void setPc13Opciones(List<String> pc13Opciones) {
        this.pc13Opciones = pc13Opciones;
    }

    public List<String> getPc15Opciones() {
        return pc15Opciones;
    }

    public void setPc15Opciones(List<String> pc15Opciones) {
        this.pc15Opciones = pc15Opciones;
    }

    public List<String> getPd2Opciones() {
        return pd2Opciones;
    }

    public void setPd2Opciones(List<String> pd2Opciones) {
        this.pd2Opciones = pd2Opciones;
    }

    public List<String> getPd3Opciones() {
        return pd3Opciones;
    }

    public void setPd3Opciones(List<String> pd3Opciones) {
        this.pd3Opciones = pd3Opciones;
    }

    public List<String> getPd7Opciones() {
        return pd7Opciones;
    }

    public void setPd7Opciones(List<String> pd7Opciones) {
        this.pd7Opciones = pd7Opciones;
    }

    public List<String> getPd9Opciones() {
        return pd9Opciones;
    }

    public void setPd9Opciones(List<String> pd9Opciones) {
        this.pd9Opciones = pd9Opciones;
    }

    public List<String> getPd10Opciones() {
        return pd10Opciones;
    }

    public void setPd10Opciones(List<String> pd10Opciones) {
        this.pd10Opciones = pd10Opciones;
    }

    public List<String> getPd11Opciones() {
        return pd11Opciones;
    }

    public void setPd11Opciones(List<String> pd11Opciones) {
        this.pd11Opciones = pd11Opciones;
    }

    public List<String> getPd12Opciones() {
        return pd12Opciones;
    }

    public void setPd12Opciones(List<String> pd12Opciones) {
        this.pd12Opciones = pd12Opciones;
    }

    public List<String> getPd17Opciones() {
        return pd17Opciones;
    }

    public void setPd17Opciones(List<String> pd17Opciones) {
        this.pd17Opciones = pd17Opciones;
    }

    public List<String> getPd18Opciones() {
        return pd18Opciones;
    }

    public void setPd18Opciones(List<String> pd18Opciones) {
        this.pd18Opciones = pd18Opciones;
    }

    public List<String> getPd21Opciones() {
        return pd21Opciones;
    }

    public void setPd21Opciones(List<String> pd21Opciones) {
        this.pd21Opciones = pd21Opciones;
    }

    public List<String> getPe1Opciones() {
        return pe1Opciones;
    }

    public void setPe1Opciones(List<String> pe1Opciones) {
        this.pe1Opciones = pe1Opciones;
    }

    public List<String> getPe3Opciones() {
        return pe3Opciones;
    }

    public void setPe3Opciones(List<String> pe3Opciones) {
        this.pe3Opciones = pe3Opciones;
    }

    public List<String> getPe10Opciones() {
        return pe10Opciones;
    }

    public void setPe10Opciones(List<String> pe10Opciones) {
        this.pe10Opciones = pe10Opciones;
    }

    public List<String> getPe5Opciones() {
        return pe5Opciones;
    }

    public void setPe5Opciones(List<String> pe5Opciones) {
        this.pe5Opciones = pe5Opciones;
    }

   
}
