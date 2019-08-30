//
//  SignIn3ViewController.swift
//  ios
//
//  Created by 이동연 on 28/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class SignIn3ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var realName: UITextField!
    @IBOutlet weak var birthDate: UITextField!
    @IBOutlet weak var userNickname: UITextField!
    
    
    @IBAction func completedBtnn(_ sender: Any) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            
            navigationViewController.pushViewController(SignIn4ViewController(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        // Do any additional setup after loading the view.
    }
}
