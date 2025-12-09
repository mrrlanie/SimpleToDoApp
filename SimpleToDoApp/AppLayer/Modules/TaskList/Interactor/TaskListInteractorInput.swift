//
//  TaskListInteractorInput.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListInteractorInput

protocol TaskListInteractorInput: AnyObject {
    
    func createDummies()
    func sortDummies(for type: TaskState?)
}
