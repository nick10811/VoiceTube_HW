//
//  VideoViewModel.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

class VideoViewModel: BaseViewModel {
    var webService: VideoService = VideoService()
    
    override func loadData() {
        _ = webService.getVideoData(respnose: { (videoArray) in
            self.status = .loadDone
            self.modelArray = videoArray
            self.loadingDelegate?.webServiceLoadingDone()
        }, error: { (code, message) in
            self.status = .loadFail
            self.loadingDelegate?.webServiceLoadingFail(code: code, message: message)
        })
    }
    
    override func loadMoreData() {
        _ = webService.getVideoData(respnose: { (videoArray) in
            self.status = .loadMoreDone
            self.modelArray.append(contentsOf: videoArray)
            self.loadingDelegate?.webServiceLoadingDone()
        }, error: { (code, message) in
            self.status = .loadMoreFail
            self.loadingDelegate?.webServiceLoadingFail(code: code, message: message)
        })
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return modelArray.count
    }
    
    func modelAtSection(section: Int) -> VideoModel? {
        return nil
    }
    
    func modelAtIndex(indexPath: IndexPath) -> VideoModel {
        return modelArray[indexPath.item] as! VideoModel
    }
    
    func isLastModel(indexPath: IndexPath) -> Bool {
        return indexPath.item+1 == modelArray.count
    }
}
