//
//  TaskListInteractor.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation

// MARK: - TaskListInteractor

final class TaskListInteractor: TaskListInteractorInput {
    
    // MARK: - Public properties
    
    weak var output: TaskListInteractorOutput?
    
    // MARK: - Private properties
    
    private var data: [TaskModel] = []
    
    // MARK: - Init
    
    init() { }
    
    // MARK: - Private functions
    
    // MARK: - Public functions
    
    func createDummies() {
        data.removeAll()
        
        let itemsCount = Int.random(in: 8...16)
        let now = Date()
        let calendar = Calendar.current
        
        for index in 0..<itemsCount {
            let adjective = Globals.TaskMocks.titleAdjectives.randomElement() ?? "Новый"
            let noun = Globals.TaskMocks.titleNouns.randomElement() ?? "задача"
            let name = "\(adjective) \(noun) #\(index + 1)"
            
            let description = Globals.TaskMocks.descriptionPhrases.randomElement() ?? "Обновить детали задачи."
            
            let createdOffset = Int.random(in: 0...10)
            let dueOffset = Int.random(in: -2...10)
            
            let createdAt = calendar.date(byAdding: .day,
                                          value: -createdOffset,
                                          to: now) ?? now
            let dueDate = calendar.date(byAdding: .day,
                                        value: dueOffset,
                                        to: createdAt) ?? createdAt
            
            let state = TaskState.allCases.randomElement() ?? .opened
            
            data.append(.init(taskId: index,
                              taskName: name,
                              taskDescription: description,
                              createdAt: createdAt,
                              dueDate: dueDate,
                              taskState: state))
        }
        
        output?.dataChanged(data: data)
    }
    
    func sortDummies(for type: TaskState?) {
        if let type {
            var sortedData: [TaskModel] = []
            for task in data where task.taskState == type {
                sortedData.append(task)
            }
            
            output?.dataChanged(data: sortedData)
        } else {
            output?.dataChanged(data: data)
        }
    }
}
