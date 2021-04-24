//
//  ViewController.swift
//  Birthday
//
//  Created by 古堅ニノスカ on 2020/09/21.
//

import UIKit

// 入力画面
class ViewController: UIViewController, UITextFieldDelegate {

    //mario
    var mario = 10
    // 名前テキストフィールド
    @IBOutlet weak var nameTextField: UITextField!
    // 電話番号テキストフィールド
    @IBOutlet weak var phoneTextField: UITextField!
    // メールアドレス テキストフィールド
    @IBOutlet weak var emailTextField: UITextField!
    // パスワード テキストフィールド
    @IBOutlet weak var passwordTextField: UITextField!
    // 日付ピッカー
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickResultBtn(_ sender: UIButton) {
        let resultViewController = storyboard?.instantiateViewController(identifier: "result_view_controller") as! ResultViewController
        resultViewController.putExtras(key: Define.KEY_NAME, value: nameTextField.text!)
        resultViewController.putExtras(key: Define.KEY_PHONE, value: phoneTextField.text!)
        resultViewController.putExtras(key: Define.KEY_EMAIL, value: emailTextField.text!)
        resultViewController.putExtras(key: Define.KEY_PASSWORD, value: passwordTextField.text!)
        resultViewController.putExtras(key: Define.KEY_YEAR, value: Calendar(identifier: .gregorian).component(.year, from: datePicker.date))
        resultViewController.putExtras(key: Define.KEY_MONTH, value: Calendar(identifier: .gregorian).component(.month, from: datePicker.date))
        resultViewController.putExtras(key: Define.KEY_DAY_OF_MONTH, value: Calendar(identifier: .gregorian).component(.day, from: datePicker.date))
        navigationController?.pushViewController(resultViewController, animated: true)
        
        print("mario = \(mario)")
    }
    
    // returnボタンが押されたとき
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
    }
    
    // 画面がタップされたとき
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // キーボードを閉じる
        view.endEditing(true)
    }
}
