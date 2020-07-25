//
//  ExchangeTableViewCell.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 14/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit
import Kingfisher

final class ExchangeTableViewCell: UITableViewCell, Reusable  {
    
    private let iconImageView = UIImageView()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
              
        return label
    }()
    
    private let identifierLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .orange
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, nameLabel, identifierLabel])
        stackView.spacing = 16

        return stackView
    }()
    
    private lazy var extrasStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 8

        return stackView
    }()
    
    func bind(viewModel: ExchangeViewModel) {
        iconImageView.kf.setImage(with: viewModel.icon)
        nameLabel.text = viewModel.name
        identifierLabel.text = viewModel.exchangeId
        extrasStackView.removeAllArrangedSubviews()
        viewModel.extras.forEach {
            extrasStackView.addArrangedSubview(ExchangeExtraView(title: $0.0, date: $0.1))
        }
    }
    
    // MARK: Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    
    private func setupView() {
        accessibilityLabel = R.string.accessibilityLabels.exchangeCell()
    }
    
    private func setupLayout() {
        addSubview(iconImageView, constraints: [
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        addSubview(extrasStackView, constraints: [
            extrasStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            extrasStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            extrasStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            extrasStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
}


