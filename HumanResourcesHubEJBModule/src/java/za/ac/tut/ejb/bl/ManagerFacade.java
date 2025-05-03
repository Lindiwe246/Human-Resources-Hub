/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.ejb.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.Manager;

/**
 *
 * @author Fortunate
 */
@Stateless
public class ManagerFacade extends AbstractFacade<Manager> implements ManagerFacadeLocal {

    @PersistenceContext(unitName = "HumanResourcesHubEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ManagerFacade() {
        super(Manager.class);
    }
    
    // ?Implement the login lookup(JPQL)
    @Override
    public Manager findByEmail(String email) {
        try {
            return em.createQuery("SELECT m FROM Manager m WHERE m.email = :email", Manager.class)
                     .setParameter("email", email)
                     .getSingleResult();
        } catch (Exception e) {
            return null; // Email not found or error occurred
        }
    }
    
}
