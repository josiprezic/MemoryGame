//
//  SettingsViewController.swift
//  MemoryGame
//
//  Created by Korisnik on 03/03/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //
    // MARK: - OUTLETS
    //
    
    @IBOutlet var tableView: UITableView!
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    //
    // MARK: METHODS
    //
    
    private final func configure() {
        configureView()
        configureTableView()
    }
    
    private final func configureView() {
        title = Constants.SettingsVC.title
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
    }
    
    private final func configureTableView() {
        tableView.backgroundColor = UIHelper.AppColors.GRAY_DARK
    }
}

//
// MARK: - EXTENSION - UITableViewDelegate, UITableViewDataSource
//

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIHelper.AppColors.GRAY_DARK
        return cell
    }
}
