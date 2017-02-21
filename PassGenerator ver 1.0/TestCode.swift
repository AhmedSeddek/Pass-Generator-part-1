//
//  TestCode.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/11/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation


struct InputValues {
    var firstName: String? = nil
    var lastName: String? = nil
    var streetAddress: String? = nil
    var city: String? = nil
    var state: String? = nil
    var zipCode: String? = nil
    var socialSecurityNumber: String? = nil
    var dateOfBirth: [Int]? = nil
    var managementTier: String? = nil
}

let inputValuesAll = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesAllNil = InputValues()
let inputValuesFirstNameIsNil = InputValues(firstName: nil, lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesLastNameIsNil = InputValues(firstName: "Adam", lastName: nil, streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesStreetIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: nil, city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesCityIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: nil, state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesStateIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: nil, zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesZipCodeIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: nil, socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesSocialSecurityNumberIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: nil, dateOfBirth: [1989, 01, 01], managementTier: "Manager Tier")
let inputValuesDateOfBirthIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: nil, managementTier: "Manager Tier")
let inputValuesManagementTierIsNil = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: [1989, 01, 01], managementTier: nil)
let inputValuesChildUnder5YearOld = InputValues(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: [2011, 7, 25], managementTier: nil)
let inputValuesChildOver5YearOld = InputValues(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, socialSecurityNumber: nil, dateOfBirth: [1989, 01, 01], managementTier: nil)
let inputValuesEntrantHasBirthdayToday = InputValues(firstName: "Adam", lastName: "Samuel", streetAddress: "101 Amusement St", city: "Amusement Park", state: "AP", zipCode: "92300", socialSecurityNumber: "520201234", dateOfBirth: todaysDateAsArr(), managementTier: "Manager Tier")










// 1. select input values to be loaded
let inputValue = inputValuesAllNil

// 2. select entrant type to be selectd
let entrantType = GuestType.classic

// 3. select Access type to be pressed (swipe method)
let buttonType = AreaAccessType.maintenanceAreas

// received values from users
var firstName: String? = nil
var lastName: String? = nil
var streetAddress: String? = nil
var city: String? = nil
var state: String? = nil
var zipCode: String? = nil
var socialSecurityNumber: String? = nil
var dateOfBirth: [Int]? = nil
var managementTier: String? = nil

class TestCode {
    let viewController = ViewController()
    
    func populateReceivedData(inputValues: InputValues) {
        firstName = inputValues.firstName
        lastName = inputValues.lastName
        streetAddress = inputValues.streetAddress
        city = inputValues.city
        state = inputValues.state
        zipCode = inputValues.zipCode
        socialSecurityNumber = inputValues.socialSecurityNumber
        dateOfBirth = inputValues.dateOfBirth
        managementTier = inputValues.managementTier
    }
    
    func pressGeneratePassButton() {
        viewController.generatePassButtonPressed(entrantType)
    
    
    }
    
    func pressAccessButton(access: AccessType) {
        
        let delayBeforeFirstSwipe = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 2 * Int64(NSEC_PER_SEC))
        let delayBeforeSecondSwipe = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 4 * Int64(NSEC_PER_SEC))
        let delayBeforeThirdSwipe = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 8 * Int64(NSEC_PER_SEC))
        
        dispatch_after(delayBeforeFirstSwipe, dispatch_get_main_queue()) {
            print("\nAccess swipe 1 of 3", terminator: ": ")
            self.viewController.accessButtonPressed(access)
        }
        dispatch_after(delayBeforeSecondSwipe, dispatch_get_main_queue()) {
            print("Access swipe 2 of 3", terminator: ": ")
            self.viewController.accessButtonPressed(access)
        }
        dispatch_after(delayBeforeThirdSwipe, dispatch_get_main_queue()) {
            print("Access swipe 3 of 3", terminator: ": ")
            self.viewController.accessButtonPressed(access)
            print("\n--\nAll test complete", terminator: "\n---")
        }
    }
    
    
    func printInputValues() {
        print("---\nTest Values: \(inputValue)")
    }
    
    func printVisitor(visitor: Visitor) {
        print("Entrant Type: \(visitor)")
    }
    
    func printButtonType() {
        print("Swipe Method: \(buttonType)\n---\n")
    }
    
    
}










