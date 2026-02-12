//
//  TaskListFilterCell.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import UIKit
import Foundation
import SnapKit

// MARK: - TaskListFilterCell

final class TaskListFilterCell: UITableViewCell {
    
    // MARK: - Public properties
    
    static let cellIdentifier = "TaskListFilterCell"
    weak var delegate: TaskListFilterCellDelegate?
    
    // MARK: - UI
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        view.delegate = self
        return view
    }()
    
    fileprivate lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    // MARK: - Private functions
    
    private func commonInit() {
        selectionStyle = .none
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        containerView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    // MARK: - Public functions
    
    func configure(with model: TaskListFilterCellUIModel) {
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        let filterAllView = TaskListFilterEntity()
        filterAllView.delegate = delegate
        filterAllView.configure(with: .init(filterType: nil,
                                            isSelected: model.selectedType == nil))
        
        stackView.addArrangedSubview(filterAllView)
        
        for filter in TaskState.allCases {
            let view = TaskListFilterEntity()
            view.delegate = delegate
            view.configure(with: .init(filterType: filter,
                                       isSelected: model.selectedType == filter))
            stackView.addArrangedSubview(view)
        }
    }
}

extension TaskListFilterCell: UIScrollViewDelegate { }
