//
//  TaskListViewOutput.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListViewOutput

protocol TaskListViewOutput: AnyObject,
                             TaskListFilterCellDelegate,
                             TaskListCellDelegate {
    
    func viewDidLoad()
    func didTapCreateTask()
    func didPullToRefresh()
}
