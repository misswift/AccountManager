//
//  RegistrationPresenter.swift
//  accountManager
//
//  Created by Халим Магомедов on 01.04.2022.
//

import Foundation

protocol RegistrationViewProtocol: AnyObject {
    func success ()
    func failure (error: Error)
}

protocol RegistrationPresenterProtocol: AnyObject {
    func saveUserData()
    func openInitialVC ()
}

class RegistrationPresenter: RegistrationPresenterProtocol {
    var userDataService: UserDataFetchServiceProtocol!
    weak var view: RegistrationViewProtocol?
    let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    var userData: [UserData]?
    init (view: RegistrationViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, userInfo: String, userDataService: UserDataFetchServiceProtocol){
        self.view = view
        self.networkService = networkService
        self.router = router
    }

    func openInitialVC () {
        router?.dismiss()
        router?.initialViewController()
    }
    
    func saveUserData() {
        userDataService.saveСontext()
    }
    
    
}
