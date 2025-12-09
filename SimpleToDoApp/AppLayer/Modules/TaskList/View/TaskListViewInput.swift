//
//  TaskListViewInput.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListViewInput

protocol TaskListViewInput: AnyObject {
    
    func updateFilter(selectedFilter: TaskState?)
    func updateTasks(tasks: [TaskModel])
}
