//
//  SettingsViewController.swift
//  MemoryGame
//
//  Created by Korisnik on 03/03/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    //
    // MARK: - OUTLETS
    //
    
    @IBOutlet private var brightnessTitleCell: UITableViewCell!
    @IBOutlet private var brightnessSliderCell: UITableViewCell!
    @IBOutlet private var brightnessSlider: UISlider!
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    //
    // MARK: - ACTIONS
    //
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        UIScreen.main.brightness = sender.value.cgFloat
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
        tableView.tableFooterView = UIView()
        
        [brightnessTitleCell, brightnessSliderCell].forEach { cell in
            cell?.tintColor = .white
            cell?.textLabel?.textColor = .white
            cell?.backgroundColor = UIHelper.AppColors.GRAY_LIGHT
            cell?.selectionStyle = .none
        }
        
        brightnessTitleCell.textLabel?.text = Constants.SettingsVC.brightness
    }
}

//
// MARK: - EXTENSION - UITableViewDelegate, UITableViewDataSource
//

extension SettingsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
}
