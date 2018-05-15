//
//  BaseStringExtenstion.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

extension String {
    func convertToBool() -> Bool {
        switch self {
        case "True", "true", "yes", "YES", "1":
            return true
        case "False", "false", "no", "NO", "0":
            return false
        default:
            return false
        }
    }
}
