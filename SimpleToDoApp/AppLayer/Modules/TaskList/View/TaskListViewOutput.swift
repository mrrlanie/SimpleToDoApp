//
//  TaskListViewOutput.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListViewOutput

protocol TaskListViewOutput: AnyObject, TaskListFilterCellDelegate {
    
    func viewDidLoad()
    func didTapTask(taskIndex: Int)
    func didTapCreateTask()
    func didPullToRefresh()
}
