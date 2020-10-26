package com.techzone.springmvc.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.techzone.springmvc.entity.User;
import com.techzone.springmvc.model.UserModel;

@Component
public class UserUpdateValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserModel userModel = (UserModel) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.firstName", "NotEmpty");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.lastName", "NotEmpty");
		
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.username", "NotEmpty");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.email", "NotEmpty");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.password", "NotEmpty");
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user.passwordConfirm", "NotEmpty");
        
        if (userModel.getUser().getUsername().length() < 6 || userModel.getUser().getUsername().length() > 32) {
            errors.rejectValue("user.username", "Size.userForm.username");
        }
        
        if (userModel.getUser().getPassword().length() < 5 || userModel.getUser().getPassword().length() > 32) {
            errors.rejectValue("user.password", "Size.userForm.password");
        }

        if (!userModel.getUser().getPasswordConfirm().equals(userModel.getUser().getPassword())) {
            errors.rejectValue("user.passwordConfirm", "Diff.userForm.passwordConfirm");
        }
		
	}

}
