/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webbanhang2.service;

/**
 *
 * @author fkien
 */
public interface EmailService {
    public boolean sendSimpleMessage(String to, String subject, String text);
    
    public boolean sendHTMLMessage(String to, String subject, String text);
}
