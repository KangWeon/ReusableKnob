//
//  ViewController.swift
//  ReusableKnob
//
//  Created by klarheit on 20/08/2018.
//  Copyright © 2018 klarheit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var valueSlider: UISlider!
    @IBOutlet var animateSwitch: UISwitch!
    @IBOutlet var knob: Knob!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        knob.lineWidth = 4
        knob.pointerLength = 12
        knob.setValue(valueSlider.value)
        updateLabel()
        knob.addTarget(self, action: #selector(ViewController.handleValueChanged(_:)), for: .valueChanged)

    }
    
    @IBAction func handleValueChanged(_ sender: Any) {
        if sender is UISlider {
            knob.setValue(valueSlider.value)
        } else {
            valueSlider.value = knob.value
        }
        updateLabel()
    }
    
    @IBAction func handleRandomButtonPressed(_ sender: Any) {
        let randomValue = Float.random(in: 0..<101) / 100.0
        knob.setValue(randomValue, animated: animateSwitch.isOn)
        valueSlider.setValue(Float(randomValue), animated: animateSwitch.isOn)
        updateLabel()
    }
    
    func updateLabel() {
        valueLabel.text = String(format: "%.2f", knob.value)
    }

}
