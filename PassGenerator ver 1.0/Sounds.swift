//
//  Sounds.swift
//  PassGenerator ver 1.0
//
//  Created by ahmed seddek on 2/20/17.
//  Copyright © 2017 epicMoments. All rights reserved.
//

import AudioToolbox

var accessGranted: SystemSoundID = 0
var accessDenied: SystemSoundID = 0


func loadSounds() {
    let pathToAccessGrantedSoundFile = NSBundle.mainBundle().pathForResource("AccessGranted", ofType: "wav")
    let accessGrantedSoundURL = NSURL(fileURLWithPath: pathToAccessGrantedSoundFile!)
    AudioServicesCreateSystemSoundID(accessGrantedSoundURL, &accessGranted)
    
    let pathToAccessDeniedSoundFile = NSBundle.mainBundle().pathForResource("AccessDenied", ofType: "wav")
    let accessDeniedSoundURL = NSURL(fileURLWithPath: pathToAccessDeniedSoundFile!)
    AudioServicesCreateSystemSoundID(accessDeniedSoundURL, &accessDenied)
}

func playSound(soundType: SystemSoundID) {
    AudioServicesPlaySystemSound(soundType)
}

