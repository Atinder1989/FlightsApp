//
//  Date+Extension.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation

extension Date {
    static func convertTimeStamptoFlightDateTime(timeStamp:String,dateFormat:String) -> String {
        let time = (timeStamp as NSString).doubleValue/1000.0
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = dateFormat
       return dayTimePeriodFormatter.string( from: Date(timeIntervalSince1970: TimeInterval(time)))
    }
    
    static func getDifferenceBetweenTwoTimeStamp(fromTimeStamp:String,toTimeStamp:String) -> DateComponents {
        let fromtime = (fromTimeStamp as NSString).doubleValue/1000.0
        let totime = (toTimeStamp as NSString).doubleValue/1000.0
        
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"
        
        let fromDate = Date(timeIntervalSince1970: TimeInterval(fromtime))
        let toDate = Date(timeIntervalSince1970: TimeInterval(totime))
        
        let components = Calendar.current.dateComponents([.month, .day, .hour, .minute, .second], from: fromDate, to: toDate)
        return components
    }
}
