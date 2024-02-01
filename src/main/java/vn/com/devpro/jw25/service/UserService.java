package vn.com.devpro.jw25.service;

import org.springframework.stereotype.Service;

import vn.com.devpro.jw25.model.User;


@Service
public class UserService extends BaseService<User>{
	
	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}

}
