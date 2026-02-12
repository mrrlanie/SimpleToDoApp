//
//  TaskModel.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskModel

struct TaskModel {
    
    let taskId: Int
    let taskName: String
    let taskDescription: String
    let createdAt: Date
    let dueDate: Date
    let taskState: TaskState
}

// MARK: TaskState

enum TaskState: String, CaseIterable {
    
    case opened
    case cancelled
    case closed
    
    var filterName: String {
        return self.rawValue.uppercased()
    }
}
