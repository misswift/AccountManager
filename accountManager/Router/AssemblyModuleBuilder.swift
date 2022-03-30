//
//  AssemblyBuilderProtocol.swift
//  accountManager
//
//  Created by Халим Магомедов on 13.03.2022.
//

import UIKit

protocol AssemblyBuilderProtocol: AnyObject {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createAuthModule(router: RouterProtocol, userInfo: String) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    
    // MARK: - CreateMainModule
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let mainView = MainViewController()
        let presenter = MainPresenter(view: mainView, router: router)
        mainView.presenter = presenter
        return mainView
    }
    
    
    
    // MARK: - CreateOpenModule
    
    func createAuthModule(router: RouterProtocol, userInfo: String) -> UIViewController {
        let authView = AuthViewController()
        let authViewService = NetworkService()
        let presenter = AuthPresenter(view: authView, networkService: authViewService, router: router, userInfo: userInfo)
        authView.presenter = presenter
        return authView
        
    }
    
    
}
