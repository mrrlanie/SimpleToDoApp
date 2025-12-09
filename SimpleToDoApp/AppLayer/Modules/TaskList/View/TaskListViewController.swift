//
//  TaskListViewController.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import UIKit
import SnapKit

// MARK: - TaskListViewController

final class TaskListViewController: UIViewController {
    
    // MARK: - Public properties
    
    var output: TaskListViewOutput?
    
    // MARK: - Private properties
    
    fileprivate var tasks: [TaskModel] = []
    fileprivate var selectedFilter: TaskState?
    
    // MARK: - UI
    
    fileprivate let refreshControl = UIRefreshControl()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.refreshControl = refreshControl
        tableView.separatorColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // TODO: - Paging
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self,
                                 action: #selector(didPullToRefresh),
                                 for: .valueChanged)
        
        registerCells()
        setupUI()
        output?.viewDidLoad()
    }
    
    // MARK: - Public functions
    
    func registerCells() {
        tableView.register(TaskListFilterCell.self,
                           forCellReuseIdentifier: "TaskListFilterCell")
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    
    // MARK: - Actions
    
    @objc private func didPullToRefresh() {
        output?.didPullToRefresh()
    }
    
}

// MARK: - TaskListViewInput

extension TaskListViewController: TaskListViewInput {
    
    func updateFilter(selectedFilter: TaskState?) {
        self.selectedFilter = selectedFilter
        UIView.performWithoutAnimation {
            tableView.reloadData()
        }
    }
    
    func updateTasks(tasks: [TaskModel]) { }
}

// MARK: - UITableViewDataSource

extension TaskListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListFilterCell.cellIdentifier,
                                                                for: indexPath) as? TaskListFilterCell else {
                return UITableViewCell()
            }
            
            cell.delegate = output
            cell.configure(with: .init(selectedType: selectedFilter))
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension TaskListViewController: UITableViewDelegate { }
