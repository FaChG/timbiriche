/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servidor;

import TimLog.Jugador;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Inet4Address;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jonas
 */
public class Servidor {

    private static int PUERTO = 2002;
    private static int MAX = 100;
    private List<Jugador> conectados;
    private ServerSocket socket;
    private Queue<String> pila;
    private ObjectInputStream in;
    private ObjectOutputStream out;
    
    public Servidor() {
        conectados = new LinkedList<Jugador>();
        pila = new ArrayBlockingQueue<String>(MAX);
        try {
            socket = new ServerSocket(PUERTO, MAX, Inet4Address.getByName("0.0.0.0"));
        } catch (IOException ex) {
            Logger.getLogger(Servidor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void conectar(Jugador user) throws IOException, ClassNotFoundException{
        conectados.add(user);
        Socket cliente = socket.accept();
        in = new ObjectInputStream(cliente.getInputStream());
        String message = (String) in.readObject();
        System.out.println("Message Received: " + message);
        
    }
}