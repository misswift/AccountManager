//
//  ViewController.swift
//  accountManager
//
//  Created by Халим Магомедов on 05.03.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol?

    override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
    }

    private lazy var iconImage: UIImageView = {
     let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    private lazy var comeButton: UIButton = {
     let btn = UIButton()
        btn.backgroundColor = .orange
        btn.setTitle("Войти по почте", for: .normal)
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(comeButtonTap), for:.touchUpInside )
        return btn
    }()
    
    private lazy var registrationButton: UIButton = {
     let btn = UIButton()
        btn.setTitle("Регистрация по почте", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(registrationButtonTap), for:.touchUpInside )
        return btn
    }()
    
    
    @objc func registrationButtonTap() {
       
    }
    
    @objc func comeButtonTap() {
        presenter?.createAuthScreen()
    }
    
    
    func setupView(){
        [iconImage, comeButton, registrationButton].forEach { view.addSubview($0) }
        
        iconImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(36)
            $0.trailing.equalToSuperview().inset(36)
            $0.height.width.equalTo(150)
        }
        
        comeButton.snp.makeConstraints {
            $0.bottom.equalTo(registrationButton.snp.top).offset(-50)
            $0.leading.equalToSuperview().offset(36)
            $0.trailing.equalToSuperview().inset(36)
            $0.height.equalTo(50)
        }
        
        registrationButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(36)
            $0.trailing.equalToSuperview().inset(36)
            $0.height.equalTo(50)
        }
    }
    
}

extension MainViewController: MainViewProtocol {
    
}


