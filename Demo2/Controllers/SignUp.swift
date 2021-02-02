//
//  ViewController.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class SignUp: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDesignation: UITextField!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var pckrDesignation: UIPickerView!
    @IBOutlet weak var pckrDate: UIDatePicker!
    @IBOutlet weak var btnSignup: UIButton!
    
    var arrDesignation: [String] = ["DesigOne","DesigTwo","DesigThree","DesigFour"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pckrDesignation.delegate = self
        pckrDesignation.dataSource = self
    }
    
    @IBAction func onDateSelect(_ sender:UIDatePicker){
        txtDob.text = "\(pckrDate.date)"
    }
    
    @IBAction func userHandle(_ sender:UIButton){
        if sender == btnSignup{
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: "LogIn") as! LogIn
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// text picker functions
extension SignUp: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrDesignation.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrDesignation[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtDesignation.text = arrDesignation[row]
    }
}
