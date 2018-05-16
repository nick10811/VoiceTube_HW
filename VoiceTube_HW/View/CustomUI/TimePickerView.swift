//
//  CustomPickerView.swift
//  VoiceTube_HW
//
//  Created by Nick Yang on 2018/5/15.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import UIKit

class TimePickerView: UIView {
    @IBOutlet weak var timerPickerView: UIView!
    @IBOutlet weak var timePickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var timeDatePicker: UIDatePicker!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TimePickerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    typealias completedClosure = (Date)->()
    var _completed: completedClosure?
    
    func show(date: Date, completed: completedClosure? = nil) {
        self.timerPickerView.center.y -= 180
        self.setupGestrueRecpgnizer()
        self.timeDatePicker.date = date
        
        if let window = UIApplication.shared.keyWindow {
            _completed = completed
            window.addSubview(self)
            self.showPickerView(true)
        }
    }
    
    @IBAction func clickDone(_ sender: Any) {
        self.showPickerView(false)
        self.removeView()
        _completed?(timeDatePicker.date)
    }
    
    func showPickerView(_ show: Bool) {
        if show {
            UIView.animate(withDuration: 0.3) {
                self.timerPickerView.center.y -= 180
            }
            
        } else {
            UIView.animate(withDuration: 0.3) {
                self.timerPickerView.center.y += 180
            }
        }
    }
    
    func setupGestrueRecpgnizer(){
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(TimePickerView.tap))
        self.addGestureRecognizer(gesture)
    }
    
    @objc func tap(_ sender:UITapGestureRecognizer!) {
        self.showPickerView(false)
        self.removeView()
    }
    
    func removeView() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.3) {
            self.removeFromSuperview()
        }
    }
    
}
