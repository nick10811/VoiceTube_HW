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
        guard self.isNetworkAvailable() else {
            return
        }
        _ = webService.getVideoData(respnose: { (videoArray) in
            self.status = .loadDone
            DBManager.sharedInstance().resetVideo()
            self.dataConvert(array: videoArray)
        }, error: { (code, message) in
            self.status = .loadFail
            self.loadingDelegate?.webServiceLoadingFail(code: code, message: message)
        })
    }
    
    override func loadMoreData() {
        guard isNetworkAvailable() else {
            return
        }
        _ = webService.getVideoData(respnose: { (videoArray) in
            self.status = .loadMoreDone
            self.dataConvert(array: videoArray)
        }, error: { (code, message) in
            self.status = .loadMoreFail
            self.loadingDelegate?.webServiceLoadingFail(code: code, message: message)
        })
    }
    
    func dataConvert(array: [VideoModel]) {
        self.modelArray.append(contentsOf: array)
        DBManager.sharedInstance().batchInsertVideo(modelArray: array)
        self.loadingDelegate?.webServiceLoadingDone()
    }
    
    func isNetworkAvailable() -> Bool {
        let isAvailable = HttpClient.sharedInstance().isNetworkAvailable()
        if !isAvailable {
            self.modelArray = DBManager.sharedInstance().getVideo()
            self.loadingDelegate?.webServiceLoadingDone()
        }
        return isAvailable
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
