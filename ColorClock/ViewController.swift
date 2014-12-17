//
//  ViewController.swift
//  ColorClock
//
//  Created by Pete on 12/17/2557 BE.
//  Copyright (c) 2557 Pete. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var clockLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        clockLabel.textColor = UIColor.whiteColor()
        clockLabel.font = UIFont(name: "OpenSans-Light", size: 80.0)
        colorLabel.textColor = UIColor.whiteColor()
        colorLabel.font = UIFont(name: "OpenSans-Light", size: 20.0)
        
        // Update Clock
        updateCurrentClock()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateCurrentClock", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateCurrentClock() {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        let currentTime = NSString(format:"%02d : %02d : %02d", components.hour, components.minute, components.second) as String
        let currentColor = NSString(format:"#%02d%02d%02d", components.hour, components.minute, components.second) as String
        clockLabel.text = currentTime
        colorLabel.text = currentColor
        view.backgroundColor = UIColor(rgba: currentColor)
    }
}

