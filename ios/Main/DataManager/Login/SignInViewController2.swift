//
//  SignInViewController2.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class SignInViewController2: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var passwordBox1: UITextField!
    @IBOutlet weak var passwordBox2: UITextField!
    @IBOutlet weak var completedBtn1: UIButton!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if  passwordBox1.text!.count > 5 && passwordBox2.text!.count > 5 && passwordBox1 == passwordBox2 && passwordBox1.text!.count < 11 && passwordBox2.text!.count < 11 {
            completedBtn1.isEnabled = true
            //에러가 나면 이 부분일듯
            }else {
            completedBtn1.isEnabled = false
            let noticePopUpStoryboard = UIStoryboard(name: "NoticePopUp", bundle: Bundle.main)
            guard let noticePopUp = noticePopUpStoryboard
                .instantiateViewController(withIdentifier: "NoticePopUp") as? NoticePopUp else {
                    return true
            }
            noticePopUp.noticePopUpDelegate = self as? NoticePopUpDelegate
            noticePopUp.modalPresentationStyle = .custom
            // 기본 팝업 세팅 끝
            
            self.present(noticePopUp, animated: true, completion: nil)
            
        }
        
        print(passwordBox1.text!, passwordBox2.text!, range.location, range.length) // 이 부분은 확인을 위해 만든 부분입니다.
        return true
    }
    
    @IBAction func completedBtnn(_ sender: Any) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            
            navigationViewController.pushViewController(SignIn3ViewController(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordBox1.delegate = self
        passwordBox2.delegate = self

        // Do any additional setup after loading the view.
    }

}

