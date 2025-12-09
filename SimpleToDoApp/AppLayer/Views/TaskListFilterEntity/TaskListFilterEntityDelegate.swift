//
//  TaskListFilterEntityDelegate.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListFilterEntityDelegate

protocol TaskListFilterEntityDelegate: AnyObject {
    
    func didTapFilter(filterType: TaskState?)
}
