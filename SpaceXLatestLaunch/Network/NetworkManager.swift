//
//  NetworkManager.swift
//  SpaceXLatestLaunch
//
//  Created by Kralpi on 3/25/21.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ViewToNetworkManager: AnyObject {
    func getData()
}

protocol NetworkManagerToView: AnyObject {
    func successData(data: DataModel)
    func error(error: AFError?)
}

class NetworkManager: ViewToNetworkManager {

    weak var managerToView: NetworkManagerToView?
    
    func getData() {
        AF.request(Constants.spaceXUrl).responseJSON { response in
            
            if response.error == nil {
                if let responseResult = response.value {
                    let data = DataModel.init(json: JSON(responseResult))
                    self.managerToView?.successData(data: data)
                }
            } else {
                self.managerToView?.error(error: response.error)
            }
        }
    }
}
