//
//  SystemStructure.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/7/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation

typealias Seconds = Double

//MARKS:- Protocols

protocol Entrant {
    var type: EntrantType {get}
    var title: String {get}
}

//MARKS: marker protocols
protocol EntrantType {}

protocol AccessType {}

//MARK: Entrant types

enum GuestType: String , EntrantType {
    case classic = "Classic"
    case vip = "VIP"
    case freeChild = "Free Child"
}

enum EmployeeType: String , EntrantType {

    case foodService = "Food Service Employee"
    case rideService = "Ride Service Employee"
    case maintenance = "Maintenance Employee"
}

enum ManagerType: String , EntrantType {
    case shift = "Shift Manager"
    case general = "General Manager"
    case senior = "Senior Manager"
}

//MARK: Access Type
enum AreaAccessType: String, AccessType {
    case amusementAreas = "Amusement Areas"
    case kitchenAreas = "Kitchen Areas"
    case rideControlAreas = "Ride Control Areas"
    case maintenanceAreas = "Maintenance Areas"
    case officeAreas = "Office Areas"
}

enum RideAccessType: String, AccessType {
    case accessAllRides = "Access All Rides"
    case skipAllRideLines = "Skip All Ride Lines"
}

enum DiscountAccessType: String, AccessType {
    case discountOnFood = "% Discount on Food"
    case discountOnMerchandise = "% Discount on Merchandise"
}

//MARK: visitor
struct Visitor: Entrant {
    let type: EntrantType
    let title: String

}

//MARK: Swipe Time

var minTimeBetweenSwipes: Seconds = 5



//MARK: Confirmation Access Center

enum ConfirmationCenter: String {
    enum AreaAccessSwipe: String {
            case approved = "Request approved, please enter the "
            case denied = "Request denied, you don't have access to "
        }
    enum RideAccessSwipe: String {
            case approved = "Request approved, you can "
        case denied = "Request denied, you can not "
        }
    enum DiscountAccessSwipe: String {
            case approved = "Request approved, you get "
            case denied = "Request denied, you get "
        }
    case isEntrantBirtday = "---Happy Birthday---"
    }
    


















