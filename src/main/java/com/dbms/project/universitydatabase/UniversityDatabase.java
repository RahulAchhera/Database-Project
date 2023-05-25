/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.dbms.project.universitydatabase;

import javax.swing.*;

/**
 *
 * @author Rahul
 */
public class UniversityDatabase {

    public static void main(String[] args) {
        
    try { 
        UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel"); 
    } catch(Exception ignored){}
      LoginPage lg = new LoginPage();
      lg.setVisible(true);
    }
}
