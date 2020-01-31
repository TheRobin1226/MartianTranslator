//
//  NavigationHelper.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/19/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import UIKit

class NavigationHelper {
    
    static let sharedInstance = NavigationHelper()
    
    private init () { }
    
    func setRootViewController(withViewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: withViewController)
        setNavigationBarAttributes(navigationController: navigationController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    func pushViewController(navigationController: UINavigationController, viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func goBack(navigationController: UINavigationController, animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
}

// MARK: - Private
private extension NavigationHelper {
    func setNavigationBarAttributes(navigationController: UINavigationController) {
        navigationController.navigationItem.backBarButtonItem?.title = ""
        navigationController.navigationBar.barTintColor = .black
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
