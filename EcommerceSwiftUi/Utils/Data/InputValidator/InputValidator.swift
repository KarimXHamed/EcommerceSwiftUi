//
//  InputValidation.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 21/05/2025.
//
import Foundation
class InputValidator {
    
    //MARK: -Helper functions
    private func validateEmptyString(string:String) -> Bool {
        if string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return true
        }
        return false
    }
    
    private func validateNameFormat(name:String) -> Bool {
        let nameRegex = "^[A-Za-z0-9 ]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return predicate.evaluate(with: name)
    }
    
    private func validatePhoneFormat(phone:String) -> Bool {
        let phoneRegex =  "^[0-9]$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }
    
    private func validateMailFormat(email:String) ->Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func validateLessThan(string:String,count:Int) -> Bool {
        let stringRegex =  "^{\(count),}$"
        let stringPredicate = NSPredicate(format: "SELF MATCHES %@", stringRegex)
        return stringPredicate.evaluate(with: string)
    }
    
    private func validateMoreThan(string:String,count:Int) -> Bool {
        let stringRegex =  "^{,\(count)}$"
        let stringPredicate = NSPredicate(format: "SELF MATCHES %@", stringRegex)
        return stringPredicate.evaluate(with: string)
    }
    
    //MARK: -Main functions
    func validateName(name:String) -> [LeonException]? {
        var errors:[LeonException]? = []
        if !validateEmptyString(string: name) {
            errors?.append(LeonException.local(.requestValidation(.emptyField)))
        }
        
        if !validateNameFormat(name: name) {
            errors?.append(LeonException.local(.requestValidation(.incorrectName)))
        }
        
        if !validateLessThan(string: name, count: 3) {
                errors?.append(LeonException.local(.requestValidation(.lessThan(field: "name", count: "3"))))
        }
        
        if !validateMoreThan(string: name, count: 15) {
            errors?.append(LeonException.local(.requestValidation(.moreThan(field: "name", count: "15"))))
        }
        
        return errors
    }
    
    func validatePhone(phone:String) -> [LeonException]? {
        var errors:[LeonException]? = []
        if !validateEmptyString(string: phone) {
            errors?.append(LeonException.local(.requestValidation(.emptyField)))
        }
        
        if !validatePhoneFormat(phone: phone) {
            errors?.append(LeonException.local(.requestValidation(.incorrectPhone)))
        }
        
        if !validateLessThan(string: phone, count: 9) {
            errors?.append(LeonException.local(.requestValidation(.lessThan(field: "phone", count: "3"))))
        }
        
        if !validateMoreThan(string: phone, count: 15) {
            errors?.append(LeonException.local(.requestValidation(.moreThan(field: "phone", count: "15"))))
        }
        
        return errors
    }
    
    func validateMail(mail:String) -> [LeonException]? {
        var errors:[LeonException]? = []
        if !validateEmptyString(string: mail) {
            errors?.append(LeonException.local(.requestValidation(.emptyField)))
        }
        
        if !validateMailFormat(email: mail) {
            errors?.append(LeonException.local(.requestValidation((.incorrectMail))))
        }
        
        if !validateLessThan(string: mail, count: 3) {
            errors?.append(LeonException.local(.requestValidation(.lessThan(field: "mail", count: "3"))))
        }
        
        if !validateMoreThan(string: mail, count: 50) {
            errors?.append(LeonException.local(.requestValidation(.moreThan(field: "mail", count: "50"))))
        }
        
        return errors
    }
    
    func validatePassword(password:String) -> [LeonException]? {
        var errors:[LeonException]? = []
        if !validateEmptyString(string: password) {
            errors?.append(LeonException.local(.requestValidation((.emptyField))))
        }
        
        if !validateLessThan(string: password, count: 8) {
            errors?.append(LeonException.local(.requestValidation(.lessThan(field: "password", count: "8"))))
        }
        
        if !validateMoreThan(string: password, count: 50) {
            errors?.append(LeonException.local(.requestValidation(.moreThan(field: "password", count: "50"))))
        }
        
        return errors
    }

    
}
