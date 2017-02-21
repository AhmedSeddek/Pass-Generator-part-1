//
//  HelperFunctions.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 1/12/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import Foundation

func todaysDateAsArr() -> [Int] {

    let todayComponents = NSCalendar.currentCalendar().components([.Day, .Month, .Year], fromDate: NSDate())
    return [todayComponents.day, todayComponents.month, todayComponents.year]

}