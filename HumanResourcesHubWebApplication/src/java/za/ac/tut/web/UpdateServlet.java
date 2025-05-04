/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import com.sun.xml.registry.uddi.bindings_v2_2.Contact;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ContactsFacadeLocal;
import za.ac.tut.ejb.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Contacts;
import za.ac.tut.entities.Employee;

/**
 *
 * @author Lindi
 */
public class UpdateServlet extends HttpServlet {
    @EJB
    private EmployeeFacadeLocal efl;
    @EJB
    private ContactsFacadeLocal cfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long staffNo = Long.parseLong(request.getParameter("staffno"));
        String fullnames = request.getParameter("fullnames");
        Double salary = Double.parseDouble(request.getParameter("salary")); 
        String position = request.getParameter("position");
        String department = request.getParameter("department");
        String phoneNo = request.getParameter("phoneNo");
        String altPhoneNo = request.getParameter("altPhone");
        String email = request.getParameter("email");
        
        
        List<Contacts> contacts = createContacts(phoneNo, altPhoneNo, email);
        Employee emp = efl.find(staffNo);
        
        emp.setEmpFullname(fullnames);
        emp.setSalary(salary);
        emp.setDepartment(department);
        emp.setPosition(position);
        emp.setContacts(contacts);
        
        efl.edit(emp);
        
        RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
        rd.forward(request, response);
        
        
    }

    private List<Contacts> createContacts(String phoneNo, String altPhoneNo, String email) {
       List<Contacts> contacts = new ArrayList<>();
       Contacts phone= new Contacts(phoneNo);
       Contacts altPhone = new Contacts(altPhoneNo);
       Contacts empEmail = new Contacts(email);
       
       contacts.add(phone);
       contacts.add(altPhone);
       contacts.add(empEmail);
       
       return contacts;
    }
   

}
