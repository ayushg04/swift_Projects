//
//  ViewController.swift
//  flashloght
//
//  Created by daffolapmac-179 on 11/05/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Proximity sensor
        UIDevice.current.isProximityMonitoringEnabled = true
        let notificationName = Notification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(proximityStateDidChange), name: notificationName, object: nil)
    }
    
    //Proximity Sensor
    
    @objc func proximityStateDidChange(notification: Notification) {
      if let device = notification.object as? UIDevice {
        
        let currentProximityState = device.proximityState
        // true: user is close to the device; false: vice versa
        print("currentProximityState: \(currentProximityState ? "near" : "far")")
      }
    }
    
    //Flashlight Button
    
    @IBAction func btn_flashlight(_ sender: UIButton){
        if sender.titleLabel?.text == "ON"{
            sender.setTitle("OFF", for: .normal)
            switchON()
        }
        else{
            sender.setTitle("ON", for: .normal)
            switchOFF()
        }
        
    }
    
    func switchON() {
        if let device = AVCaptureDevice.default(for: .video), device.hasTorch{
            do{
                try device.lockForConfiguration()
                device.torchMode = .on
                device.unlockForConfiguration()
            }
            catch{
                print("Error")
            }
        }
    }

    func switchOFF() {
        if let device = AVCaptureDevice.default(for: .video), device.hasTorch{
            do{
                try device.lockForConfiguration()
                device.torchMode = .off
                device.unlockForConfiguration()
            }
            catch{
                print("Error")
            }
        }
    }

}

