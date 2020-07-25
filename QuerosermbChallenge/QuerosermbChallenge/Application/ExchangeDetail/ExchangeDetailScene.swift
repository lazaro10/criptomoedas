//
//  ExchangeDetailScene.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 16/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

class ExchangeDetailScene: UIViewController {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconImageView, nameLabel])
        stackView.spacing = 16

        return stackView
    }()
    
    private lazy var extrasStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 16

        return stackView
    }()
    
    var viewModel: ExchangeViewModel?

    // MARK: Life Cycle
    
    override func loadView() {
        super.loadView()
     
        setupView()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindExchangeViewModel()
    }
    
    // MARK: Private functions

    private func setupView() {
        view.accessibilityLabel = R.string.accessibilityLabels.exchangeDetail()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    private func setupLayout() {
        view.addSubview(iconImageView, constraints: [
            iconImageView.heightAnchor.constraint(equalToConstant: 70),
            iconImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(extrasStackView, constraints: [
            extrasStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
            extrasStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            extrasStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
    
    private func bindExchangeViewModel() {
        guard let viewModel = viewModel else { return }
        
        iconImageView.kf.setImage(with: viewModel.icon)
        nameLabel.text = viewModel.name
        viewModel.allExtras.forEach {
            extrasStackView.addArrangedSubview(ExchangeExtraView(title: $0.0, date: $0.1))
        }
    }
    
}
