//
//  ExchangesListDataSource.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 14/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation
import UIKit

final class ExchangesListDataSource: NSObject {
    
    typealias CompletionHandler = (ExchangeViewModel) -> ()
    typealias CompletionHandlerRefresh = () -> ()
    
    var viewModels: [ExchangeViewModel] = [] {
        didSet {
            refreshControl.endRefreshing()
            tableView?.reloadData()
        }
    }
    
    private let refreshControl = UIRefreshControl()
    private weak var tableView: UITableView?
    private let completion: CompletionHandler
    private let completionRefresh: CompletionHandlerRefresh
    
    init(tableView: UITableView,  completion: @escaping CompletionHandler, completionRefresh: @escaping CompletionHandlerRefresh) {
        self.tableView = tableView
        self.completion = completion
        self.completionRefresh = completionRefresh
        
        super.init()
        
        registerCells()
        setupDataSource()
        setupPullToRefresh()
    }
    
    private func registerCells() {
        tableView?.registerReusableCell(ExchangeTableViewCell.self)
    }
    
    private func setupDataSource() {
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    private func setupPullToRefresh() {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView?.refreshControl = refreshControl
    }
    
    @objc private func refresh() {
        completionRefresh()
    }
    
}

extension ExchangesListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExchangeTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        let viewModel = viewModels[indexPath.row]
        
        cell.bind(viewModel: viewModel)
        
        return cell
    }
    
}

extension ExchangesListDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completion(viewModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
