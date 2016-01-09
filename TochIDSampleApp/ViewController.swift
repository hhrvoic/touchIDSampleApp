//
//  ViewController.swift
//  TochIDSampleApp
//
//  Created by Faculty of Organisation and Informatics on 08/01/16.
//  Copyright © 2016 air. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func TouchIDBtnAction(sender: UIButton) {
        TouchiDCall()
    }
    func TouchiDCall(){
        let authContext : LAContext = LAContext ()
        var error : NSError?
        if(authContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error )) //postoji li TouchID
            {
            authContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Testing Touch ID", reply: { //closure koji provjerava jel dobar fingerprint
                (wasSuccessful: Bool, error:NSError?) in
                if wasSuccessful { //
                    let alert = UIAlertController(title: "✅", message: "You have been authorised", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }else
                { //poruka ce se pojaviti nakon 3 loša unosa
                    let alert = UIAlertController(title: "❌", message: "You are not authorised", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Your device does not support Touch ID feature", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }


}

