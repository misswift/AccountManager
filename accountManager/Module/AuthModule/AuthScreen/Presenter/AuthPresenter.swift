//
//  AuthPresenter.swift
//  accountManager
//
//  Created by Халим Магомедов on 06.03.2022.
//

import Foundation

protocol AuthViewProtocol: AnyObject {
    func success ()
    func failure (error: Error)
    
}

protocol AuthViewPresenterProtocol: AnyObject {
    func getUserData()
    func openInitialVC()
}

class AuthPresenter: AuthViewPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var userData: [UserData]?
    init (view: AuthViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, userInfo: String){
        self.view = view
        self.networkService = networkService
        self.router = router
    }
    
    func openInitialVC () {
        router?.dismiss()
        router?.initialViewController()
    }
    func getUserData() {
//        networkService.getAuthData {  [weak self] result in
//            guard let self = self else {return}
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let userData):
//                    self.userData = userData
//                    self.view?.success()
//                case .failure(let error):
//                    self.view?.failure(error: error)
//                }
//            }
//        }
    }
}

