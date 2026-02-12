//
//  UINavigation+extensions.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 12.02.2026.
//

import Foundation
import UIKit

// MARK: - Transition Handler

extension UINavigationController {
    
    func push(controller: UIViewController,
              animated: Bool = true,
              completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(controller, animated: animated)
        CATransaction.commit()
    }
    
    func pushIfNeeded(controller: UIViewController,
                      animated: Bool = true) {
        if let top = topViewController,
           type(of: top) == type(of: controller) {
            return
        }
        pushViewController(controller, animated: animated)
    }

    func present(controller: UIViewController,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        topViewController?.present(controller, animated: animated, completion: completion)
    }

    func presentEmbedded(controller: UIViewController,
                         animated: Bool = true,
                         completion: (() -> Void)? = nil) {
        let nav = UINavigationController(rootViewController: controller)
        topViewController?.present(nav, animated: animated, completion: completion)
    }
    
    func back(animated: Bool = true) {
        popViewController(animated: animated)
    }

    func toRoot(animated: Bool = true) {
        popToRootViewController(animated: animated)
    }

    func to(index: Int, animated: Bool = true) {
        guard index >= 0, index < viewControllers.count else { return }
        let vc = viewControllers[index]
        popToViewController(vc, animated: animated)
    }
    
    func setRoot(controller: UIViewController,
                 animated: Bool = true) {
        setViewControllers([controller], animated: animated)
    }
}
