//
//  Tab2.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class Tab2: UIViewController {
    
    @IBOutlet weak var viewImg : UIImageView!
    @IBOutlet weak var btnPickImg: UIButton!
    @IBOutlet weak var btnAlert: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func showAlert(_ sender: UIButton){
        
        let alert = UIAlertController(title: "Success!", message: "This is demo alert.", preferredStyle: UIAlertController.Style.alert)
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(close)
        self.present(alert, animated: true, completion: nil)
    }

}

extension Tab2: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBAction func pickImg(_ sender: UIButton) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        let choose = UIAlertAction(title: "Choose from gallery", style: .default) { (_ action) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
                
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = true
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
                
            }
        }
        let remove = UIAlertAction(title: "Remove picture", style: .destructive) { (_ action) in
            self.viewImg.image = UIImage()
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(choose)
        alert.addAction(remove)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            viewImg.contentMode = .scaleAspectFill
            viewImg.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
