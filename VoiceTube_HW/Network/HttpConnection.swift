//
//  HttpConnection.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/14.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation
import SwiftyJSON

class HttpConnectionRequest {
    var urlname: String {return ""}
    
    var dict: [String:Any]
    
    /// Inital a request connection
    ///
    /// - parameter dict:        The parameters by dictionary.
    init(dict: [String:Any]) {
        self.dict = dict
    }
    
    func post(response:@escaping(JSON)->Void, error:@escaping(Int, String)->Void) {
        let url = serverIP+urlname
        printLog(.debug, "HttpConnection:\(url), dictString: \(dict)" )
        _ = HttpClient.sharedInstance().request(.post, url, nil, dict, response: { (result) in
            response(result)
        }, error: { (code, message) in
            error(code, message)
        })
    }
}
