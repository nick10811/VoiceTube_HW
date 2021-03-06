//
//  SettingTableViewController.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/14.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var autoPlaySwitch: UISwitch!
    @IBOutlet weak var subtitleSyncSwitch: UISwitch!
    @IBOutlet weak var stopPlayInSearchVocabularySwitch: UISwitch!
    @IBOutlet weak var recommandVideoSwitch: UISwitch!
    @IBOutlet weak var reminderTimeButton: UIButton!
    
    let viewModel: SettingViewModel = SettingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadingDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        self.autoPlaySwitch.isOn = viewModel.getBoolValue(type: .autoPlay)
        self.subtitleSyncSwitch.isOn = viewModel.getBoolValue(type: .subtitleSync)
        self.stopPlayInSearchVocabularySwitch.isOn = viewModel.getBoolValue(type: .stopPlayInSearchVocabulary)
        self.recommandVideoSwitch.isOn = viewModel.getBoolValue(type: .recommandVideo)
        self.reminderTimeButton.setTitle(viewModel.getStringValue(type: .reminderTime), for: .normal)
    }

    @IBAction func switchAutoPlay(_ sender: Any) {
        do {
            try viewModel.setBoolValue(self.autoPlaySwitch.isOn, type: .autoPlay)
        } catch CommonError.invalidInput(let errorMessage) {
            printLog(.error, errorMessage)
        } catch {
            printLog(.error, "Unkown Error")
        }
    }
    
    @IBAction func switchsubtitleSync(_ sender: Any) {
        do {
            try viewModel.setBoolValue(self.subtitleSyncSwitch.isOn, type: .subtitleSync)
        } catch CommonError.invalidInput(let errorMessage) {
            printLog(.error, errorMessage)
        } catch {
            printLog(.error, "Unkown Error")
        }
    }
    
    @IBAction func switchStopPlayInSearchVocabulary(_ sender: Any) {
        do {
            try viewModel.setBoolValue(self.stopPlayInSearchVocabularySwitch.isOn, type: .stopPlayInSearchVocabulary)
        } catch CommonError.invalidInput(let errorMessage) {
            printLog(.error, errorMessage)
        } catch {
            printLog(.error, "Unkown Error")
        }
    }
    
    @IBAction func switchRecommandVideo(_ sender: Any) {
        do {
            try viewModel.setBoolValue(self.recommandVideoSwitch.isOn, type: .recommandVideo)
        } catch CommonError.invalidInput(let errorMessage) {
            printLog(.error, errorMessage)
        } catch {
            printLog(.error, "Unkown Error")
        }
    }
    
    @IBAction func clickReminderTime(_ sender: Any) {
        let selectedTime: Date = viewModel.getDateValue(type: .reminderTime)
        let pickerView = TimePickerView.instanceFromNib() as! TimePickerView
        pickerView.show(date: selectedTime) { (pickerDate) in
            do {
                try self.viewModel.setDateValue(pickerDate, type: .reminderTime)
            } catch CommonError.invalidInput(let errorMessage) {
                printLog(.error, errorMessage)
            } catch {
                printLog(.error, "Unkown Error")
            }
        }
    }
}

extension SettingTableViewController: LoadingDelegate {
    func loadingDone() {
        self.setupUI()
    }
    
    func loadingFail(code: Int, message: String) {
        
    }
}
