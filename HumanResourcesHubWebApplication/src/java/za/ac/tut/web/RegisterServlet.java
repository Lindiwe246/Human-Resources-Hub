/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ManagerFacadeLocal;
import za.ac.tut.entities.Manager;


/**
 *
 * @author Lindi
 */
public class RegisterServlet extends HttpServlet {
    
    @EJB
    private ManagerFacadeLocal mfl;
            
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Long employeeId = Long.parseLong(request.getParameter("employeeId"));
         String fullnames = request.getParameter("fullnames");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String gender = request.getParameter("gender");
         Integer age = Integer.parseInt(request.getParameter("age"));
         Date creationDate = new Date();
         
            // Create manager with all fields
            Manager mgr = new Manager();
            mgr.setId(employeeId);
            mgr.setFullNames(fullnames);
            mgr.setEmail(email);
            mgr.setPassword(password);
            mgr.setGender(gender != null ? gender : "Not specified");
            mgr.setAge(age != null ? age : 0);
            mgr.setCreationDate(creationDate);

            mfl.create(mgr);
         
         RequestDispatcher rd = request.getRequestDispatcher("register_outcome.jsp");
         rd.forward(request, response);
         
    }

}
