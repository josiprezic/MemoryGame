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
    
    @IBOutlet var tableView: UITableView!
    
    //
    // MARK: - VARIABLES
    //
    
    var topPlayers: [String] {
        return [
            "Player 1",
            "Player 2",
            "Player 3",
            "Player 4",
            "Player 5",
            "Player 6",
            "Player 7",
            "Player 8",
            "Player 9",
            "Player 10"
        ]
    }
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        configureUI()
    }
    
    //
    // MARK: - METHODS
    //
    
    private final func configureUI() {
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
        tableView.backgroundColor = UIHelper.AppColors.GRAY_DARK
        title = Strings.ScoreboardVC.title
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
        cell.textLabel?.text = "\(indexPath.row + 1). \(topPlayers[indexPath.row])"
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
