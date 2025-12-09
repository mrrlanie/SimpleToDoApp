//
//  TaskListCellDelegate.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

// MARK: - TaskListCellDelegate

protocol TaskListCellDelegate: AnyObject {
    
    func didTapOnCell(cell: TaskListCell)
}
