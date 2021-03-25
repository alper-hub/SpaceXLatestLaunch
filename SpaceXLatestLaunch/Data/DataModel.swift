//
//  File.swift
//  SpaceXLatestLaunch
//
//  Created by Kralpi on 3/25/21.
//

import Foundation
import SwiftyJSON

class DataModel: NSObject {
    
    var name: String?
    var details: String?
    var smallImage: String?
    var largeImage: String?

    init(json: JSON) {
        self.name = json["name"].stringValue
        self.details = json["details"].stringValue
        self.smallImage = json["links"]["patch"]["small"].stringValue
        self.largeImage = json["links"]["patch"]["large"].stringValue
    }
}

