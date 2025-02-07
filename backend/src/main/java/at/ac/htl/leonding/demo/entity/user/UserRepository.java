package at.ac.htl.leonding.demo.entity.user;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

@ApplicationScoped
public class UserRepository {
    @Inject EntityManager em;

    public List<User> getAll() {
        return em.createQuery("from User", User.class).getResultList();
    }
    public User get(int id) {
        return em.find(User.class, id);
    }
    public User insert(User user) {
        var savedUser = em.merge(user);
        em.flush();
        return savedUser;
    }
}
