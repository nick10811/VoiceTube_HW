//
//  WebServiceLoadingDelegate.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

enum LoadingStatus {
    case initialize
    case loadStart
    case loadDone
    case loadFail
    case loadMoreStart
    case loadMoreDone
    case loadMoreFail
}

protocol WebServiceLoadingDelegate {
    func webServiceLoadingDone()
    func webServiceLoadingFail(code: Int, message: String)
}
