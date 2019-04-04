//
//  JsonModel.swift
//  KingfisherSwiftyJson
//
//  Created by Henry Aguinaga on 2019-04-02.
//  Copyright © 2019 Henry Aguinaga. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JsonModel {
    var artistName = ""
    var trackCensoredName = ""
    var artworkUrl100: String = ""
    
    init() {
        
    }
    
    init(json: JSON) {
        artistName = json["artistName"].stringValue
        trackCensoredName = json["trackCensoredName"].stringValue
        artworkUrl100 = json["artworkUrl100"].stringValue
    }
}
