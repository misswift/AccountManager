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
    
    
    func insertView(){
        [authLoginTextField, authPaswordTextField].forEach { view.addSubview($0) }
        authLoginTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.trailing.leading.equalToSuperview().offset(16)
        }
        authPaswordTextField.snp.makeConstraints {
            $0.top.equalTo(authLoginTextField.snp.bottom).offset(50)
            $0.trailing.leading.equalToSuperview().offset(16)
            
        }}
}

extension AuthViewController: AuthViewProtocol {
    func success() {
        print(1)
    }
    
    func failure(error: Error) {
        print(1)
        
    }
    
    
}
