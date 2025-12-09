//
//  TaskListFilterEntity.swift
//  SimpleToDoApp
//
//  Created by Дарья Пахомова on 08.12.2025.
//

import Foundation
import UIKit
import SnapKit

// MARK: - TaskListFilterEntity

final class TaskListFilterEntity: UIView {
    
    // MARK: - Public properties
    
    weak var delegate: TaskListFilterEntityDelegate?
    
    // MARK: - Private properties
    
    fileprivate var filterType: TaskState?
    
    // MARK: - UI
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func commonInit() {
        backgroundColor = .clear
        
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(didTapOnFilter)))
        
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(30)
        }
        
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    // MARK: - Public functions
    
    func configure(with model: TaskListFilterEntityModel) {
        filterType = model.filterType
        containerView.backgroundColor = model.isSelected ? .black : .white
        containerView.layer.borderColor = model.isSelected ? UIColor.darkGray.cgColor : UIColor.lightGray.cgColor
        titleLabel.textColor = model.isSelected ? .white : .black
        if let filterType = model.filterType {
            titleLabel.text = filterType.filterName
        } else {
            titleLabel.text = "ALL"
        }
    }
    
    // MARK: - Actions
    
    @objc private func didTapOnFilter() {
        delegate?.didTapFilter(filterType: filterType)
    }
}
