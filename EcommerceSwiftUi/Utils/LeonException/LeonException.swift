//
//  LeonException.swift
//  AltashiratSwiftUI
//
//  Created by Karim Hamed  on 21/05/2025.
//
enum LeonException:Error {
    case network(NetworkError)
    case client(ClientError)
    case server(ServerError)
    case local(LocalError)
    case unknown(UnknownError)
    
    var errorDescription:String? {
        switch self {
        case .network(let networkError):
            return networkError.errorDescription
        case .client(let clientError):
            return clientError.errorDescription
        case .server(let serverError):
            return serverError.errorDescreption
        case .local(let localError):
            return localError.errorDescreption
        case .unknown(let unknownError):
            return unknownError.errorDescription
            
        }
    }
}

extension LeonException {
    enum NetworkError {
        case retrial
        case handled
        
        var errorDescription:String? {
            switch self {
                
            case .retrial:
                return "A network error occured. the operation will be retried."
            case .handled:
                return "An unexpected network error occured. Please try again later."
                
            }
        }
    }
    
    enum ClientError {
        case unauthorized
        case responseValidation
        case clientUnhandled
        
        var errorDescription:String? {
            switch self {
            case .unauthorized:
                return "You are unauthorized to perform this action."
            case .responseValidation:
                return "Please check your input and try again."
            case .clientUnhandled:
                return "An unknown client-side error occured. Please try again."
            }
        }
        
    }
    
    enum ServerError {
        case internalServerError
        
        var errorDescreption :String? {
            switch self {
            case .internalServerError:
                return "Something went wrong on our end. Please try again later."
            }
        }
    }
    
    enum LocalError {
        case requestValidation(RequestValidationError)
        case IoOperation
        
        var errorDescreption: String? {
            switch self {
            case .requestValidation(let requestValidationError):
                return requestValidationError.errorDescription
            case .IoOperation:
                return "There was a problem accessing local storage. Please try again."
            }
        }
        
    }
    
    enum UnknownError {
        case unknown
        
        var errorDescription:String? {
            switch self {
            case .unknown:
                return "An unknown error occured"
            }
        }
    }
    
    enum RequestValidationError {
        case nilRequiredValue(fieldKey:String)
        case emptyString(fieldKey:String)
        case missingRequiredKey(fieldKey:String)
        case emptyField
        case moreThan(field:String,count:String)
        case lessThan(field:String,count:String)
        case incorrectName
        case incorrectPhone
        case incorrectMail
        case incorrectPassword
        
        var errorDescription: String? {
            switch self {
            case .nilRequiredValue(let fieldKey):
                return"request validation error: value in \(fieldKey) is required but its nil"
            case .emptyString(let fieldKey):
                return "request validation error: value of \(fieldKey) can't be an empty string"
            case .missingRequiredKey(let fieldKey):
                return"request validation error: key \(fieldKey) is required but its missing"
            case .emptyField:
                return "this field must not be empty"
            case .moreThan(let field ,let count):
                return "\(field) must not exceed \(count) charaters"
            case .lessThan(field: let field, count: let count):
                return "\(field) must not be less than \(count) charaters"
            case .incorrectName:
                return "name must not have special characters"
            case .incorrectPhone:
                return "phone must contain numbers only"
            case .incorrectMail:
                return "mail must be in the format ahmed@example.com"
            case .incorrectPassword:
                return "incorrect password"
            }
        }
        
    }
    
}

