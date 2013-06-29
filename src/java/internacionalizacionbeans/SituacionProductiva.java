/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package internacionalizacionbeans;

/**
 *
 * @author Dave
 */
public class SituacionProductiva {
    
    private int[] b = new int[23];
    final int poderacion = 24;

    public int[] getB() {
        return b;
    }

    public void setB(int[] b) {
        this.b = b;
    }
    
    public double media () {
        double m = 0.0;
        int sumatoria = 0;
        for (int i=0; i<b.length; i++){
            sumatoria += b[i];
        }
        m = sumatoria / b.length;
        
         return m;
    }
    
}
