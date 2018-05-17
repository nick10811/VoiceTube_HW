//
//  SettingViewModel.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import Foundation

enum SettingType: String {
    case autoPlay = "AutoPlay" // 自動播放 (開關)
    case subtitleSync = "SubtitleSync" // 字幕同步 (開關)
    case stopPlayInSearchVocabulary = "StopPlayInSearchVocabulary" // 查詢單字時暫停播放 (開關)
    case recommandVideo = "RecommandVideo" // 推薦影片提醒 (開關)
    case reminderTime = "ReminderTime" // 學習通知 (時間)
}

class SettingViewModel: BaseViewModel {
    func getBoolValue(type: SettingType) -> Bool {
        return getStringValue(type: type).convertToBool()
    }
    
    func setBoolValue(_ value: Bool, type: SettingType) throws {
        guard type != .reminderTime else {
            throw CommonError.invalidInput(
                "Invalid Input! [INPUT TYPE]: \(type)\n" +
                    "Accepted Type:\n" +
                    "1. \(SettingType.autoPlay.rawValue)\n" +
                    "2. \(SettingType.subtitleSync.rawValue)\n" +
                    "3. \(SettingType.stopPlayInSearchVocabulary.rawValue)\n" +
                "4. \(SettingType.recommandVideo.rawValue)\n")
        }
        setStringValue(String(value), type: type)
    }
    
    func getStringValue(type: SettingType) -> String {
        guard type == .reminderTime else {
            return SettingManager.sharedInstance().load(type.rawValue) ?? "true"
        }
        return self.getDateValue(type: .reminderTime).toString()
    }
    
    func setStringValue(_ value: String, type: SettingType) {
        SettingManager.sharedInstance().save(value, forKey: type.rawValue)
        self.loadingDelegate?.loadingDone()
    }
    
    func getDateValue(type: SettingType) -> Date {
        guard type == .reminderTime else {
            return Date()
        }
        
        if let stored = SettingManager.sharedInstance().loadObject(type.rawValue) as? Date {
            return stored
        }
        return Date()
    }
    
    func setDateValue(_ date: Date, type: SettingType) throws {
        guard type == .reminderTime else {
            throw CommonError.invalidInput(
                "Invalid Input! [INPUT TYPE]: \(type)\n" +
                    "Accepted Type:\n" +
                "1. \(SettingType.reminderTime.rawValue)\n")
        }
        SettingManager.sharedInstance().saveObject(date as AnyObject, forKey: type.rawValue)
        self.loadingDelegate?.loadingDone()
    }
    
}
