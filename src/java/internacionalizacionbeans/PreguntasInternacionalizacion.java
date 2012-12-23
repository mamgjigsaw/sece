/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacionbeans;

import daoImpl.ContratoDaoImpl;
import daoImpl.EmpresaCompletaDaoImpl;
import pojo.Contrato;
import pojo.EmpresaCompleta;

/**
 *
 * @author Dave
 */
public class PreguntasInternacionalizacion {

    private int b1, b2, b3, b4, b5, b6, b7, b8, b91, b92, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24,
            c1, c2, c3, c4, c5, c7, c8, c9, c10, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25,
            d1, d2, d3, d4, d5, d6, d8, d9, d10, d11, d13, d14, d15, d25, d16, d17, d18, d19, d20, d21, d22,
            e1, e2, e3, e4, e5, e6, e7, e8, e9, e11, e12, e13, e14, e15, e16, e17;
    private Double d7, d23, c6, c11, d12, e10;
    private String nameD15;
    private int vali1D2, vali2D2, vali3D2, vali4D2, vali5D2, vali6D2, vali7D2, vali8D2, vali9D2, vali10D2, vali11D2,
            vali1D3, vali2D3, vali3D3, vali4D3, vali5D3, vali6D3, vali7D3, vali8D3, vali9D3, vali10D3, vali11D3;
    private int sumD2, sumD3;
    //para rentabilidad
    private int AA79, AA80;
    private double x66, v66, x55, v55, mBruto_infer, mBrutoSup, incDemandSup, incDemandInf, benExpSup, benExpInf, invExpoSup, invExpInf, BFactAnualSup, BFactAnualInf, BInversionSup, BInversionInf, BNetoSup, BNetoInf;
    private int fact_superior, fact_infer;// superior e inferior, la primera con d5 y despues d4
    /*Ponderacion de cada area*/
    final int situacion_productiva = 77;
    final int estructura_empresarial = 98;
    final int situacion_financiear = 121;
    final int preparacion_motivacion_directiva = 130;
    final int politica_calidad = 108;
    final int dis_asociado = 107;
    final int diferenciacion = 68;
    final int adaptacion = 83;
    final int empaques = 62;
    final int politica_marca = 136;
    final int inteligencia_comercial = 143;
    final int gestion_tramites_exportacion = 99;
    final int logistica = 88;
    final int distribucion_comercial = 51;
    final int asociatividad = 20;
    final int politica_precios = 97;
    final int promocion_tradicional = 105;
    final int promocion_internet = 87;
    final int responsabilidad_social = 30;
    /*Ponderacion de cada area*/
    /*variables procedentes de Empresa*/
    //a12 es la facturacion
    //a11_1 son los numero de empleado
    private int  a12 = 9,a11_1 = 2, id_contrato;
    private double facturacion = 9;
    /*---variables procedentes de Empresa*/
    /*Asignacion dura*/
    int transporte = 4;//d15 en la hoja de apoyo, en pregunta del instrumento es la d25
    Double rentabilidad_inversiones_exterior = 3.0;
    /*Asignacion dura*/

    public PreguntasInternacionalizacion() {
    }
    public static PreguntasInternacionalizacion kilo;

    public static PreguntasInternacionalizacion getinstancia() {
        if (kilo == null) {
            kilo = new PreguntasInternacionalizacion();
        }
        return kilo;
    }

    public double situacion_productiva() {
        double resultado;
        getNombreD15HojaApoyo();
        transporte = this.d15;
        rentabilidad();
        empleadoPermanente(id_contrato);
        facturacionAnual(id_contrato);
        //int a = (a11_1 * 10) + (a12 * 9) + (b1 * 5) + (b2 * 5) + (b3 * 10) + (b4 * 10) + (b5 * 5) + (b8 * 2) + (b91 * 2) + (b10 * 3) + (b24 * 5) + (c1 * 5) + (c4 * 2) + (c5 * 2) + (d9 * 5);
        resultado = ((a11_1 * 10) + (a12 * 9) + (b1 * 5) + (b2 * 5) + (b3 * 10) + (b4 * 10) + (b5 * 5) + (b8 * 2) + (b91 * 2) + (b10 * 3) + (b24 * 5) + (c1 * 5) + (c4 * 2) + (c5 * 2) + (d9 * 5)) / situacion_productiva;
        return resultado;
    }

    public double estructura_empresarial() {
        double resultado;
        //int a = (a11_1 * 10) + (a12 * 10) + (b3 * 5) + (b4 * 10) + (b8 * 10) + (b91 * 5) + (b10 * 15) + (b11 * 10) + (b12 * 3) + (b18 * 3) + b19 + b20 + b21 + b22 + (c4 * 5) + (d2 * 5) + (d3 * 3);
        resultado = ((a11_1 * 10) + (a12 * 10) + (b3 * 5) + (b4 * 10) + (b8 * 10) + (b91 * 5) + (b10 * 15) + (b11 * 10) + (b12 * 3) + (b18 * 3) + b19 + b20 + b21 + b22 + (c4 * 5) + (d2 * 5) + (d3 * 3)) / estructura_empresarial;
        return resultado;
    }

    public double situacion_financiear() {
        double resultado;
        double a = (a11_1 * 10) + (a12 * 15) + b2 + (b4 * 10) + (b6 * 5) + (b7 * 5) + (b8 * 10) + (b91 * 2) + (b23 * 10) + (c2 * 2) + (c3 * 2) + (c5 * 3) + (d6 * 12) + (d8 * 6) + (d9 * 4) + (d12 * 4) + (rentabilidad_inversiones_exterior * 10);
        resultado = a / situacion_financiear;
        return resultado;
    }

    public double preparacion_motivacion_directiva() {
        double resultado;
        double a = (b2 * 2) + (b4 * 2) + (b7 * 3) + (b8 * 5) + (b91 * 3) + (b10 * 5) + (b11 * 2) + b13 + b12 + (b18 * 3) + b19 + b20 + b21 + b22 + (b23 * 2) + (c4 * 2) + (d1 * 10) + (d2 * 2) + (d3 * 2) + (d4 * 2) + (d5 * 5) + (d9 * 10) + (d10 * 10) + (d11 * 8) + (d12 * 5) + (rentabilidad_inversiones_exterior * 4) + (e2 * 4) + (e3 * 8) + (e5 * 8) + (e6 * 5) + (e7 * 2) + (e8 * 10);
        resultado = a / preparacion_motivacion_directiva;
        return resultado;
    }

    public double politica_calidad() {
        double resultado;
        double a = (b2 * 5) + (b6 * 10) + (b8 * 3) + (b91 * 10) + (b10 * 3) + (b12 * 2) + (b14 * 3) + (b17 * 2) + (b20 * 2) + (b21 * 2) + (b22 * 2) + (c2 * 3) + (c3 * 8) + (c4 * 10) + (c8 * 3) + (c6 * 7) + (c7 * 2) + (c8 * 2) + (c9 * 10) + (c10 * 12) + (c11 * 7);
        resultado = a / politica_calidad;
        return resultado;
    }

    public double dis_asociado() {
        double resultado;
        double a = (b2 * 2) + (b3 * 2) + (b91 * 2) + (b12 * 2) + b13 + (b14 * 2) + (b17 * 3) + (c2 * 3) + (c3 * 2) + (c4 * 5) + (c5 * 3) + (c6 * 12) + (c7 * 10) + (c9 * 5) + (c10 * 8) + (c13 * 5) + (c15 * 10) + (e9 * 15) + (e10 * 15);
        resultado = a / dis_asociado;
        return resultado;
    }

    public double diferenciacion() {
        double resultado;
        double a = (b2 * 3) + (b3 * 2) + (b91 * 3) + (b12 * 5) + (b13 * 3) + (b17 * 3) + (c2 * 5) + (c3 * 10) + (c4 * 5) + (c5 * 3) + (c6 * 5) + (c7 * 3) + (c8 * 10) + (c9 * 3) + (c10 * 5);
        resultado = a / diferenciacion;
        return resultado;
    }

    public double adaptacion() {
        double resultado;
        double a = (b2 * 3) + (b91 * 3) + (b12 * 2) + (b14 * 2) + (c1 * 4) + (c4 * 10) + (c12 * 10) + (c13 * 15) + (c14 * 10) + (c15 * 10) + (c23 * 4) + (getD7() * 10);
        resultado = a / adaptacion;
        return resultado;
    }

    public double empaques() {
        double resultado;
        double a = (b2 * 2) + (b12 * 3) + b13 + (c4 * 2) + (c7 * 2) + (c13 * 10) + (c15 * 10) + (c23 * 10) + (c24 * 10) + (e17 * 10);
        resultado = a / empaques;
        return resultado;
    }

    public double politica_marca() {
        double resultado;
        double a = (b4 * 10) + b91 + (b12 * 15) + (b13 * 8) + (b14 * 10) + (b17 * 3) + (b20 * 3) + (b21 * 3) + (b22 * 3) + (c2 * 3) + c3 + (c4 * 5) + (c5 * 2) + (c6 * 10) + (c9 * 7) + (c10 * 10) + (c11 * 7) + (c13 * 5) + (c15 * 5) + (c16 * 10) + (c17 * 12) + (c18 * 3);
        resultado = a / politica_marca;
        return resultado;
    }

    public double inteligencia_comercial() {
        double resultado;
        double a = (b4 * 5) + (b8 * 3) + b91 + (b17 * 2) + (b18 * 3) + b19 + (c12 * 5) + (d7 * 10) + (d12 * 10) + (d18 * 10) + (e2 * 5) + (e3 * 8) + (e4 * 5) + (e6 * 5) + (e7 * 10) + (e11 * 10) + (e12 * 10) + (e13 * 10) + (e14 * 10) + (e15 * 10) + (e16 * 5) + (e17 * 5);
        resultado = a / inteligencia_comercial;
        return resultado;
    }

    public double gestion_tramites_exportacion() {
        double resultado;
        double a = (b8 * 10) + (b91 * 3) + (b11 * 2) + (b18 * 3) + b19 + (c1 * 2) + (c4 * 5) + (c13 * 10) + (c15 * 5) + (d1 * 10) + (d2 * 4) + (d3 * 2) + (d4 * 2) + (d7 * 5) + (d12 * 10) + (d11 * 15) + (e7 * 10);
        resultado = a / gestion_tramites_exportacion;
        return resultado;
    }

    public double logistica() {
        double resultado;
        double a = b91 + (b18 * 3) + b19 + (c1 * 5) + (c11 * 8) + (c25 * 10) + (c1 * 10) + (d2 * 5) + (d3 * 2) + (d4 * 2) + (d7 * 3) + (d14 * 15) + (transporte * 10) + (d16 * 8) + (e7 * 5);
        resultado = a / logistica;
        return resultado;
    }

    public double distribucion_comercial() {
        double resultado;
        double a = (b15 * 2) + (b16 * 4) + b23 + b24 + (c1 * 3) + (c11 * 5) + (c19 * 8) + (d1 * 10) + (d2 * 5) + (d3 * 2) + (e16 * 10);
        resultado = a / distribucion_comercial;
        return resultado;
    }

    public double asociatividad() {
        double resultado;
        double a = (b18 * 15) + (b19 * 5);
        resultado = a / asociatividad;
        return resultado;
    }

    public double politica_precios() {
        double resultado;
        double a = (b4 * 5) + (b8 * 8) + (b23 * 5) + (c2 * 10) + (c3 * 2) + (c4 * 2) + (c5 * 5) + (c9) + (c10 * 2) + (c11 * 10) + (c20 * 5) + (c21 * 10) + (c22 * 10) + (d1 * 5) + (d12 * 10) + (rentabilidad_inversiones_exterior * 5) + (e7 * 5);
        resultado = a / politica_precios;
        return resultado;
    }

    public double promocion_tradicional() {
        double resultado;
        double a = (b4 * 5) + (b13 * 5) + (b14 * 2) + (b16) + (b17 * 3) + (b20) + b21 + b22 + c2 + (c4 * 2) + c7 + (c8 * 2) + c10 + (c11 * 3) + c18 * 7 + d1 * 5 + (d7 * 10) + (d17 * 15) + (d18 * 10) + (d19 * 15) + (e4 * 5) + (e5 * 5) + (e13 * 4);
        resultado = a / promocion_tradicional;
        return resultado;
    }

    public double promocion_internet() {
        double resultado;
        double a = b2 + b3 + b12 + (b13 * 10) + b14 + b16 + (b17 * 3) + c2 + c8 + c10 + c18 * 5 + (d1 * 5) + (d7 * 10) + (d20 * 20) + (d21 * 10) + (d22 * 10) + (e5 * 5);
        resultado = a / promocion_internet;
        return resultado;
    }

    public double responsabilidad_social() {
        double resultado;
        double a = (b20 * 10) + (b21 * 10) + (b22 * 10);
        resultado = a / responsabilidad_social;
        return resultado;
    }

    public double media_inter() {
        return (situacion_productiva() + estructura_empresarial() + situacion_financiear() + preparacion_motivacion_directiva() + politica_calidad() + dis_asociado() + diferenciacion() + adaptacion() + empaques() + politica_marca() + inteligencia_comercial() + gestion_tramites_exportacion() + logistica() + distribucion_comercial() + asociatividad() + politica_precios() + politica_precios() + promocion_tradicional() + promocion_internet() + responsabilidad_social()) / 19;
    }

    //////<><><><><><><><><><<><><><><><><><><><><><><>posicion exportadora
    public double getPosicionExportadora() {
        /* a es Ha exportado alguna vez, b ha exportado nunca pero adaptacion de producto > 6
         y capacidad adaptada, c no ha exportado poco adaptaddo pero situacion productiva ok y 
         d es sin adaptacion produtiva*/
        double a = 0.0, b = 0.0, c = 0.0, d = 0.0, posicion, indirecta, intensidad, exportando, expansion = 0.0;
        double prom, prom2;

        boolean logica = false;

        /* //// ------------------------------------------ calcular a -------////*/
        //discreta o continua
        if (this.getD1() == 5 || this.getD1() == 6 || this.getD1() == 3) {
            logica = true;
        }
        if (logica == true) {
            indirecta = -2;
        } else {
            indirecta = 0;
        }
        //Baja intensidad (menos del 10%) o sólo un territorio
        if (this.getD4() > 4) {
            if (this.getD2() > 6) {
                intensidad = 0;
            } else {
                intensidad = -2;
            }
        } else {
            intensidad = -2;
        }

        //exportando
        if (this.getD1() == 10 || this.getD1() == 5 || this.getD1() == 6 || this.getD1() == 3) {
            exportando = 8;
        } else {
            exportando = 0;
        }

        //En expansión (países y %)
        if ((exportando + intensidad + indirecta) > 5) {
            expansion = ((this.getD2() / 2) + (this.getD4() * facturacion / 10)) / 10;
        } else {
            expansion = 0;
        }

        prom = (this.preparacion_motivacion_directiva() + this.gestion_tramites_exportacion() + this.logistica() + this.inteligencia_comercial()) / 4;
        prom2 = ((this.adaptacion() * 2) + this.empaques() + this.dis_asociado() + this.politica_marca() + this.diferenciacion()) / 30;

        if ((exportando + intensidad + indirecta) == 4) {

            a = 4 + (prom + prom2 / 2);
        } else {
            if ((exportando + intensidad + indirecta) > 5) {
                a = exportando + intensidad + indirecta;
            } else {
                a = 0;
            }
        }

        /* ////---------------------------------------------calcular b ----------- ////*/
        double c143 = ((2 * this.situacion_productiva()) + this.situacion_financiear() + this.politica_calidad()) / 20;
        if (a == 0) {
            if (c143 > 1) {
                if (this.adaptacion() > 6) {
                    b = 3.5 + ((prom + prom2) / 2);
                } else {
                    b = 0;
                }
            }
        } else {
            b = 0;
        }

        /* ////-----------------------------------------calcular c -------- ////*/

        if ((a + b) == 0) {
            if (c143 > 1) {
                c = 1 + ((prom2 + c143) / 2);
            } else {
                c = 0;
            }
        } else {
            c = 0;
        }

        /* ////-----------------------------------------calcular d ----------- ////*/
        if ((a + b + c) == 0) {
            d = c143;
        } else {
            d = 0;
        }

        posicion = a + b + c + d;
        return posicion;
    }
    ///<><><><><><><><><><<><><><><><><><><><><><><>posicion esportadora

    public void getNombreD15HojaApoyo() {
        if (this.getD25() == 10 || this.getD25() == 4) {
            if (this.getC2() == 10) {
                this.setNameD15("Transporte Aéreo OK");
                this.setD15(10);
            } else if (this.getC2() == 7) {
                this.setNameD15("Revisar Transporte Aéreo");
                this.setD15(7);
            } else {
                this.setNameD15("Revisar Transporte Aéreo");
                this.setD15(0);
            }
        } else {
            if (this.getD25() == 15) {
                //z18
                if (this.getZ18() == "el carretero") {
                    this.setNameD15("Transporte Carretero OK");
                    this.setD15(7);
                } else {
                    if (this.getC25() == 0) {
                        this.setNameD15("Revisar Transporte Marítimo");
                        this.setD15(0);
                    } else {
                        this.setNameD15("Transporte Marítimo OK");
                        this.setD15(7);
                    }
                }
            } else {
                if (this.getD25() == 0) {
                    this.setNameD15("Revisar Transporte");
                    this.setD15(0);
                } else {
                    this.setNameD15("Transporte OK");
                    this.setD15(7);
                }
            }
        }
    }

    public String getZ18() {
        String nombre = "";

        if (this.vali9D2 == 1 || this.vali8D2 == 1 || this.vali7D2 == 1 || this.vali6D2 == 1 || this.vali5D2 == 1 || this.vali4D2 == 1 || this.vali3D2 == 1) {
            nombre = "el marítimo";
        } else if (this.vali2D2 == 1 || this.vali1D2 == 1) {
            nombre = "el carretero";
        } else {
            nombre = getZ34();
        }

        return nombre;
    }

    public String getZ34() {
        String nombre = "";
        if (this.vali9D3 == 1 || this.vali8D3 == 1 || this.vali7D3 == 1 || this.vali6D3 == 1 || this.vali5D3 == 1 || this.vali4D3 == 1 || this.vali3D3 == 1) {
            nombre = "el maritimo";
        } else if (this.vali2D3 == 1 || this.vali1D3 == 1) {
            nombre = "el carretero";
        } else {
            nombre = "el maritimo";
        }

        return nombre;
    }

    public void rentabilidad() {
        if (this.getD6() == 0) {
            this.setAA79(5000);
            this.setAA80(10000);
        } else if (this.getD6() == 3) {
            this.setAA79(10000);
            this.setAA80(20000);
        } else if (this.getD6() == 4) {
            this.setAA79(20000);
            this.setAA80(50000);
        } else if (this.getD6() == 7) {
            this.setAA79(50000);
            this.setAA80(100000);
        } else if (this.getD6() == 8) {
            this.setAA79(100000);
            this.setAA80(200000);
        } else if (this.getD6() == 9) {
            this.setAA79(200000);
            this.setAA80(0);
            rentabilidad_inversiones_exterior = 0.0;
        } else if (this.getD6() == 10) {
            this.setAA79(400000);
            this.setAA80(0);
            rentabilidad_inversiones_exterior = 0.0;
        }

        this.getRentabilidadSuperInfer();
        this.rangoFacturacion();
        this.getMargenBruto();

        //beneficion exportacion
        this.setBenExpInf((this.getFact_infer() * this.getV66() * this.getmBruto_infer() * this.getIncDemandInf()) - (this.getFact_infer() * this.getV55() * this.getmBruto_infer()));
        this.setBenExpSup((this.getFact_superior() * this.getX66() * this.getmBrutoSup() * this.getIncDemandSup()) - (this.getFact_superior() * this.getX55() * this.getmBrutoSup()));

        //inversion exportacion
        this.setInvExpInf(this.getAA79() / 2);
        this.setInvExpoSup(this.getAA80() / 2);

        //B/FacturacionAnual
        this.setBFactAnualInf((this.getBenExpInf() - this.getInvExpInf()) / this.getFact_infer());
        this.setBFactAnualSup((this.getBenExpSup() - this.getInvExpoSup()) / this.getFact_superior());

        //B-Inversion
        this.setBInversionInf(this.getBenExpInf() - this.getInvExpInf());
        this.setBInversionSup(this.getBenExpSup() - this.getInvExpoSup());

        //BNeto
        this.setBNetoInf(this.getBInversionInf() / this.getFact_infer());
        this.setBNetoSup(this.getBInversionSup() / this.getFact_superior());

        if (this.getAA79() == 0 || this.getAA80() == 0) {
            rentabilidad_inversiones_exterior = 0.0;
        } else {
            if ((this.getBNetoInf() + this.getBNetoSup()) / 2 < 0) {
                rentabilidad_inversiones_exterior = 0.0;
            } else if ((this.getBNetoInf() + this.getBNetoSup()) / 2 > 25) {
                rentabilidad_inversiones_exterior = 10.0;
            } else {
                rentabilidad_inversiones_exterior = ((this.getBNetoInf() + this.getBNetoSup()) / 2) * 40;
            }
        }
    }

    public void getRentabilidadSuperInfer() {
        if (this.d5 == 2) {
            this.v66 = 0.02;
            this.setX66(0.05);
        } else if (this.d5 == 4) {
            this.v66 = 0.05;
            this.setX66(0.10);
        } else if (this.d5 == 6) {
            this.v66 = 0.10;
            this.setX66(0.20);
        } else if (this.d5 == 8) {
            this.v66 = 0.20;
            this.setX66(0.40);
        } else if (this.d5 == 10) {
            this.v66 = 0.40;
            this.setX66(0.60);
        } else {
            this.v66 = 0.01;
            this.setX66(0.02);
        }

        if (this.d4 == 2) {
            this.v55 = 0.02;
            this.setX55(0.05);
        } else if (this.d4 == 4) {
            this.v55 = 0.05;
            this.setX55(0.10);
        } else if (this.d4 == 6) {
            this.v55 = 0.10;
            this.setX55(0.20);
        } else if (this.d4 == 8) {
            this.v55 = 0.20;
            this.setX55(0.40);
        } else if (this.d4 == 10) {
            this.v55 = 0.40;
            this.setX55(0.60);
        } else {
            this.v55 = 0.01;
            this.setX55(0.02);
        }
    }

    public void rangoFacturacion() {
        if (this.getA12() == 1) {
            this.setFact_infer(30000);
            this.setFact_superior(50000);
        } else if (this.getA12() == 2) {
            this.setFact_infer(50000);
            this.setFact_superior(100000);
        } else if (this.getA12() == 3) {
            this.setFact_infer(100000);
            this.setFact_superior(250000);
        } else if (this.getA12() == 5) {
            this.setFact_infer(250000);
            this.setFact_superior(500000);
        } else if (this.getA12() == 7) {
            this.setFact_infer(500000);
            this.setFact_superior(1000000);
        }
    }

    public void empleadoPermanente(int idcontrato) {
        EmpresaCompleta empresa = new EmpresaCompleta();
        EmpresaCompletaDaoImpl empDao = new EmpresaCompletaDaoImpl();

        Contrato contrato = new Contrato();
        ContratoDaoImpl contraDao = new ContratoDaoImpl();
        contrato = contraDao.findById(idcontrato);

        empresa = empDao.findByIdContrato(contrato);

        if (empresa != null) {
            int emp_permanente = empresa.getNumeroEmpleadosPermanente();
            if (emp_permanente == 1) {
                //this.a11_1 = 1.5; este es el valor verdadero, no se porque se quiebra cuando paso esta variable a double
                this.a11_1 = 1;
            } else if (emp_permanente == 2) {
                this.a11_1 = 2;
            } else if (emp_permanente == 3 || emp_permanente == 4) {
                this.a11_1 = 0;
            } else if (emp_permanente == 5) {
                this.a11_1 = 4;
            } else if (emp_permanente == 6) {
                this.a11_1 = 7;
            }
        } else {
            this.a11_1 = 0;
        }
    }

    public void facturacionAnual(int idcontrato) {
        EmpresaCompleta empresa = new EmpresaCompleta();
        EmpresaCompletaDaoImpl empDao = new EmpresaCompletaDaoImpl();

        Contrato contrato = new Contrato();
        ContratoDaoImpl contraDao = new ContratoDaoImpl();
        contrato = contraDao.findById(idcontrato);

        empresa = empDao.findByIdContrato(contrato);

        if (empresa != null) {
            this.a12 = empresa.getFacturacionAnual();

        } else {
            this.a12 = 0;
        }
    }

    public void getMargenBruto() {
        if (this.getC2() == 10) {
            this.setmBruto_infer(0.50);
            this.setmBrutoSup(0.60);
        } else if (this.getC2() == 7) {
            this.setmBruto_infer(0.33);
            this.setmBrutoSup(0.50);
        } else if (this.getC2() == 5) {
            this.setmBruto_infer(0.17);
            this.setmBrutoSup(0.33);
        } else if (this.getC2() == 3) {
            this.setmBruto_infer(0.90);
            this.setmBrutoSup(0.17);
        } else if (this.getC2() == 0) {
            this.setmBruto_infer(0.05);
            this.setmBrutoSup(0.05);
        }
    }

    public void getIncrementoDemanda() {
        if (this.getB6() == 10) {
            this.setIncDemandInf(1.2);
            this.setIncDemandSup(1.4);
        } else if (this.getB6() == 7) {
            this.setIncDemandInf(1.1);
            this.setIncDemandSup(1.3);
        } else if (this.getB6() == 5) {
            this.setIncDemandInf(1);
            this.setIncDemandSup(1.05);
        } else if (this.getB6() == 1) {
            this.setIncDemandInf(0.90);
            this.setIncDemandSup(0.95);
        } else if (this.getB6() == 0) {
            this.setIncDemandInf(0.90);
            this.setIncDemandSup(0.95);
        }
    }

    /*getter y setters*/
    /*----------------*/
    public int getB1() {
        return b1;
    }

    public void setB1(int b1) {
        this.b1 = b1;
    }

    public int getB2() {
        return b2;
    }

    public void setB2(int b2) {
        this.b2 = b2;
    }

    public int getB3() {
        return b3;
    }

    public void setB3(int b3) {
        this.b3 = b3;
    }

    public int getB4() {
        return b4;
    }

    public void setB4(int b4) {
        this.b4 = b4;
    }

    public int getB5() {
        return b5;
    }

    public void setB5(int b5) {
        this.b5 = b5;
    }

    public int getB6() {
        return b6;
    }

    public void setB6(int b6) {
        this.b6 = b6;
    }

    public int getB7() {
        return b7;
    }

    public void setB7(int b7) {
        this.b7 = b7;
    }

    public int getB8() {
        return b8;
    }

    public void setB8(int b8) {
        this.b8 = b8;
    }

    public int getB92() {
        return b92;
    }

    public void setB92(int b92) {
        this.b92 = b92;
    }

    public int getB10() {
        return b10;
    }

    public void setB10(int b10) {
        this.b10 = b10;
    }

    public int getB11() {
        return b11;
    }

    public void setB11(int b11) {
        this.b11 = b11;
    }

    public int getB12() {
        return b12;
    }

    public void setB12(int b12) {
        this.b12 = b12;
    }

    public int getB13() {
        return b13;
    }

    public void setB13(int b13) {
        this.b13 = b13;
    }

    public int getB14() {
        return b14;
    }

    public void setB14(int b14) {
        this.b14 = b14;
    }

    public int getB15() {
        return b15;
    }

    public void setB15(int b15) {
        this.b15 = b15;
    }

    public int getB16() {
        return b16;
    }

    public void setB16(int b16) {
        this.b16 = b16;
    }

    public int getB17() {
        return b17;
    }

    public void setB17(int b17) {
        this.b17 = b17;
    }

    public int getB18() {
        return b18;
    }

    public void setB18(int b18) {
        this.b18 = b18;
    }

    public int getB19() {
        return b19;
    }

    public void setB19(int b19) {
        this.b19 = b19;
    }

    public int getB20() {
        return b20;
    }

    public void setB20(int b20) {
        this.b20 = b20;
    }

    public int getB21() {
        return b21;
    }

    public void setB21(int b21) {
        this.b21 = b21;
    }

    public int getB22() {
        return b22;
    }

    public void setB22(int b22) {
        this.b22 = b22;
    }

    public int getB23() {
        return b23;
    }

    public void setB23(int b23) {
        this.b23 = b23;
    }

    public int getB24() {
        return b24;
    }

    public void setB24(int b24) {
        this.b24 = b24;
    }

    public int getC1() {
        return c1;
    }

    public void setC1(int c1) {
        this.c1 = c1;
    }

    public int getC2() {
        return c2;
    }

    public void setC2(int c2) {
        this.c2 = c2;
    }

    public int getC3() {
        return c3;
    }

    public void setC3(int c3) {
        this.c3 = c3;
    }

    public int getC4() {
        return c4;
    }

    public void setC4(int c4) {
        this.c4 = c4;
    }

    public int getC5() {
        return c5;
    }

    public void setC5(int c5) {
        this.c5 = c5;
    }

    public double getC6() {
        return c6;
    }

    public void setC6(double c6) {
        this.c6 = c6;
    }

    public int getC7() {
        return c7;
    }

    public void setC7(int c7) {
        this.c7 = c7;
    }

    public int getC8() {
        return c8;
    }

    public void setC8(int c8) {
        this.c8 = c8;
    }

    public int getC9() {
        return c9;
    }

    public void setC9(int c9) {
        this.c9 = c9;
    }

    public int getC10() {
        return c10;
    }

    public void setC10(int c10) {
        this.c10 = c10;
    }

    public double getC11() {
        return c11;
    }

    public void setC11(double c11) {
        this.c11 = c11;
    }

    public int getC12() {
        return c12;
    }

    public void setC12(int c12) {
        this.c12 = c12;
    }

    public int getC13() {
        return c13;
    }

    public void setC13(int c13) {
        this.c13 = c13;
    }

    public int getC14() {
        return c14;
    }

    public void setC14(int c14) {
        this.c14 = c14;
    }

    public int getC15() {
        return c15;
    }

    public void setC15(int c15) {
        this.c15 = c15;
    }

    public int getC16() {
        return c16;
    }

    public void setC16(int c16) {
        this.c16 = c16;
    }

    public int getC17() {
        return c17;
    }

    public void setC17(int c17) {
        this.c17 = c17;
    }

    public int getC18() {
        return c18;
    }

    public void setC18(int c18) {
        this.c18 = c18;
    }

    public int getC19() {
        return c19;
    }

    public void setC19(int c19) {
        this.c19 = c19;
    }

    public int getC20() {
        return c20;
    }

    public void setC20(int c20) {
        this.c20 = c20;
    }

    public int getC21() {
        return c21;
    }

    public void setC21(int c21) {
        this.c21 = c21;
    }

    public int getC22() {
        return c22;
    }

    public void setC22(int c22) {
        this.c22 = c22;
    }

    public int getC23() {
        return c23;
    }

    public void setC23(int c23) {
        this.c23 = c23;
    }

    public int getC24() {
        return c24;
    }

    public void setC24(int c24) {
        this.c24 = c24;
    }

    public int getD1() {
        return d1;
    }

    public void setD1(int d1) {
        this.d1 = d1;
    }

    public int getD2() {
        return d2;
    }

    public void setD2(int d2) {
        this.d2 = d2;
    }

    public int getD3() {
        return d3;
    }

    public void setD3(int d3) {
        this.d3 = d3;
    }

    public int getD4() {
        return d4;
    }

    public void setD4(int d4) {
        this.d4 = d4;
    }

    public int getD5() {
        return d5;
    }

    public void setD5(int d5) {
        this.d5 = d5;
    }

    public int getD6() {
        return d6;
    }

    public void setD6(int d6) {
        this.d6 = d6;
    }

    public Double getD7() {
        return d7;
    }

    public void setD7(Double d7) {
        this.d7 = d7;
    }

    public int getD8() {
        return d8;
    }

    public void setD8(int d8) {
        this.d8 = d8;
    }

    public int getD9() {
        return d9;
    }

    public void setD9(int d9) {
        this.d9 = d9;
    }

    public int getD10() {
        return d10;
    }

    public void setD10(int d10) {
        this.d10 = d10;
    }

    public int getD11() {
        return d11;
    }

    public void setD11(int d11) {
        this.d11 = d11;
    }

    public double getD12() {
        return d12;
    }

    public void setD12(double d12) {
        this.d12 = d12;
    }

    public int getD13() {
        return d13;
    }

    public void setD13(int d13) {
        this.d13 = d13;
    }

    public int getD14() {
        return d14;
    }

    public void setD14(int d14) {
        this.d14 = d14;
    }

    public int getD15() {
        return d15;
    }

    public void setD15(int d15) {
        this.d15 = d15;
    }

    public int getD16() {
        return d16;
    }

    public void setD16(int d16) {
        this.d16 = d16;
    }

    public int getD17() {
        return d17;
    }

    public void setD17(int d17) {
        this.d17 = d17;
    }

    public int getD18() {
        return d18;
    }

    public void setD18(int d18) {
        this.d18 = d18;
    }

    public int getD19() {
        return d19;
    }

    public void setD19(int d19) {
        this.d19 = d19;
    }

    public int getD20() {
        return d20;
    }

    public void setD20(int d20) {
        this.d20 = d20;
    }

    public int getD21() {
        return d21;
    }

    public void setD21(int d21) {
        this.d21 = d21;
    }

    public int getD22() {
        return d22;
    }

    public void setD22(int d22) {
        this.d22 = d22;
    }

    public Double getD23() {
        return d23;
    }

    public void setD23(Double d23) {
        this.d23 = d23;
    }

    public int getE1() {
        return e1;
    }

    public void setE1(int e1) {
        this.e1 = e1;
    }

    public int getE2() {
        return e2;
    }

    public void setE2(int e2) {
        this.e2 = e2;
    }

    public int getE3() {
        return e3;
    }

    public void setE3(int e3) {
        this.e3 = e3;
    }

    public int getE4() {
        return e4;
    }

    public void setE4(int e4) {
        this.e4 = e4;
    }

    public int getE5() {
        return e5;
    }

    public void setE5(int e5) {
        this.e5 = e5;
    }

    public int getE6() {
        return e6;
    }

    public void setE6(int e6) {
        this.e6 = e6;
    }

    public int getE7() {
        return e7;
    }

    public void setE7(int e7) {
        this.e7 = e7;
    }

    public int getE8() {
        return e8;
    }

    public void setE8(int e8) {
        this.e8 = e8;
    }

    public int getE9() {
        return e9;
    }

    public void setE9(int e9) {
        this.e9 = e9;
    }

    public double getE10() {
        return e10;
    }

    public void setE10(double e10) {
        this.e10 = e10;
    }

    public int getE11() {
        return e11;
    }

    public void setE11(int e11) {
        this.e11 = e11;
    }

    public int getE12() {
        return e12;
    }

    public void setE12(int e12) {
        this.e12 = e12;
    }

    public int getE13() {
        return e13;
    }

    public void setE13(int e13) {
        this.e13 = e13;
    }

    public int getE14() {
        return e14;
    }

    public void setE14(int e14) {
        this.e14 = e14;
    }

    public int getE15() {
        return e15;
    }

    public void setE15(int e15) {
        this.e15 = e15;
    }

    public int getE16() {
        return e16;
    }

    public void setE16(int e16) {
        this.e16 = e16;
    }

    public int getE17() {
        return e17;
    }

    public void setE17(int e17) {
        this.e17 = e17;
    }

    /*getter y setters*/
    /*----------------*/
    public int getB91() {
        return b91;
    }

    public void setB91(int b91) {
        this.b91 = b91;
    }

    public int getC25() {
        return c25;
    }

    public void setC25(int c25) {
        this.c25 = c25;
    }

    public int getA11_1() {
        return a11_1;
    }

    public void setA11_1(int a11_1) {
        this.a11_1 = a11_1;
    }

    public int getA12() {
        return a12;
    }

    public void setA12(int a12) {
        this.a12 = a12;
    }

    public int getD25() {
        return d25;
    }

    public void setD25(int d25) {
        this.d25 = d25;
    }

    /**
     * @return the nameD15
     */
    public String getNameD15() {
        return nameD15;
    }

    /**
     * @param nameD15 the nameD15 to set
     */
    public void setNameD15(String nameD15) {
        this.nameD15 = nameD15;
    }

    public int getSumD2() {
        return sumD2;
    }

    public void setSumD2(int sumD2) {
        this.sumD2 = sumD2;
    }

    public int getSumD3() {
        return sumD3;
    }

    public void setSumD3(int sumD3) {
        this.sumD3 = sumD3;
    }

    public int getAA79() {
        return AA79;
    }

    public void setAA79(int AA79) {
        this.AA79 = AA79;
    }

    public int getAA80() {
        return AA80;
    }

    public void setAA80(int AA80) {
        this.AA80 = AA80;
    }

    public int getVali1D2() {
        return vali1D2;
    }

    public void setVali1D2(int vali1D2) {
        this.vali1D2 = vali1D2;
    }

    public int getVali2D2() {
        return vali2D2;
    }

    public void setVali2D2(int vali2D2) {
        this.vali2D2 = vali2D2;
    }

    public int getVali3D2() {
        return vali3D2;
    }

    public void setVali3D2(int vali3D2) {
        this.vali3D2 = vali3D2;
    }

    public int getVali4D2() {
        return vali4D2;
    }

    public void setVali4D2(int vali4D2) {
        this.vali4D2 = vali4D2;
    }

    public int getVali5D2() {
        return vali5D2;
    }

    public void setVali5D2(int vali5D2) {
        this.vali5D2 = vali5D2;
    }

    public int getVali6D2() {
        return vali6D2;
    }

    public void setVali6D2(int vali6D2) {
        this.vali6D2 = vali6D2;
    }

    public int getVali7D2() {
        return vali7D2;
    }

    public void setVali7D2(int vali7D2) {
        this.vali7D2 = vali7D2;
    }

    public int getVali8D2() {
        return vali8D2;
    }

    public void setVali8D2(int vali8D2) {
        this.vali8D2 = vali8D2;
    }

    public int getVali9D2() {
        return vali9D2;
    }

    public void setVali9D2(int vali9D2) {
        this.vali9D2 = vali9D2;
    }

    public int getVali10D2() {
        return vali10D2;
    }

    public void setVali10D2(int vali10D2) {
        this.vali10D2 = vali10D2;
    }

    public int getVali11D2() {
        return vali11D2;
    }

    public void setVali11D2(int vali11D2) {
        this.vali11D2 = vali11D2;
    }

    public int getVali1D3() {
        return vali1D3;
    }

    public void setVali1D3(int vali1D3) {
        this.vali1D3 = vali1D3;
    }

    public int getVali2D3() {
        return vali2D3;
    }

    public void setVali2D3(int vali2D3) {
        this.vali2D3 = vali2D3;
    }

    public int getVali3D3() {
        return vali3D3;
    }

    public void setVali3D3(int vali3D3) {
        this.vali3D3 = vali3D3;
    }

    public int getVali4D3() {
        return vali4D3;
    }

    public void setVali4D3(int vali4D3) {
        this.vali4D3 = vali4D3;
    }

    public int getVali5D3() {
        return vali5D3;
    }

    public void setVali5D3(int vali5D3) {
        this.vali5D3 = vali5D3;
    }

    public int getVali6D3() {
        return vali6D3;
    }

    public void setVali6D3(int vali6D3) {
        this.vali6D3 = vali6D3;
    }

    public int getVali7D3() {
        return vali7D3;
    }

    public void setVali7D3(int vali7D3) {
        this.vali7D3 = vali7D3;
    }

    public int getVali8D3() {
        return vali8D3;
    }

    public void setVali8D3(int vali8D3) {
        this.vali8D3 = vali8D3;
    }

    public int getVali9D3() {
        return vali9D3;
    }

    public void setVali9D3(int vali9D3) {
        this.vali9D3 = vali9D3;
    }

    public int getVali10D3() {
        return vali10D3;
    }

    public void setVali10D3(int vali10D3) {
        this.vali10D3 = vali10D3;
    }

    public int getVali11D3() {
        return vali11D3;
    }

    public void setVali11D3(int vali11D3) {
        this.vali11D3 = vali11D3;
    }

    public double getX66() {
        return x66;
    }

    public void setX66(double x66) {
        this.x66 = x66;
    }

    public double getV66() {
        return v66;
    }

    public void setV66(double v66) {
        this.v66 = v66;
    }

    public double getX55() {
        return x55;
    }

    public void setX55(double x55) {
        this.x55 = x55;
    }

    public double getV55() {
        return v55;
    }

    public void setV55(double v55) {
        this.v55 = v55;
    }

    public double getmBruto_infer() {
        return mBruto_infer;
    }

    public void setmBruto_infer(double mBruto_infer) {
        this.mBruto_infer = mBruto_infer;
    }

    public double getmBrutoSup() {
        return mBrutoSup;
    }

    public void setmBrutoSup(double mBrutoSup) {
        this.mBrutoSup = mBrutoSup;
    }

    public double getIncDemandSup() {
        return incDemandSup;
    }

    public void setIncDemandSup(double incDemandSup) {
        this.incDemandSup = incDemandSup;
    }

    public double getIncDemandInf() {
        return incDemandInf;
    }

    public void setIncDemandInf(double incDemandInf) {
        this.incDemandInf = incDemandInf;
    }

    public double getBenExpSup() {
        return benExpSup;
    }

    public void setBenExpSup(double benExpSup) {
        this.benExpSup = benExpSup;
    }

    public double getBenExpInf() {
        return benExpInf;
    }

    public void setBenExpInf(double benExpInf) {
        this.benExpInf = benExpInf;
    }

    public double getInvExpoSup() {
        return invExpoSup;
    }

    public void setInvExpoSup(double invExpoSup) {
        this.invExpoSup = invExpoSup;
    }

    public double getInvExpInf() {
        return invExpInf;
    }

    public void setInvExpInf(double invExpInf) {
        this.invExpInf = invExpInf;
    }

    public double getBFactAnualSup() {
        return BFactAnualSup;
    }

    public void setBFactAnualSup(double BFactAnualSup) {
        this.BFactAnualSup = BFactAnualSup;
    }

    public double getBFactAnualInf() {
        return BFactAnualInf;
    }

    public void setBFactAnualInf(double BFactAnualInf) {
        this.BFactAnualInf = BFactAnualInf;
    }

    public double getBInversionSup() {
        return BInversionSup;
    }

    public void setBInversionSup(double BInversionSup) {
        this.BInversionSup = BInversionSup;
    }

    public double getBInversionInf() {
        return BInversionInf;
    }

    public void setBInversionInf(double BInversionInf) {
        this.BInversionInf = BInversionInf;
    }

    public double getBNetoSup() {
        return BNetoSup;
    }

    public void setBNetoSup(double BNetoSup) {
        this.BNetoSup = BNetoSup;
    }

    public double getBNetoInf() {
        return BNetoInf;
    }

    public void setBNetoInf(double BNetoInf) {
        this.BNetoInf = BNetoInf;
    }

    public int getFact_superior() {
        return fact_superior;
    }

    public void setFact_superior(int fact_superior) {
        this.fact_superior = fact_superior;
    }

    public int getFact_infer() {
        return fact_infer;
    }

    public void setFact_infer(int fact_infer) {
        this.fact_infer = fact_infer;
    }

    public int getId_contrato() {
        return id_contrato;
    }

    public void setId_contrato(int id_contrato) {
        this.id_contrato = id_contrato;
    }
}
