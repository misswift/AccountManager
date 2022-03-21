//
//  MainPresenter.swift
//  accountManager
//
//  Created by Халим Магомедов on 20.03.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject  {
    
}


protocol MainViewPresenterProtocol: AnyObject  {
    func createAuthScreen()
}
        
    
class MainPresenter: MainViewPresenterProtocol {
        
        var view: MainViewProtocol?
        var router: RouterProtocol?
        var userData: [UserData]?
        init (view: MainViewProtocol){
            self.view = view
        }
        
        func createAuthScreen() {
            router?.dismiss()
            router?.openAuthScreen(userInfo: "")
    }

}


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
