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
    var title: String {return jsonDict["title"].stringValue}
    var img: String {return jsonDict["img"].stringValue}
}

class ResultModel: JsonModel {
    var status: String {return jsonDict["status"].stringValue}
    var videos: [JSON] {return jsonDict["videos"].arrayValue}
}
