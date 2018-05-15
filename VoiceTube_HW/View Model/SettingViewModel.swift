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
    func getSettingValue(type: SettingType) -> String {
        switch type {
        case .autoPlay,
             .subtitleSync,
             .stopPlayInSearchVocabulary,
             .recommandVideo:
            return SettingManager.sharedInstance().load(type.rawValue) ?? "true"
        case .reminderTime:
            return SettingManager.sharedInstance().load(type.rawValue) ?? "09:00 AM"
        }
    }
    
    func setSettingValue(_ value: String, type: SettingType) {
        SettingManager.sharedInstance().save(value, forKey: type.rawValue)
    }
    
    func getTimeValue(type: SettingType) -> Date {
        guard type == .reminderTime else {
            return Date()
        }
        
        return SettingManager.sharedInstance().loadObject(type.rawValue) as! Date
    }
    
    func setTimeValue(_ date: Date, type: SettingType) {
        guard type == .reminderTime else {
            return
        }
        
        SettingManager.sharedInstance().saveObject(date as AnyObject, forKey: type.rawValue)
    }
    
}
