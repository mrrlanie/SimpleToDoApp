//
//  TaskListConfigurator.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation
import UIKit

// MARK: - TaskListConfigurator

class TaskListConfigurator {
    
    func configure() -> UIViewController {
        let view = TaskListViewController()
        let interactor = TaskListInteractor()
        //        let router = MainRouter()
        //
        let presenter = TaskListPresenter(view: view,
                                          interactor: interactor)
        
        view.output = presenter
        interactor.output = presenter
        return view
    }
}
