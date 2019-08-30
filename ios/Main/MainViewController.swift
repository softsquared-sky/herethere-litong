//
//  MainViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func pressedGetTutorials(_ sender: UIButton) {
        MainDataManager().getTutorials(self)
    }
    @IBAction func pressedHereThere(_ sender: UIButton) {
        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            guard let navigationViewController = self.navigationController else {
                self.presentAlert(title: "오류", message: "화면 이동에 실패하였습니다.")
                return
            }
            
            navigationViewController.pushViewController(InitialLoginViewController(), animated: true)
        }
        self.presentAlertWithAction(title: "화면전환", message: "메인으로 이동하시겠습니까?", customAction)
        
    }
    
    @IBAction func pressedPresentPopUpView(_ sender: UIButton) {
        let noticePopUpStoryboard = UIStoryboard(name: "NoticePopUp", bundle: Bundle.main)
        guard let noticePopUp = noticePopUpStoryboard
            .instantiateViewController(withIdentifier: "NoticePopUp") as? NoticePopUp else {
            return
        }
        noticePopUp.noticePopUpDelegate = self
        noticePopUp.modalPresentationStyle = .custom
        // 기본 팝업 세팅 끝
        
        self.present(noticePopUp, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MainViewController: NoticePopUpDelegate {    
    func pressedDismissButton() {
        self.titleLabel.text = "팝업 닫기 완료"
    }
    
    
}
