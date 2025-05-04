package za.ac.tut.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.entities.Contacts;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-04T12:19:48")
@StaticMetamodel(Employee.class)
public class Employee_ { 

    public static volatile SingularAttribute<Employee, Long> id;
    public static volatile SingularAttribute<Employee, String> position;
    public static volatile SingularAttribute<Employee, String> department;
    public static volatile SingularAttribute<Employee, Double> salary;
    public static volatile SingularAttribute<Employee, Date> creationDate;
    public static volatile SingularAttribute<Employee, String> empFullname;
    public static volatile ListAttribute<Employee, Contacts> contacts;

}