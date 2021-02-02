//
//  LogIn.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class LogIn: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func userHandle(_ sender:UIButton){
        
        if sender == btnLogin{
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: "Tabbar") as! Tabbar
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
