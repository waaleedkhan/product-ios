//  Created on 6/4/21.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - Life Cycle Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let productListController = ProductListController(viewModel: ProductsViewModel(provider: ProductsProvider(service: ProductService())))
        
        // Ideally, There should be a Root Controller handling all these
        window?.rootViewController = UINavigationController(rootViewController: productListController)
        window?.makeKeyAndVisible()
        
        return true
    }

}
