//
//  TaskListCell.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import UIKit
import Foundation
import SnapKit

// MARK: - TaskListCell

final class TaskListCell: UITableViewCell {
    
    // MARK: - Public properties
    
    static let cellIdentifier = "TaskListCell"
    weak var delegate: TaskListCellDelegate?
    
    // MARK: - UI
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate lazy var dueDateAtLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func commonInit() {
        selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        containerView.addSubview(dueDateAtLabel)
        dueDateAtLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.leading.greaterThanOrEqualToSuperview()
        }
        
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dueDateAtLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }
    
    // MARK: - Public functions
    
    func configure(with model: TaskListCellUIModel) {
        titleLabel.text = model.task.taskName
        dueDateAtLabel.text = model.task.dueDate.formatted()
        if model.task.dueDate < .now && model.task.taskState == .opened {
            dueDateAtLabel.textColor = .red
        } else {
            dueDateAtLabel.textColor = .darkGray
        }
    }
    
    // MARK: - Actions
    
    @objc private func didTapOnTask() {
        delegate?.didTapOnCell(cell: self)
    }
}
