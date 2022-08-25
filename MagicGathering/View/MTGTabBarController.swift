//
//  MTGTabBarController.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 25/08/2022.
//
import UIKit

class MTGTabBarController: UITabBarController {
    
    private var cardTabBarItem: UITabBarItem {
        let icon = UIImage(named: "card")
        let tab = UITabBarItem(title: "Card", image: icon, tag: 1)
        return tab
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: MTGCardExploreController(), title: "Explore", tabBarItem: cardTabBarItem)
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, tabBarItem: UITabBarItem) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.backgroundColor = .white
        navController.navigationItem.largeTitleDisplayMode = .automatic
        navController.tabBarItem = tabBarItem
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            navBarAppearance.backgroundColor = .white
            navController.navigationBar.standardAppearance = navBarAppearance
            navController.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor  = .white
        tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        return navController
    }
}
