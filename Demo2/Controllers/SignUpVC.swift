//
//  ViewController.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDesignation: UITextField!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var btnSignup: UIButton!
    
    var textPicker = UIPickerView()
    var datePicker = UIDatePicker()
    
    var arrDesignation: [String] = ["DesigOne","DesigTwo","DesigThree","DesigFour"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTxtFields()
        
        textPicker.delegate = self
        textPicker.dataSource = self
        
        // text picker configuration
        let doneButton = UIBarButtonItem(title: localize(str: "done_txt"), style: UIBarButtonItem.Style.done, target: self, action: #selector(donePicker))
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        toolBar.setItems([doneButton], animated: true)
        
        txtDesignation.inputView = textPicker
        txtDesignation.inputAccessoryView = toolBar
        
        // date picker configurations
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        txtDob.inputView = datePicker
        txtDob.inputAccessoryView = toolBar
    }
    
    // to configure text fields
    func setupTxtFields(){
        txtName.leftPadding(padding: 10)
        txtDesignation.leftPadding(padding: 10)
        txtDob.leftPadding(padding: 10)
    }
    
    @objc func donePicker(){
        self.view.endEditing(true)
    }
    
    @objc func dateChanged(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy"
        txtDob.text = formatter.string(from: datePicker.date)
    }
    
    // user interaction with button functions
    @IBAction func userHandle(_ sender:UIButton){
        if sender == btnSignup{
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: text picker functions
extension SignUpVC: UIPickerViewDelegate, UIPickerViewDataSource{
    
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
