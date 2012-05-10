/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TimLog;

import TimBD.JugadorBD;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;




/**
 *
 * @author Jonas
 */
public class Jugador extends JugadorBD{
    
    private static LinkedList<Jugador> conectados = new LinkedList();
    
    private static int puerto;
    private static String servidor;
    
    private char[] iniciales;
    private boolean ocupado;
    private int marcador; 
   
    /**
     * Construye un Jugador y lo agrega a la lista de conectados y listos para jugar
     * @param user nombre de usuario del Jugador
     * @param mail correo electronico del jugador
     * @param name nombre del Jugador
     * @param apel apellido del Jugador
     */
    public Jugador(String user,String mail,String name,String apel){
        super(user);
        correo = mail;
        nombre = name;
        apellido = apel;
        marcador = 0;
        ocupado = false;
        iniciales = new char[2];
        iniciales[0] = name.toUpperCase().charAt(0);
        iniciales[1] = name.toUpperCase().charAt(1);
        
    }
    
    /**
     * Quita el elemneto de la Lista de conectados
     * @param es Jugador que va Salir del juego
     */
    public static synchronized void desconectar(Jugador es){
        conectados.remove(es);
        es.ocupado = true;
    }
    
    /**
     * Añade a la lista de conectados al usuario
     * @param es Usuario que se ha conectado
     */
    public static synchronized void conectar(Jugador es){
        conectados.add(es);
        es.ocupado = false;
    }
    
    /**
     * Obtiene una lista de usuarios que se encuentran conectados
     * regresando el nombre de usuario de cada jugador separados
     * por un espacio
     * @return Nomre de usuario de cada jugador conectado
     */
    public static synchronized String[] getStringConnected(){
        String []res = new String[conectados.size()];
        for(int i = 0; i < res.length;i++){
            res[i] =  conectados.get(i).getUsuario();
        }
        return res;
    }
    
    /**
     * Regresa el Nombre de Usuario del jugador Actual
     * @return 
     */
    public String getUsuario(){
        return usuario;
    }
    
    

   
    
    
}
