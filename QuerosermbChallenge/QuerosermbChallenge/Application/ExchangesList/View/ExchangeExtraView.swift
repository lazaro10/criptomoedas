//
//  ExchangeExtraView.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 15/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

final class ExchangeExtraView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel])
        stackView.spacing = 8
        
        return stackView
    }()
    
    // MARK: Initializer
    
    init(title: String, date: String) {
        titleLabel.text = title
        dateLabel.text = date
        
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    
    private func setupLayout() {
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
