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
    private var interactor: TaskListInteractorInput
    
    // MARK: - Init
    
    init(view: TaskListViewInput,
         interactor: TaskListInteractorInput) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.createDummies()
    }
    
    // MARK: - Public functions
    
    func didTapCreateTask() { }
    
    func didPullToRefresh() { }
    
    // MARK: - Private functions
}

// MARK: - TaskListInteractorOutput

extension TaskListPresenter: TaskListInteractorOutput {
    
    func dataChanged(data: [TaskModel]) {
        view.updateTasks(tasks: data)
    }
}

// MARK: - TaskListFilterCellDelegate

extension TaskListPresenter: TaskListFilterCellDelegate {
    
    func didTapFilter(filterType: TaskState?) {
        print(filterType)
        view.updateFilter(selectedFilter: filterType)
        interactor.sortDummies(for: filterType)
    }
}
 
// MARK: - TaskListCellDelegate

extension TaskListPresenter: TaskListCellDelegate {
    
    func didTapOnCell(cell: TaskListCell) { }
}

