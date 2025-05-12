package za.ac.tut.web;

import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Contacts;
import za.ac.tut.entities.Employee;
import java.io.IOException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @EJB
    private EmployeeFacadeLocal employeeFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long empId = Long.parseLong(request.getParameter("empId"));
        String fullName = request.getParameter("fullName");
        Double salary = Double.parseDouble(request.getParameter("salary"));
        String position = request.getParameter("position");
        String department = request.getParameter("department");
        String contact1 = request.getParameter("contact1");
        String contact2 = request.getParameter("contact2");
        String email = request.getParameter("email");


        Employee employee = employeeFacade.find(empId);

        if (employee != null) {
            
            employee.setEmpFullname(fullName);
            employee.setSalary(salary);
            employee.setPosition(position);
            employee.setDepartment(department);
            
            
            List<Contacts> empContacts = employee.getContacts();

           
            employeeFacade.edit(employee);

           
            request.setAttribute("fullName", fullName);
            request.setAttribute("empId", empId);
            request.setAttribute("position", position);
            request.setAttribute("department", department);
            request.setAttribute("salary", salary);
            request.setAttribute("contact1", contact1);
            request.setAttribute("contact2", contact2);
            request.setAttribute("email", email);

            
            RequestDispatcher dispatcher = request.getRequestDispatcher("update_outcome.jsp");
            dispatcher.forward(request, response);
        } else {
            
            response.sendRedirect("user_not_found_error.jsp");
        }
    }
}
