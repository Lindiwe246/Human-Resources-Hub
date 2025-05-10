/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Contacts;
import za.ac.tut.entities.Employee;

public class CreateServlet extends HttpServlet {
    
    @EJB EmployeeFacadeLocal efl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        try {
            Long empId = Long.parseLong(request.getParameter("empId"));
            String fullName = request.getParameter("fullName");
            String department = request.getParameter("department");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String position = request.getParameter("position");
            String email = request.getParameter("email");
            String contact1 = request.getParameter("contact1");
            String contact2 = request.getParameter("contact2");
            String creationDate = request.getParameter("creationDate");
            SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
            Date date = sdf.parse("creationDate");

            
            Contacts mail = new Contacts(email);
            Contacts cont1 = new Contacts(contact1);
            Contacts cont2 = new Contacts(contact2);
            
            List<Contacts> contList = new ArrayList<>();
            contList.add(mail);
            contList.add(cont1);
            contList.add(cont2);
            
            Employee employee = new Employee(empId, fullName,  department,  salary, position, contList, date);
            efl.create(employee);
            RequestDispatcher disp = request.getRequestDispatcher("create_outcome.jsp");
            disp.forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
      
    }
}
