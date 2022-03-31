//
//  Main.swift
//  accountManager
//
//  Created by Халим Магомедов on 05.03.2022.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    var presenter: AuthViewPresenterProtocol!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.title = "Вход по почте"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(openBackVC))
        insertView()
    }
    
    @objc fileprivate func openBackVC (){
        presenter.openInitialVC()
    }
    
    private lazy var authLoginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e-mail"
        return textField
    }()
    
    private lazy var authPaswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "пароль"
        return textField
    }()
    
    private lazy var registrationButton: UIButton = {
     let btn = UIButton()
        btn.setTitle("Перейти к регистрации", for: .normal)
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
        btn.addTarget(self, action: #selector(comeInButtonTap), for:.touchUpInside )
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
    
    @objc func registrationButtonTap (){
        
    }
    
    @objc func comeInButtonTap (){
        
    }
}

extension AuthViewController: AuthViewProtocol {
    func success() {
        print(1)
    }
    
    func failure(error: Error) {
        print(1)
        
    }
    
    
}
