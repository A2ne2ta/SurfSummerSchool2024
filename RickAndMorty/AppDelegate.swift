//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Анна on 17.07.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window {
            let viewController = PersonsListViewController(viewModel: PersonsViewModel())
            let navigationController = UINavigationController()
            navigationController.viewControllers = [viewController]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
        
        return true
    }
}
