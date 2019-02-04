//
//  MenuViewController.swift
//  MemoryGame
//
//  Created by Korisnik on 04/02/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    // MARK: - IBOUTLETS
    
    
    @IBOutlet var btnNewGame: UIButton!
    
    
    // MARK: - VIEW METHODS
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
        title = "Menu"
        btnNewGame.layer.cornerRadius = 5.0
        btnNewGame.clipsToBounds = true
    }
    
    
    // MARK: - ACTIONS
    
    
    @IBAction func btnNewGamePressed(_ sender: UIButton) {
        navigationController?.pushViewController(GameViewController.fromStoryboard(), animated: true)
    }
    

}
