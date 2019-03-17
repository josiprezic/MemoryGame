//
//  ScoreboardViewController.swift
//  MemoryGame
//
//  Created by Korisnik on 28/02/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

class ScoreboardViewController: UIViewController {

    //
    // MARK: - OUTLETS
    //
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var noDataContainerView: UIView!
    @IBOutlet private var imgVwNoData: UIImageView!
    @IBOutlet private var lblNoData: UILabel!
    
    
    //
    // MARK: - VARIABLES
    //
    
    lazy var topPlayers = CoreDataHelper.Players.getTopPlayers(top: Constants.ScoreboardVC.scoreboardSize)
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //
    // MARK: - METHODS
    //
    
    private final func configure() {
        configureView()
        configureTableView()
    }
    
    private final func configureView() {
        title = Constants.ScoreboardVC.title
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
    }
    
    private final func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIHelper.AppColors.GRAY_DARK
        if topPlayers.isEmpty {
            showEmptyDataSet()
        }
    }
    
    private final func showEmptyDataSet() {
        tableView.isHidden = true
        imgVwNoData.image = #imageLiteral(resourceName: "no_data")
        lblNoData.text = Constants.ScoreboardVC.noData
        lblNoData.textColor = .white
        noDataContainerView.backgroundColor = .clear
        noDataContainerView.alpha = 0.5
        noDataContainerView.isHidden = false
    }

}

//
// MARK: - EXTENSION: - UITableViewDelegate, UITableViewDataSource
//

extension ScoreboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIHelper.AppColors.GRAY_LIGHT
        cell.textLabel?.text = "\(indexPath.row + 1). \(topPlayers[indexPath.row].username) - \(Double(round(topPlayers[indexPath.row].score * 10)/10))"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
