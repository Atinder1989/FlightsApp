//
//  Service.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation


enum WebserviceHTTPMethod: String {
    case get  =   "GET"
    case post =   "POST"
}

struct Service {
    var url: String!
    var httpMethod : WebserviceHTTPMethod
    var params : [String: Any]
    var headers : [String: Any]
    
    init(httpMethod :WebserviceHTTPMethod) {
        self.httpMethod = httpMethod
        self.params = [String: Any]()
        self.headers = [HTTPHeaderKey.accept.rawValue:HTTPHeaderValue.applicationJSON.rawValue,HTTPHeaderKey.contentType.rawValue:HTTPHeaderValue.applicationFormURLEncoded.rawValue]
    }
}
