//
//  PassGenerator.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/11/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation

var visitor: Visitor!
var passInformation = [String: String]()


class PassGenerator {

    func generatePass(visitor: Visitor, requiredInfo: InformationManagement.Information, passInfo: [String: String]) {
        let rideAccess = RideManagement().checkRide(visitor)
        let discountAccess = DiscountManagement().checkDiscount(visitor)

        if let firstName = passInformation["First Name"],  let lastName = passInformation["Last Name"] {
            print("\(firstName) \(lastName)")
        }
        print("\(visitor.title) Pass")
        
        if rideAccess.accessAllRides {
            print("• Access All Rides")
        }
        if rideAccess.skipAllRideslines {
            print("• Skip All Ride Lines")
        }
        
        if discountAccess.discountOnFood > 0 {
            print("• \(discountAccess.discountOnFood)% Food Discount")
        }
        if discountAccess.discountOnMerchandise > 0 {
            print("• \(discountAccess.discountOnMerchandise)% Merchandise Discount")
        }
        print("--------------------------------------")
    
    }





}