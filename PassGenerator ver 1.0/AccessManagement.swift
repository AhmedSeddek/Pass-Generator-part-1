//
//  AccessManager.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/7/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation

//MARK: Area Management

final class AreaManagement {

    struct AreaAccess {
        let musementAreas: Bool = true
        let kitchenAreas: Bool
        let rideControlAreas: Bool
        let maintenanceAreas: Bool
        let officeAreas: Bool
    }
    
    func checkAccess(entrant: Entrant) -> AreaAccess {
    
        switch entrant.type {
            case is GuestType :
                return AreaAccess(kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
            case is EmployeeType:
                let employee = entrant.type as! EmployeeType
                switch employee {
                case .foodService:
                    return AreaAccess(kitchenAreas: true, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
                case .rideService:
                    return AreaAccess(kitchenAreas: false, rideControlAreas: true, maintenanceAreas: false, officeAreas: false)
                case .maintenance:
                    return AreaAccess(kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
            }
            case is ManagerType:
                return AreaAccess(kitchenAreas: true, rideControlAreas: true, maintenanceAreas: true, officeAreas: true)
            default: return AreaAccess(kitchenAreas: false, rideControlAreas: false, maintenanceAreas: false, officeAreas: false)
        
        }
    }
}

//MARK: Ride Management

final class RideManagement {

    struct RideAccess {
        let accessAllRides: Bool
        let skipAllRideslines: Bool
        
        init() {
            accessAllRides = true
            skipAllRideslines = false
        }
        
        init(skipAllRides: Bool) {
            self.accessAllRides = true
            self.skipAllRideslines = skipAllRides
        }
    }
    
    func checkRide(entrant: Entrant) -> RideAccess {
        
    switch  entrant.type {
        case is GuestType:
            let guest = entrant.type as! GuestType
            switch guest {
            case .vip:
                return RideAccess(skipAllRides: true)
            default:
                return RideAccess()
            }
        case is EmployeeType:
            return RideAccess()
        case is ManagerType:
            return RideAccess()
        default:
            return RideAccess()
        }
    }
    
    func printPlugValues() {
        print("---\nTest Values: \(inputValue)")
    }
    
    func printVisitor(visitor: Visitor) {
        print("Entrant Type: \(visitor)")
    }
    
    func printButtonType() {
        print("Swipe Method: \(buttonType)\n---\n")
    }

    
}


//MARK: Discount Management

final class DiscountManagement {

    struct DiscountAccess {
        let discountOnFood: Int
        let discountOnMerchandise: Int
    }
    
    func checkDiscount(entrant: Entrant) -> DiscountAccess {
        switch entrant.type {
        case is GuestType:
            let guest = entrant.type as! GuestType
            switch guest {
            case .vip:
                return DiscountAccess(discountOnFood: 10, discountOnMerchandise: 20)
            default:
                return DiscountAccess(discountOnFood: 0, discountOnMerchandise: 0)
            }
        case is EmployeeType:
            return DiscountAccess(discountOnFood: 15, discountOnMerchandise: 25)
        case is ManagerType:
            return DiscountAccess(discountOnFood: 25, discountOnMerchandise: 25)
        default:
            return DiscountAccess(discountOnFood: 0, discountOnMerchandise: 0)
        }
    }
}














































