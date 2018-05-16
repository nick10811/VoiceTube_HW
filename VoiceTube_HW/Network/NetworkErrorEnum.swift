//
//  NetworkError.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/16.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

enum NetworkError: Int {
    case success         = 0
    case timeout         = 1
    case parseDataFail   = 2
    case APIFail         = 3
}
