////
////  MainRouter.swift
////  accountManager
////
////  Created by Халим Магомедов on 13.03.2022.
////
import UIKit


protocol MainRouterProtocol: AnyObject  {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: MainRouterProtocol {
    func replaceRootController(on view: UIViewController)
    func popToRoot()
    func popToViewController(on view: UIViewController)
    func pop(animated: Bool)
    func dismiss()
    func openAuthScreen(userInfo: String)
    func initialViewController()
    func openRegistrationScreen( userInfo: String)
    
}

final class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
        init (navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol){
        self.assemblyBuilder = assemblyBuilder
        self.navigationController = navigationController
        
    }
    
    // MARK: - InitialViewController
    
    func initialViewController() {
        if let navigationController = self.navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.navigationBar.isHidden = true
            navigationController.viewControllers = [mainVC]
        }
    }
    
    
    // MARK: - OpenAuthScreen
    
    func openAuthScreen( userInfo: String) {
        if let navigationController = self.navigationController {
            guard let authVC = assemblyBuilder?.createAuthModule(router: self, userInfo: userInfo) else { return }
            navigationController.navigationBar.isHidden = false
            navigationController.viewControllers = [authVC]
        }
    }
    
    func openRegistrationScreen( userInfo: String) {
        if let navigationController = self.navigationController {
            guard let regVC = assemblyBuilder?.createRegistrationModule(router: self, userInfo: userInfo) else { return }
            navigationController.navigationBar.isHidden = false
            navigationController.viewControllers = [regVC]
        }
    }
    
    // MARK: - Dismiss
    
    func dismiss() {
        if let navigationController = navigationController {
            navigationController.dismiss(animated: true, completion: nil)
        }
    }
    
    func replaceRootController(on view: UIViewController) {
        //        <#code#>
    }
    
    func popToRoot() {
        //        <#code#>
    }
    
    func popToViewController(on view: UIViewController) {
        //        <#code#>
    }
    
    func pop(animated: Bool) {
        //        <#code#>
    }
}
