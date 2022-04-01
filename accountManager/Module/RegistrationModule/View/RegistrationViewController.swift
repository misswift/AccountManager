//
//  RegistrationView.swift
//  accountManager
//
//  Created by Халим Магомедов on 01.04.2022.
//

import Foundation
import UIKit


class RegistrationViewController: UIViewController {
    var presenter: RegistrationPresenterProtocol!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.title = "Регистрация"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(openBackVC))
        insertView()
    }
    
    @objc fileprivate func openBackVC (){
        presenter.openInitialVC()
    }
    
    private lazy var authLoginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e-mail"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private lazy var authPaswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "пароль"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var registrationButton: UIButton = {
     let btn = UIButton()
        btn.setTitle("Уже зарегистрирован", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(registrationButtonTap), for:.touchUpInside )
        return btn
    }()
    
    private lazy var comeInButton: UIButton = {
     let btn = UIButton()
        btn.setTitle("Войти", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(saveButtonTap), for:.touchUpInside )
        return btn
    }()
    func insertView(){
        [authLoginTextField, authPaswordTextField, registrationButton, comeInButton].forEach { view.addSubview($0) }
        authLoginTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.trailing.leading.equalToSuperview().offset(36)
        }
        authPaswordTextField.snp.makeConstraints {
            $0.top.equalTo(authLoginTextField.snp.bottom).offset(50)
            $0.trailing.leading.equalToSuperview().offset(36)
        }
        registrationButton.snp.makeConstraints {
            $0.top.equalTo(authPaswordTextField.snp.bottom).offset(50)
            $0.trailing.leading.equalToSuperview().inset(36)
            $0.height.equalTo(44)

        }
        comeInButton.snp.makeConstraints {
            $0.top.equalTo(registrationButton.snp.bottom).offset(50)
            $0.trailing.leading.equalToSuperview().inset(36)
            $0.height.equalTo(44)
        }
    }
    
    @objc func registrationButtonTap(){
        presenter.openInitialVC()
    }
    
    @objc func saveButtonTap(){
       if !isValidEmail(testStr: authLoginTextField.text!) {
        presenter.saveUserData()
                  return
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}


extension RegistrationViewController: RegistrationViewProtocol {
    func success() {
//        <#code#>
    }
    
    func failure(error: Error) {
//        <#code#>
    }
    
    
}
