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
    @IBOutlet var imgLogo: UIImageView!
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
    
    //
    // MARK: - METHODS
    //
    
    private final func configureUI() {
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
        title = Strings.MenuVC.menuTitle
        
        [btnNewGame, btnScoreboard].forEach { btn in
            btn?.layer.cornerRadius = 10.0
            btn?.clipsToBounds = true
        }
    }

}
