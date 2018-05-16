//
//  VideoService.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/14.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

class VideoService: HttpConnectionRequest {
    override var urlname: String { return "" }
    
    convenience init(){
        self.init(dict: ["key":"VoiceTube"])
    }
    
    func getVideoData(respnose:@escaping ([VideoModel])->Void, error:@escaping (Int,String)->Void){
        self.post(response: { (result) in
            let resultModel = ResultModel(jsonDict: result)
            if resultModel.status == "success" {
                self.errorCode = .success
                var videoArray = [VideoModel]()
                for tmp in resultModel.videos {
                    videoArray.append(VideoModel(jsonDict: tmp))
                }
                respnose(videoArray)
                
            } else {
                self.errorCode = .APIFail
                error(NetworkError.APIFail.rawValue, resultModel.status)
            }
            
        }) { (code, message) in
            error(code, message)
        }
    }
}
