//
//  Main.swift
//  accountManager
//
//  Created by Халим Магомедов on 05.03.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    var presenter: AuthViewPresenterProtocol!
    
    override func viewDidLoad() {
        insertView()
    }

    private lazy var iconImage: UIImageView = {
     let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    private lazy var comeButton: UIButton = {
     let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Войти по почте", for: .normal)
        return button
    }()
    
    private lazy var registrationButton: UIButton = {
     let button = UIButton()
        button.setTitle("Регистрация по почте", for: .normal)
        return button
    }()
    
    func insertView(){
        [iconImage, comeButton, registrationButton].forEach { view.addSubview($0) }
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
