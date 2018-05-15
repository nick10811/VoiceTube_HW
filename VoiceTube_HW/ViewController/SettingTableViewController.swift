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
        self.autoPlaySwitch.isOn = viewModel.getSettingValue(type: .autoPlay).convertToBool()
        self.subtitleSyncSwitch.isOn = viewModel.getSettingValue(type: .subtitleSync).convertToBool()
        self.stopPlayInSearchVocabularySwitch.isOn = viewModel.getSettingValue(type: .stopPlayInSearchVocabulary).convertToBool()
        self.recommandVideoSwitch.isOn = viewModel.getSettingValue(type: .recommandVideo).convertToBool()
        self.reminderTimeButton.setTitle(viewModel.getSettingValue(type: .reminderTime), for: .normal)
    }

    @IBAction func switchAutoPlay(_ sender: Any) {
        viewModel.setSettingValue(String(self.autoPlaySwitch.isOn), type: .autoPlay)
    }
    
    @IBAction func switchsubtitleSync(_ sender: Any) {
        viewModel.setSettingValue(String(self.subtitleSyncSwitch.isOn), type: .subtitleSync)
    }
    
    @IBAction func switchStopPlayInSearchVocabulary(_ sender: Any) {
        viewModel.setSettingValue(String(self.stopPlayInSearchVocabularySwitch.isOn), type: .stopPlayInSearchVocabulary)
    }
    
    @IBAction func switchRecommandVideo(_ sender: Any) {
        viewModel.setSettingValue(String(self.recommandVideoSwitch.isOn), type: .recommandVideo)
    }
    
    @IBAction func clickReminderTime(_ sender: Any) {
        let selectedTime: Date = viewModel.getTimeValue(type: .reminderTime)
        let pickerView = TimePickerView.instanceFromNib() as! TimePickerView
        pickerView.show(date: selectedTime) { (pickerDate) in
            self.viewModel.setTimeValue(pickerDate, type: .reminderTime)
        }
    }
}
