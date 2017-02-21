//
//  InformationManagement.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/8/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation

final class InformationManagement {

    struct Information {
        let firstName: Bool
        let lastName: Bool
        let streetAddress: Bool
        let city: Bool
        let state: Bool
        let zipCode: Bool
        let socialSecurityNumber: Bool
        let dateOfBirth: Bool
        let managementTier: Bool
        // guests
        init() {
        self.firstName = false
        self.lastName = false
        self.streetAddress = false
        self.city = false
        self.state = false
        self.zipCode = false
        self.socialSecurityNumber = false
        self.dateOfBirth = false
        self.managementTier = false
    }
        // free child guest
        init(dateOfBirth: Bool) {
            self.firstName = false
            self.lastName = false
            self.streetAddress = false
            self.city = false
            self.state = false
            self.zipCode = false
            self.socialSecurityNumber = false
            self.dateOfBirth = dateOfBirth
            self.managementTier = false
        }
        // employees & managers
        init(managementTier: Bool) {
            self.firstName = false
            self.lastName = false
            self.streetAddress = false
            self.city = false
            self.state = false
            self.zipCode = false
            self.socialSecurityNumber = false
            self.dateOfBirth = false
            self.managementTier = managementTier
        }
    }
    func requiredInfo(entrant: Entrant) -> Information {
        switch entrant.type {
            case is GuestType:
            let guest = entrant.type as! GuestType
            switch guest {
            case .classic:
                return Information()
            case .vip:
                return Information()
            case .freeChild:
                return Information(dateOfBirth: true)
            }
        case is EmployeeType:
            return Information(managementTier: true)
        case is ManagerType:
            return Information(managementTier: true)
        default:
            return Information()
        }
    }
    
    
    enum InfoError: String, ErrorType {
        case firstName = "'First Name' must be at least two letters"
        case lastName = "'Last Name' must be at least two letters"
        case streetAddress = "'Street Address' must have minimum five characters"
        case city = "'City' must have minimum two letters"
        case state = "'State' must have exactly two letters"
        case zipCode = "'Zip Code' must have exactly five numbers"
        case socialSecurityNumber = "'Social Security Number' must have exactly nine numbers"
        case dateOfBirth = "'Date of Birth' can not be empty"
        case managementTier = "'Management Tier' can not be empty"
        case childNotUnder5YearsOld = "Child is not under 5 years old"
        case unkown = "Input information not valid, please try again."
    }
    
    func dataValidation(entrant: Entrant, requiredInfo: InformationManagement.Information) throws -> Bool {
        if requiredInfo.firstName {
            guard firstName?.characters.count >= 2 else {
                throw InfoError.firstName
            }
            passInformation["First Name"] = firstName
        }
        if requiredInfo.lastName {
            guard lastName?.characters.count >= 2 else {
                throw InfoError.lastName
            }
            passInformation["Last Name"] = lastName
        }
        if requiredInfo.streetAddress {
            guard streetAddress?.characters.count >= 5 else {
                throw InfoError.streetAddress
            }
            passInformation["Street Address"] = streetAddress
        }
        if requiredInfo.city {
            guard city?.characters.count >= 2 else {
                throw InfoError.city
            }
            passInformation["City"] = city
        }
        if requiredInfo.state {
            guard state?.characters.count == 2 else {
                throw InfoError.state
            }
            passInformation["State"] = state
        }
        if requiredInfo.zipCode {
            guard zipCode?.characters.count == 5 else {
                throw InfoError.zipCode
            }
            passInformation["Zip Code"] = zipCode
        }
        if requiredInfo.socialSecurityNumber {
            guard socialSecurityNumber?.characters.count == 9 else {
                throw InfoError.socialSecurityNumber
            }
            passInformation["Social Security Number"] = socialSecurityNumber
        }
        if requiredInfo.dateOfBirth {
            guard dateOfBirth != nil else {
                throw InfoError.dateOfBirth
            }
            switch entrant.type {
            case GuestType.freeChild:
                guard isEntrantFreeChild(dateOfBirth!) else {
                    throw InfoError.childNotUnder5YearsOld
                }
            default:
                break
            }
        }
        if requiredInfo.managementTier {
            guard managementTier != nil else {
                throw InfoError.managementTier
            }
        }
        return true
    }
    
    
    func isEntrantFreeChild(dob: [Int]) -> Bool {
        if todaysDateAsArr()[0] > 5 {
            return false
        } else {
            if todaysDateAsArr()[1] > 0 {
                return false
            } else {
                if todaysDateAsArr()[2] >= 0 {
                    return false
                }
            }
            return true
        }
    }
}
    
    


    

























































