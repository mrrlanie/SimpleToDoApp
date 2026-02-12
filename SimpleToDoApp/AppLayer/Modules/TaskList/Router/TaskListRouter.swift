//
//  TaskListRouter.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation
import UIKit

// MARK: - TaskListRouter

final class TaskListRouter: TaskListRouterInput {
    
    fileprivate let transitionHandler: UINavigationController?
    
    init(transitionHandler: UINavigationController?) {
        self.transitionHandler = transitionHandler
    }
    
    func openTask(taskId: Int) { }
}
