//
//  TimeUtils.swift
//  Common
//
//  Created by CAO XUAN PHONG on 1/26/18.
//  Copyright © 2018 FioT. All rights reserved.
//

import UIKit

class TimeUtils: NSObject {
    
    class func getEpoch() -> Int {
        return Int(NSDate().timeIntervalSince1970)
    }
    
    class func getTimezoneOffset() -> Int {
        return TimeZone.autoupdatingCurrent.secondsFromGMT()
    }
    
    class func is24Format() -> Bool {
        let locale = NSLocale.current
        let formatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        
        if formatter.contains("a") {
            return false
        } else {
            return true
        }
    }
    
    class func epochToString(epoch : Int, format: String) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date as Date)
    }
    
    class func getDay(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.day, from: date as Date)
    }
    
    class func getMonth(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.month, from: date as Date)
    }
    
    class func getYear(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.year, from: date as Date)
    }
    
    class func getHour(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.hour, from: date as Date)
    }
    
    class func getMinute(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.minute, from: date as Date)
    }
    
    class func getSecond(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.second, from: date as Date)
    }
    
    class func getDateInWeek(epoch : Int) -> Int {
        let date = NSDate(timeIntervalSince1970: TimeInterval(epoch))
        let calendar = NSCalendar.current
        
        return calendar.component(Calendar.Component.weekday, from: date as Date)
    }
    
    class func getTimezone() -> Int {
        return TimeZone.current.secondsFromGMT()/3600
    }
    
    class func getTimezoneName() -> String {
        return TimeZone.current.identifier
    }
    
    class func offset(date1: Date, date2: Date) -> Int {
        return Int(date2.timeIntervalSince1970 - date1.timeIntervalSince1970)
    }
    
    class func datePlusOffset(date: Date, offset: Int) -> Date {
        return date.addingTimeInterval(TimeInterval(offset))
    }
    
    class func epochToDate(epoch: Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(epoch))
    }
    
}
