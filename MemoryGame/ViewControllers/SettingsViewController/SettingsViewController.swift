//
//  SettingsViewController.swift
//  MemoryGame
//
//  Created by Korisnik on 03/03/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit
import ChromaColorPicker

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
    // MARK: - VARIABLES
    //
    
    lazy var colorPicker: UIView = {
        let pickerContainer = UIView(frame: view.frame)
        pickerContainer.backgroundColor = .black
        let pickerSize: CGFloat = UIScreen.main.bounds.maxX - 60
        let x = UIScreen.main.bounds.midX - (pickerSize/2)
        let y = UIScreen.main.bounds.midY - (pickerSize/2)
        let frame = CGRect(x: x, y: y, width: pickerSize, height: pickerSize)
        let picker = ChromaColorPicker(frame: frame)
        picker.delegate = self
        picker.padding = 0
        picker.stroke = 3
        picker.addButton.plusIconLayer?.isHidden = true
        picker.shadeSlider.isHidden = true
        picker.hexLabel.isHidden = true
        pickerContainer.addSubview(picker)
        view.addSubview(pickerContainer)
        picker.center = pickerContainer.center
        pickerContainer.isHidden = true
        return pickerContainer
    }()
    
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
        brightnessSlider.value = Float(UIScreen.main.brightness)
        
        colorPickerCell.textLabel?.text = Constants.SettingsVC.cardBackgroundColor
        colorPickerCell.accessoryType = .disclosureIndicator
        
        deleteScoreboardDataCell.textLabel?.text = Constants.SettingsVC.deleteScoreboardData
        deleteScoreboardDataCell.textLabel?.textColor = .red
    }
    
    private final func handleDeleteAllPlayers() {
        let alert = UIAlertController(title: Constants.SettingsVC.areYouSure, message: Constants.SettingsVC.allDataDeleted, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: Constants.SettingsVC.delete, style: .destructive, handler: { _ in CoreDataHelper.Players.deleteAllPlayers() })
        let cancelAction = UIAlertAction(title: Constants.SettingsVC.cancel, style: .cancel, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private final func showPickerView() {
        tableView.isScrollEnabled = false
        colorPicker.alpha = 0
        colorPicker.isHidden = false
        UIView.animate(withDuration: 0.2) { self.colorPicker.alpha = 1 }
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
            showPickerView()
        } else if indexPath.section == 2, indexPath.row == 0 {
            handleDeleteAllPlayers()
        }
    }
}

//
// MARK: - EXTENSION - ChromaColorPickerDelegate
//

extension SettingsViewController: ChromaColorPickerDelegate {
    func colorPickerDidChooseColor(_ colorPicker: ChromaColorPicker, color: UIColor) {
        tableView.isScrollEnabled = true
        self.colorPicker.alpha = 1
        UIView.animate(withDuration: 0.2,
                       animations: { self.colorPicker.alpha = 0 },
                       completion: { _ in self.colorPicker.isHidden = true })
    }
}
