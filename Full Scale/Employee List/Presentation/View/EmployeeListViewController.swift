//
//  EmployeeListViewController.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit


final class EmployeeListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private let viewModel: EmployeeListViewModel
    
    init(viewModel: EmployeeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: EmployeeListViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.configure(tableView: tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let space = Device.isHorizontal ? 8 : 0
        tableView.snp.remakeConstraints {
            $0.top.equalTo(self.view.subviews[0].snp.bottom)
            $0.bottom.equalTo(0)
            $0.leading.trailing.equalToSuperview().inset(space)
        }
        tableView.reloadData()
    }


}
