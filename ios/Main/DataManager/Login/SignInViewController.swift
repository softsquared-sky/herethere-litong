//
//  SignInViewController.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var emailBox2: UITextField!
    @IBOutlet weak var completedBtn: UIButton!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isValidEmail(emailBox: emailBox2.text!){
            completedBtn.isEnabled = true
            print("올바른 이메일")
    
            }else {
            completedBtn.isEnabled = false
        }
        return true
    }
    @IBAction func completedBtnn(_ sender: UIButton) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            
            navigationViewController.pushViewController(SignInViewController2(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailBox2.delegate = self
        

        // Do any additional setup after loading the view.
    }

    func isValidEmail(emailBox: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailBox)
    }


}
