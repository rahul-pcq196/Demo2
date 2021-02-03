//
//  LogIn.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class LogInVC: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTxtFields()
        
    }

    // to configure text fields
    func setupTxtFields(){
        
        txtEmail.leftPadding(padding: 10)
        txtPass.leftPadding(padding: 10)
        
        txtPass.rightViewMode = .always
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "eye")
        imageView.tintColor = .lightGray
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(togglePass))
        imageView.addGestureRecognizer(tap)
        txtPass.rightView = imageView
        
    }
    
    @objc func togglePass(){
        txtPass.isSecureTextEntry.toggle()
    }
    
    @IBAction func userHandle(_ sender:UIButton){
        
        if sender == btnLogin{
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: "TabbarVC") as! TabbarVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
