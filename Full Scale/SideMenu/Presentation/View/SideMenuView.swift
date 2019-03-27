//
//  SideMenuNavigationDrawer.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 14/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit


final class SideMenuView: RDNavigationDrawer {
    
    @IBOutlet private var tableView: UITableView!
    private var viewModel: SideMenuViewModel!

    init(viewModel: SideMenuViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.configure(tableView: tableView)
    }
    
    override func viewDidDisappear() {
        super.viewDidDisappear()
        viewModel?.reload()
    }
    
}
