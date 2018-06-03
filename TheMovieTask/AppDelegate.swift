//
//  AppDelegate.swift
//  TheMovieTask
//
//  Created by Muhammad Raza on 03/06/2018.
//  Copyright © 2018 Muhammad Raza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initializeInitialController()
        
        return true
    }
    
    private func initializeInitialController() {
        let moviesSearchViewController = SearchMoviesViewController.fromStoryboard()
        let moviesSearchViewModel = SearchMoviesViewModel(delegate: moviesSearchViewController)
        moviesSearchViewController.viewModel = moviesSearchViewModel
        
        let navigationController = UINavigationController(rootViewController: moviesSearchViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
}
