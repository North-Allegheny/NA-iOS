//
//  Night.swift
//  NA
//
//  Created by Alex Taffe on 4/17/15.
//  Copyright (c) 2015 NA. All rights reserved.
//

import Foundation

class Night: NSObject {
    class func isNight()->Bool{
        //this really needs to be better made by using actual data
        //let EDSunriseSetCurrent = EDSunriseSet.sunrisesetWithTimezone(NSTimeZone.localTimeZone(), latitude: 40.4397, longitude: //79.9764)
        //let sunset = EDSunriseSetCurrent.localNauticalCivilTwilightStart()
        //let sunrise = EDSunriseSetCurrent.localNauticalCivilTwilightEnd()
        return true
    }
}
