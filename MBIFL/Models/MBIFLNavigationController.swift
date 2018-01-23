//
//  MBIFLNavigationController.swift
//  MBIFL
//
//  Created by Yashin on 20/01/18.
//  Copyright © 2018 Logicalsteps. All rights reserved.
//

import UIKit

class MBIFLNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    private let navigationBarImage = UIImage(named: "Nav_Background")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 167.0), resizingMode: .stretch)
    private let titleViewImage = UIImageView(image: UIImage(named: "Title_View"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.navigationBar.setBackgroundImage(navigationBarImage, for: .default)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.visibleViewController?.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .plain, target: nil, action: nil)
        super.pushViewController(viewController, animated: animated)
    }
    
    
    // MARK: - NavigationController Delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        //viewController.navigationItem.titleView = titleViewImage
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //viewController.navigationItem.titleView = titleViewImage
    }

}
