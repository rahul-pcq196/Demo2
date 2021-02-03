//
//  Tab2.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class Tab2VC: UIViewController {

    @IBOutlet weak var sgmtCall: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var txtSliderValue: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnStartPrg: UIButton!
    
    var isProgressing: Bool = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slider.value = 3
        txtSliderValue.text = "\(slider.value)"
    }
    
    @IBAction func sliderValueChanged(_ sender:UISlider){
        txtSliderValue.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func stepperValueChanged(_ sender:UIStepper){
        lblCount.text = "\(Int(sender.value))"
    }
    
    // handle start and stop progress
    @IBAction func prgStartStop(_ sender:UIButton){
        
        if isProgressing{
            timer.invalidate()
            btnStartPrg.setTitle(localize(str: "progress_start_txt"), for: .normal)
            isProgressing = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
            btnStartPrg.setTitle(localize(str: "progress_stop_txt"), for: .normal)
            isProgressing = true
        }
    }
    
    @objc func updateProgress(){
        
        if progressBar.progress == 1.0{
            progressBar.progress = 0
        }
        progressBar.progress += 0.005
    }

}
