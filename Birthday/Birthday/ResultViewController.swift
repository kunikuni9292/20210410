//
//  ResultViewController.swift
//  Birthday
//
//  Created by 古堅ニノスカ on 2020/09/21.
//

import UIKit
import MessageUI

// 結果画面
class ResultViewController : UIViewController, MFMailComposeViewControllerDelegate {
    
    // 名前ラベル
    @IBOutlet weak var nameLabel: UILabel!
    // 電話番号ラベル
    @IBOutlet weak var phoneLabel: UILabel!
    // メールアドレス ラベル
    @IBOutlet weak var emailLabel: UILabel!
    // パスワード ラベル
    @IBOutlet weak var passwordLabel: UILabel!
    // 歳ラベル
    @IBOutlet weak var ageLabel: UILabel!
    // 画面遷移時に画面間でデータを受け渡しするために一時的に保持する
    private var extras: Dictionary<String, Any> = Dictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = extras[Define.KEY_NAME] as! String
        let phone = extras[Define.KEY_PHONE] as! String
        let email = extras[Define.KEY_EMAIL] as! String
        let password = extras[Define.KEY_PASSWORD] as! String
        let year = extras[Define.KEY_YEAR] as! Int
        let month = extras[Define.KEY_MONTH] as! Int
        let dayOfMonth = extras[Define.KEY_DAY_OF_MONTH] as! Int
        nameLabel.text = name
        phoneLabel.text = phone
        emailLabel.text = email
        passwordLabel.text = password
        ageLabel.text = "\(ConverterUtil.getAge(year: year, month: month, dayOfMonth: dayOfMonth))\(NSLocalizedString("age", comment: "コメント"))"
    }
    
    // 画面遷移時に結果画面にデータを渡す
    func putExtras(key: String, value: Any) {
        extras.updateValue(value, forKey: key)
    }
    
    
    @IBAction func onClickSendBtn(_ sender: UIButton) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("メールアプリが見つかりません")
            return
        }

        let sendMail = MFMailComposeViewController()
        sendMail.mailComposeDelegate = self
        sendMail.setToRecipients(["daniel.valencia.student@gmail.com"]) //宛先
        sendMail.setSubject("レッスン2のテストメール") //件名
        if let name = nameLabel.text, let phone = phoneLabel.text, let email = emailLabel.text, let password = passwordLabel.text, let age = ageLabel.text {
            let mailText = "名前: \(name)\n電話番号: \(phone)\nアドレス: \(email)\nパスワード: \(password)\n歳: \(age)"
            sendMail.setMessageBody(mailText, isHTML: false) //本文
            present(sendMail, animated: true, completion: nil)
        }
    }
    
    // メールアプリでアクションが完了したら
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
