//
//  ViewController.swift
//  Application
//
//  Created by Alex Gikaev on 21.07.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
// MARK: - Аутлеты
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var enterButton: UIButton!
//    @IBAction func goBack(_ segue: UIStoryboardSegue) { // функция возвращения обратно на экран, нужно писать в том контроллере куда хочешь перейти и перетягивать через ctrl на exit нужного  VC
//
//    }
    
// MARK: - Жизненный цикл
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        // рассылает нам уведомления по типу появления или скрытия клавиатуры, входящий вызов
        // selector это функция которая обрабатывает что должно происходить когда придет уведомление от notificationcenter
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    // MARK: - Функции
    
//    func checkLogin() {
//        let login = loginTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//
//        if !(login.isEmpty && password.isEmpty) && login == "1" && password == "1" {
//            print("Вы вошли")
//        } else {
//            print("Ошибка")
//        }
//    }
    
    
    @objc func keyboardWasShown(_ notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize?.height ?? 0, right: 0)
        
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        scrollView.scrollRectToVisible(enterButton.frame, animated: true) // долистывает до точки которую указывают например enterButton
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
    /// функция алерта ошибки при входе
    func showAuthError() {
        let alertVC = UIAlertController(title: "Ошибка", message: "Ошибка авторизации", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
    }
    /// функция проверки авторихации
    func checkAuth() -> Bool {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if !(login.isEmpty && password.isEmpty) && login == "0" && password == "0" {
            return true
        } else {
            return false
        }
    }
        
    
     override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showMainScreen" && checkAuth(){
            return true// тк возвращает bool то можно оптимизировать код
        } else {
            showAuthError()
            return false
        }
    }
}
