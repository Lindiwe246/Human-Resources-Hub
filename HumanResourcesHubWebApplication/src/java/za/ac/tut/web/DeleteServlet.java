/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Employee;

/**
 *
 * @author mabhe
 */
public class DeleteServlet extends HttpServlet {

    @EJB EmployeeFacadeLocal efl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long empId = Long.parseLong(request.getParameter("empId"));
        request.setAttribute("empId", empId);
        
        Employee employee = createEmployee(empId);
        efl.remove(employee);
        request.setAttribute("employee", employee);
        
        RequestDispatcher rd = request.getRequestDispatcher("delete_outcome.jsp");
        rd.forward(request, response);
    }

    private Employee createEmployee(Long empId){
        Employee employee = new Employee();
        employee.setId(empId);
        return employee;
    }

}
