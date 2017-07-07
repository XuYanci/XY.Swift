//
//  Viper.swift
//  XYSwiftExercisePro
//
//  Created by tdw on 2017/7/7.
//  Copyright © 2017年 tdw. All rights reserved.
//

import UIKit

//// I
//// E
//// D
/// Application Logic -- can tdd

/// Module Interface
//// Interface  --  can do what
//// Delegate   --  do what

///  UserInterface
//// V
//// P
//// R

// Viper Structure
//             R
//             |
//   V   ->    P  -> I   - E
//       <~       <~     - E
//                   |
//                   D
//
//

/// Basic framework class

protocol ViewInterface:class {
    var presenter:PresenterInterface? { get set }
    // P -> V
}

protocol InteractorInterface:class {
    var presenter:PresenterInterface? { get set }
    
    // P -> I
}

protocol PresenterInterface:class {
    weak var viewer:ViewInterface?  {get set}
    weak var interactor:InteractorInterface? {get set}
    weak var router:RouterInterface? {get set}
    
    // V -> P
    // I -> P
    // R -> P
}

protocol RouterInterface:class {
    var presenter:PresenterInterface?{get set}
    // P -> R
}


protocol EntityInterface {
    
}


/// ModuleInterface
/// Mediactor for ApplicationLogin and UserInterface
protocol MainModuleInterface:PresenterInterface {
    func gotoLogin()
    func gotoRegister()
}
protocol LoginModuleInterface:PresenterInterface {
    func login(username:String,password:String)
}

protocol RegisterModuleInterface:PresenterInterface {
    func register(username:String,password:String)
}

protocol MainModuleDelegate:ViewInterface {
    
}
protocol LoginModuleDelegate :ViewInterface{
    
    func didLoginSuccess() -> Void;
    func didLoginFail(error:Error)-> Void;
}

protocol RegisterModuleDelegate:ViewInterface {
    func didRegisterSuccess()->Void
    func didRegisterFail(error:Error)->Void
}



/// UserInterface
class LoginViewController: UIViewController,LoginModuleDelegate {
 
    var presenter: PresenterInterface?
 
    func didLoginFail(error: Error) {
        
    }

    func didLoginSuccess() {
        
    }
    
    @IBAction func clickOnLogIn() {
        if let p = presenter as? LoginModuleInterface {
            p.login(username: "abc", password: "12345")
        }
    }
}

class RegisterViewController: UIViewController,RegisterModuleDelegate {
    func didRegisterFail(error: Error) {
        
    }

    func didRegisterSuccess() {
        
    }
    
    @IBAction func clickOnRegister() {
        if let p = presenter as? RegisterModuleInterface {
            p.register(username: "abc", password: "12345")
        }
    }
 
    var presenter: PresenterInterface?
}

class MainViewController: UIViewController,MainModuleDelegate {
    
    @IBAction func clickOnLogin() {
        if let p = presenter as? MainModuleInterface {
            p.gotoLogin()
        }
    }
    
    @IBAction func clickOnRegister() {
        if let p = presenter as? MainModuleInterface {
            p.gotoRegister()
        }
    }
    
    var presenter: PresenterInterface?
    
}

class LoginPresenter: PresenterInterface,LoginModuleInterface {
    func login(username: String, password: String) {
        
    }
    weak var moduleDelegate:LoginModuleDelegate?
    var router: RouterInterface?
    var interactor: InteractorInterface?
    var viewer: ViewInterface?
}

class RegisterPresenter: PresenterInterface,RegisterModuleInterface {
    func register(username: String, password: String) {
        
    }
    weak var moduleDelegate:RegisterModuleDelegate?
    var router: RouterInterface?
    var interactor: InteractorInterface?
    var viewer: ViewInterface?
}

class MainPresenter:MainModuleInterface {
    func gotoRegister() {
        
    }

    func gotoLogin() {
        
    }
    weak var moduleDelegate:MainModuleDelegate?
    var router: RouterInterface?
    var interactor: InteractorInterface?
    var viewer: ViewInterface?
}

class MainRouter:RouterInterface {
    var presenter: PresenterInterface?

}

class RegisterRouter:RouterInterface {
    var presenter: PresenterInterface?
}

class LoginRouter:RouterInterface {
    var presenter: PresenterInterface?
}

/// ApplicationLogic
class MainInteractor:InteractorInterface {
    var presenter: PresenterInterface?
}

class LoginInteractor: InteractorInterface {
    var presenter: PresenterInterface?
}

class RegisterInteractor: InteractorInterface {
    var presenter: PresenterInterface?
}

class Viper: NSObject {
    func main() {
        // Default setup main module
        let mainV:MainViewController = MainViewController()
        let mainP:MainPresenter = MainPresenter()
        let mainI:MainInteractor = MainInteractor()
        let mainR:MainRouter = MainRouter()
        
     
        
        mainV.presenter = mainP
        mainP.interactor = mainI
        mainP.router = mainR
        mainP.viewer = mainV
        mainI.presenter = mainP
        mainR.presenter = mainP
    }
    
    
}
