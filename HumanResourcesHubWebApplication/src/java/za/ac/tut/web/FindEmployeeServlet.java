package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.EmployeeFacadeLocal;
import za.ac.tut.entities.Employee;

@WebServlet(name="FindEmployeeServlet", urlPatterns="FindEmployeeServlet.do")
public class FindEmployeeServlet extends HttpServlet {
    @EJB
    private EmployeeFacadeLocal employeeFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Long empId = Long.parseLong(request.getParameter("empId"));
        Employee employee = employeeFacade.find(empId);

        if (employee == null) {
            request.setAttribute("error", "Employee not found!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("find_employee.jsp");
            dispatcher.forward(request, response);
        } else {

            request.setAttribute("employee", employee);
            RequestDispatcher dispatcher = request.getRequestDispatcher("update_employee.jsp");
            dispatcher.forward(request, response);
        }
    }
}
