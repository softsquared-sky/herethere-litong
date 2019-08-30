//
//  SignIn4ViewController.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class SignIn4ViewController: UIViewController {
    
    let picker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func addAction(_ sender: Any) {
        let alert =  UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default)
        {
            (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default)
        {
            (action) in self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    func openCamera(){
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
        }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
}

extension UIViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            UIImageView.image = image
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
}



