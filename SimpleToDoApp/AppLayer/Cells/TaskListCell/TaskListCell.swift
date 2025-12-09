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
        return view
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 4
        return label
    }()
}
