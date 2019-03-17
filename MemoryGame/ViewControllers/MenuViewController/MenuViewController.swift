//
//  MenuViewController.swift
//  MemoryGame
//
//  Created by Korisnik on 04/02/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    //
    // MARK: - IBOUTLETS
    //
    
    @IBOutlet var btnNewGame: UIButton!
    @IBOutlet var btnScoreboard: UIButton!
    @IBOutlet var btnSettings: UIButton!
    @IBOutlet var imgLogo: UIImageView!
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //
    // MARK: - ACTIONS
    //
    
    @IBAction func btnNewGamePressed(_ sender: UIButton) {
        navigationController?.pushViewController(GameViewController.fromStoryboard(), animated: true)
    }
    
    @IBAction func btnScoreboardPressed(_ sender: Any) {
        navigationController?.pushViewController(ScoreboardViewController.fromStoryboard(), animated: true)
    }
    
    @IBAction func btnSettingsPressed(_ sender: UIButton) {
        navigationController?.pushViewController(SettingsViewController.fromStoryboard(), animated: true)
    }
    
    
    //
    // MARK: - METHODS
    //
    
    private final func configure() {
        configureView()
        configureButtons()
    }
    
    private final func configureView() {
        title = Constants.MenuVC.menuTitle
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
        navigationController?.navigationBar.barStyle = .black
    }
    
    private final func configureButtons() {
        [btnNewGame, btnScoreboard, btnSettings].forEach { btn in
            btn?.layer.cornerRadius = 10.0
            btn?.clipsToBounds = true
        }
    }

}
