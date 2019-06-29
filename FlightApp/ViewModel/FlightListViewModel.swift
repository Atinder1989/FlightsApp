//
//  FlightListViewModel.swift
//  FlightApp
//
//  Created by Atinderpal Singh on 6/29/19.
//  Copyright © 2019 Reliance Jio Infocomm. All rights reserved.
//

import Foundation
import UIKit

class FlightListViewModel: NSObject {
    var reloadDataClosure: (() -> Void)? = nil
   
}

// MARK:- Public Methods
extension FlightListViewModel{
    // MARK: Get Mobile Data Usage Information
    func getFlightDetailsList() {
        var service = Service.init(httpMethod: WebserviceHTTPMethod.get)
        service.url = ServiceHelper.getSampleFlightDataUrl()
        
        ServiceManager.processDataFromServer(service: service, model: FlightDetailResponse.self) { (responseVo, error) in
            
            if error != nil {
                //self.mobileDataInfo = []
                return
            }
            
            if let response = responseVo {
                print(response.airlinemap?.sj)
               // self.getVolumeDataInfoList(responseVo: response)
            } else {
               // self.mobileDataInfo = []
            }
            
        }
    }
}

extension FlightListViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.identifier,
                                                    for: indexPath) as? FlightCell {
            return cell
        }
        return UITableViewCell()

    }
}


extension FlightListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
