//
//  SwipeManagement.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/13/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation

class SwipeManagement {
    static let sharedInstance = SwipeManagement()
    var timer = NSTimer()
    var timeAllowedToNextSwipe: Seconds = 0

    func swipeToAccess(access : AccessType, visitor: Visitor) {
        guard SwipeManagement.sharedInstance.timeAllowedToNextSwipe == 0 else {
            print("time since last swipe is \(minTimeBetweenSwipes - SwipeManagement.sharedInstance.timeAllowedToNextSwipe) and minimum time is \(SwipeManagement.sharedInstance.timeAllowedToNextSwipe)")
            playSound(accessDenied)
        return
        }
        SwipeManagement.sharedInstance.startSwipeCountDown()
        var approved: String
        var denied: String
        let accessType: String
        
        switch access {
        case is AreaAccessType:
            let areaAccess = access as! AreaAccessType
            approved = ConfirmationCenter.AreaAccessSwipe.approved.rawValue
            denied = ConfirmationCenter.AreaAccessSwipe.denied.rawValue
            switch areaAccess {
            case .amusementAreas:
                accessType = AreaAccessType.amusementAreas.rawValue
                if AreaManagement().checkAccess(visitor).musementAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
             
            case .kitchenAreas:
                accessType = AreaAccessType.kitchenAreas.rawValue
                if AreaManagement().checkAccess(visitor).kitchenAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
            case .rideControlAreas:
                accessType = AreaAccessType.rideControlAreas.rawValue
                if AreaManagement().checkAccess(visitor).rideControlAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
            case .maintenanceAreas:
                accessType = AreaAccessType.maintenanceAreas.rawValue
                if AreaManagement().checkAccess(visitor).maintenanceAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
            case .officeAreas:
                accessType = AreaAccessType.officeAreas.rawValue
                if AreaManagement().checkAccess(visitor).officeAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
            }
        case is RideAccessType:
            let rideAccess = access as! RideAccessType
            approved = ConfirmationCenter.RideAccessSwipe.approved.rawValue
            denied = ConfirmationCenter.RideAccessSwipe.denied.rawValue
            switch rideAccess {
            case .accessAllRides:
                accessType = RideAccessType.accessAllRides.rawValue
                if AreaManagement().checkAccess(visitor).rideControlAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
            case .skipAllRideLines:
                accessType = RideAccessType.skipAllRideLines.rawValue
                if AreaManagement().checkAccess(visitor).rideControlAreas {
                    print(approved + accessType)
                    playSound(accessGranted)
                } else {
                    print(denied + accessType)
                    playSound(accessDenied)
                }
            }
        case is DiscountAccessType:
            let discountAccess = access as! DiscountAccessType
            approved = ConfirmationCenter.DiscountAccessSwipe.approved.rawValue
            denied = ConfirmationCenter.DiscountAccessSwipe.denied.rawValue
            switch discountAccess {
            case .discountOnFood:
                accessType = DiscountAccessType.discountOnFood.rawValue
                if DiscountManagement().checkDiscount(visitor).discountOnFood > 0 {
                    playSound(accessGranted)
                    print(approved + String(DiscountManagement().checkDiscount(visitor).discountOnFood) + accessType)
                } else {
                    playSound(accessDenied)
                    print(denied + String(DiscountManagement().checkDiscount(visitor).discountOnFood) + accessType)
                }
            case .discountOnMerchandise:
                accessType = DiscountAccessType.discountOnMerchandise.rawValue
                if DiscountManagement().checkDiscount(visitor).discountOnMerchandise > 0 {
                    playSound(accessGranted)
                    print(approved + String(DiscountManagement().checkDiscount(visitor).discountOnMerchandise) + accessType)
                } else {
                    playSound(accessDenied)
                    print(denied + String(DiscountManagement().checkDiscount(visitor).discountOnMerchandise) + accessType)
                }
            }
        default:
            break
        }
        if let dateOFBirth = dateOfBirth {
            if todayBirthDay(monthDateBirth: dateOFBirth[1], dayOfDateBirth: dateOFBirth[2]) {
                print(ConfirmationCenter.isEntrantBirtday.rawValue)
            
            }
        
        
        }
    
    }
    
    
    //MARK: Helper Methods
    
    func todayBirthDay(monthDateBirth monthDateBirth: Int, dayOfDateBirth: Int) -> Bool{
        if todaysDateAsArr()[1] - monthDateBirth != 0 {
            return false
        } else if todaysDateAsArr()[2] - dayOfDateBirth != 0 {
            return false
        }
        return true
        
    }
    
    func startSwipeCountDown() {
    timeAllowedToNextSwipe = minTimeBetweenSwipes
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    
    }
    func stopSwipeCountDown() {
        timer.invalidate()
    
    }
    
    @objc func countDown() {
        timeAllowedToNextSwipe -= 1
        if timeAllowedToNextSwipe == 0 {
            stopSwipeCountDown()
        }
    
    }
}