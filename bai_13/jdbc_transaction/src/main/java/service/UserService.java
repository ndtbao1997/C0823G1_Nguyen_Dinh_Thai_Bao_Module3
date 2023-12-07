package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {

    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> showList() {
        return iUserRepository.showList();
    }

    @Override
    public void addNew(User user) {
        iUserRepository.addNew(user);
    }

    @Override
    public Boolean edit(User user) {
       return iUserRepository.edit(user);
    }

    @Override
    public Boolean removeUser(int id) {
        return iUserRepository.removeUser(id);
    }

    @Override
    public User findById(int id) {
        return iUserRepository.findById(id);
    }

    @Override
    public List<User> search(String name) {
        return iUserRepository.search(name);
    }

    @Override
    public List<User> sort() {
        return iUserRepository.sort();
    }
}
