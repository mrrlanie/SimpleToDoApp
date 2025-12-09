//
//  TaskListInteractorOutput.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListInteractorOutput

protocol TaskListInteractorOutput: AnyObject {
    
    func dataChanged(data: [TaskModel])
}
