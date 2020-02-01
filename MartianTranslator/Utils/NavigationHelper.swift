//
//  NavigationHelper.swift
//  MartianTranslator
//
//  Created by Marcus  Robinson on 1/19/20.
//  Copyright © 2020 Marcus  Robinson. All rights reserved.
//

import UIKit

class NavigationHelper {
    
    private init () { }
    
    static func setRootViewController(withViewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: withViewController)
        navigationController.navigationItem.hidesBackButton = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    static func pushViewController(navigationController: UINavigationController, viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    static func goBack(navigationController: UINavigationController, animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
}
