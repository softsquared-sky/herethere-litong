//
//  InitialLoginViewController.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class InitialLoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var passwordBox: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var findEmailPw: UIButton!
    @IBOutlet weak var signIn: UIButton!
    

    @IBAction func loginAndNextVC(_ sender: UIButton) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            navigationViewController.pushViewController(FeedViewController(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
    }    
    
    @IBAction func haewongaip(_ sender: Any) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            navigationViewController.pushViewController(SignInViewController(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
        
        
    }
    let yourAttributes : [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 12.0),
                                                          .underlineStyle: NSUnderlineStyle.single.rawValue,
                                                          .foregroundColor: UIColor.white
                                                          ]

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isValidEmail(emailBox: emailBox.text!) && passwordBox.text!.count > 3 {
            loginBtn.isEnabled = true
            if let image = UIImage(named: "loginBtn"){
                loginBtn.setImage(image, for : .normal)
            }
            
        } else {
            loginBtn.isEnabled = false
        }
        
        print(emailBox.text!, passwordBox.text!, range.location, range.length) // 이 부분은 확인을 위해 만든 부분입니다.
        return true
    }
    
    
    
    // 내가 존나 빡치는 이유
    // 유효성검사가 되었으면 이미지아이콘 노란색으로 바꿔줘야하는데 안바뀌는 점
    // 화면 싸리하게 싹 넘기는 문법을 존나 모르겠는 것
    // FeedTableviewCell Automatic해도 xib에 swift가 안따라오는 점
    
    //FeedViewController에 tableView OUTLET이 안만들어짐
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailBox.delegate = self
        passwordBox.delegate = self
        let attributeString = NSMutableAttributedString(string: "이메일/비밀번호 찾기", attributes: yourAttributes)
        let attributeString2 = NSMutableAttributedString(string: "회원가입", attributes : yourAttributes)
        findEmailPw.setAttributedTitle(attributeString, for: .normal)
        signIn.setAttributedTitle(attributeString2, for: .normal)
        
    }
    func isValidEmail(emailBox: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailBox)
    }

}


//스토리보드 아이디로만
