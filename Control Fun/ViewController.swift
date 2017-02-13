//
//  ViewController.swift
//  Control Fun
//
//  Created by Jason Mendez on 2/8/17.
//  Copyright © 2017 Jason Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Namefield: UITextField!

    @IBOutlet weak var NumberField: UITextField!

    @IBOutlet weak var SliderLabel: UILabel!
    
    @IBOutlet weak var RightSwitch: UISwitch!
    
    @IBOutlet weak var LeftSwitch: UISwitch!
    
    @IBOutlet weak var DoSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SliderLabel.text = "50"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    @IBAction func textFieldDoneEditing(sender: UITextField){
    sender.resignFirstResponder()
    }
    
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        Namefield.resignFirstResponder()
        NumberField.resignFirstResponder()
    }
    
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        SliderLabel.text = "\(lroundf(sender.value))"
    }
    
    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        LeftSwitch.setOn(setting, animated: true)
        RightSwitch.setOn(setting, animated:true)
    }
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!", style: .destructive,
                                      handler: {action in let msg = self.Namefield.text!.isEmpty
                                        ? " You can breathe easy, everything went OK."
                                        : "You can breathe easy, \(self.Namefield.text),"
                                        + "Everything went OK."
                                        let controller2 = UIAlertController(
                                            title: " Something was done",
                                            message: msg, preferredStyle: .alert)
                                        let cancelAction = UIAlertAction(title: "Phew",
                                                                         style: .cancel,
                                                                         handler: nil)
                                        let controller2.addAction(cancelAction)
                                        self.present(controller2, animated: true,
                                                     completion:  nil)
                                        
                                        [controller addAction:yesAction]; // from page 125
                                        [controller addAction:noAction];
                                        
        })
        let noAction = UIAlertAction(title: "No Way!",
                                     style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .down
        }
        present(controller, animated: true, completion: nil)
    }
    
    
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // "Switches" is selected
            LeftSwitch.isHidden = false
            RightSwitch.isHidden = false
            DoSomethingButton.isHidden = true
         }  else {
            LeftSwitch.isHidden = true
            RightSwitch.isHidden = true
            DoSomethingButton.isHidden = false
         }
    
    
    
}
