//
//  SnakeBarErrorView.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 17/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

final class SnakeBarErrorView: UIView {

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    // MARK: Initializers
    
    init() {
       let frame = CGRect(x: 0,
                         y: UIScreen.main.bounds.height,
                         width: UIScreen.main.bounds.width,
                         height: 60.0)
        
        super.init(frame: frame)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    
    private func setupView() {
        backgroundColor = .red
    }
    
    private func setupLayout() {
        addSubview(messageLabel, constraints: [
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    func show(_ message: String) {
        messageLabel.text = message
        animate()
    }
    
    private func animate() {
        let bounds = UIScreen.main.bounds
        
        UIView.animate(withDuration: 0.2,animations: { [weak self] in
            self?.center = CGPoint(x: bounds.width / 2,
                                   y: (bounds.height - 60.0) + (self?.safeAreaInsets.bottom ?? 0.0))
        }) { [weak self] _ in
            UIView.animate(withDuration: 0.2, delay: 5, animations: {
                self?.center = CGPoint(x: bounds.width / 2,
                                       y: bounds.height + (self?.safeAreaInsets.bottom ?? 0.0))
            })
        }
        
    }
    
}
