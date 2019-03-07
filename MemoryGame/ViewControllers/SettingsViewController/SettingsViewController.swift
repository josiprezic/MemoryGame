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
    @IBOutlet private var colorPickerCell: UITableViewCell!
    @IBOutlet private var deleteScoreboardDataCell: UITableViewCell!
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
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.001))

        [brightnessTitleCell, brightnessSliderCell, colorPickerCell, deleteScoreboardDataCell].forEach { cell in
            cell?.tintColor = .white
            cell?.textLabel?.textColor = .white
            cell?.backgroundColor = UIHelper.AppColors.GRAY_LIGHT
            cell?.selectionStyle = .none
        }
        
        brightnessTitleCell.textLabel?.text = Constants.SettingsVC.brightness
        
        colorPickerCell.textLabel?.text = Constants.SettingsVC.cardBackgroundColor
        colorPickerCell.accessoryType = .disclosureIndicator
        
        deleteScoreboardDataCell.textLabel?.text = Constants.SettingsVC.deleteScoreboardData
        deleteScoreboardDataCell.textLabel?.textColor = .red
    }
}

//
// MARK: - EXTENSION - UITableViewDelegate, UITableViewDataSource
//

extension SettingsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        headerView.backgroundColor = UIHelper.AppColors.GRAY_DARK
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1, indexPath.row == 0 {
            // color picker cell
        } else if indexPath.section == 2, indexPath.row == 0 {
            // delete scoreboard data cell
        }
        // other cells
    }
}
