//
//  VideoModel.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/14.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonModel: NSObject {
    var jsonDict:JSON
    
    init(jsonDict:JSON){
        self.jsonDict = jsonDict
    }
}

class VideoModel: JsonModel {
    var title: String = ""
    var img: String = ""
    
    override init(jsonDict: JSON) {
        super.init(jsonDict: jsonDict)
        self.title = self.jsonDict["title"].stringValue
        self.img = self.jsonDict["img"].stringValue
    }
    
    init() {
        super.init(jsonDict: JSON())
    }
}

class ResultModel: JsonModel {
    var status: String {return jsonDict["status"].stringValue}
    var videos: [JSON] {return jsonDict["videos"].arrayValue}
}
