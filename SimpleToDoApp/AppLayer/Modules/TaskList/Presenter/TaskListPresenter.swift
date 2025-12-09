//
//  TaskListPresenter.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListPresenter

final class TaskListPresenter: TaskListViewOutput {

    // MARK: - Private properties
    
    private var view: TaskListViewInput
    
    // MARK: - Init
    
    init(view: TaskListViewInput) {
        self.view = view
    }
    
    func viewDidLoad() { }
    
    // MARK: - Public functions
    
    func didTapTask(taskIndex: Int) { }
    
    func didTapCreateTask() { }
    
    func didPullToRefresh() { }
    
    func didTapFilter(filterType: TaskState?) {
        print(filterType)
        view.updateFilter(selectedFilter: filterType)
        // tasks -> filter
    }
    
    // MARK: - Private functions
}

