//
//  ExchangesListScene.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

final class ExchangesListScene: UIViewController {
    
    private let tableView  = UITableView()
    private let snakeBarErrorView = SnakeBarErrorView()
    private let loadingView = NVActivityIndicatorView(frame: .zero)
    
    private lazy var dataSource: ExchangesListDataSource = {
        let completion: ExchangesListDataSource.CompletionHandler = { [weak self] in
            self?.didSelect(viewModel: $0)
        }
        
        let completionRefresh: ExchangesListDataSource.CompletionHandlerRefresh = { [weak self] in
            self?.loadExchanges()
        }
        
        let dataSource = ExchangesListDataSource(tableView: tableView,
                                                 completion: completion,
                                                 completionRefresh: completionRefresh)
    
        return dataSource
    }()
    
    private lazy var interactor: ExchangesListInteractor = {
        return ExchangesListInteractor(gateway: gateway, presenter: self)
    }()
    
    private let gateway: ExchangeGateway
    private let delegate: ExchangesListViewDelegate
    
    // MARK: Initializer
    
    init(gateway: ExchangeGateway, delegate: ExchangesListViewDelegate) {
        self.gateway = gateway
        self.delegate = delegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    
    override func loadView() {
        super.loadView()
        
        setupView()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadExchanges()
    }
    
    // MARK: Private functions
    
    private func setupView() {
        view.accessibilityLabel = R.string.accessibilityLabels.exchangeList()
    }
    
    private func setupLayout() {
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(snakeBarErrorView)
        
        view.addSubview(loadingView, constraints: [
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 50),
            loadingView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func loadExchanges() {
        interactor.loadExchanges()
    }
    
    private func didSelect(viewModel: ExchangeViewModel) {
        delegate.didSelect(viewModel: viewModel)
    }
}

extension ExchangesListScene: ExchangesListPresenter {
    
    func onExchanges(viewModels: [ExchangeViewModel]) {
        self.dataSource.viewModels = viewModels
    }
    
    func onError(message: String) {
        snakeBarErrorView.show(message)
    }
    
    func showLoading() {
        loadingView.startAnimating()
    }
    
    func hideLoading() {
        loadingView.stopAnimating()
    }
    
}
