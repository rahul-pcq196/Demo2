//
//  Tab3.swift
//  Demo2
//
//  Created by PCQ196 on 01/02/21.
//

import UIKit

class Tab3VC: UIViewController {
    
    @IBOutlet weak var dltImgView : UIImageView!
    @IBOutlet weak var viewImg : UIImageView!
    @IBOutlet weak var btnPickImg: UIButton!
    
    @IBOutlet weak var txtfldBio: UITextView!
    
    var strHtml = "<b><i>This text is bold and Italic</i></b><br><p>Do not forget to buy <mark>milk</mark> today.<br>My favorite color is <del>blue</del> red.<br><a href='https://www.tatvasoft.com'>To know more click here</a></p>"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delete image view configurations
        dltImgView.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(removeImg))
        dltImgView.addGestureRecognizer(tap)
        dltImgView.isUserInteractionEnabled = true
        
        // bio text field configurations
        txtfldBio.isEditable = false
        txtfldBio.attributedText = strHtml.htmlToAttributedString
    }
    
    // to remove image from imageview
    @objc func removeImg(){
        
        let alert = UIAlertController(title: localize(str: "warning_title"), message: localize(str: "sure_to_remove_img_msg"), preferredStyle: .alert)
        let actYes = UIAlertAction(title: localize(str: "remove_txt"), style: .destructive) { (_ action) in
            self.viewImg.image = UIImage()
            self.dltImgView.alpha = 0
        }
        alert.addAction(actYes)
        alert.addAction(UIAlertAction(title: localize(str: "cancel_txt"), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

}

// MARK: image picker functionalities
extension Tab3VC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBAction func pickImg(_ sender: UIButton) {
        

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            viewImg.contentMode = .scaleAspectFill
            viewImg.image = pickedImage
            dltImgView.alpha = 0.6
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
