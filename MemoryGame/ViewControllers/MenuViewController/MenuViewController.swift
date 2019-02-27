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
    @IBOutlet var imgLogo: UIImageView!
    
    //
    // MARK: - VIEW METHODS
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIHelper.AppColors.GRAY_DARK
        title = Strings.MenuVC.menuTitle
        btnNewGame.layer.cornerRadius = 10.0
        btnNewGame.clipsToBounds = true
    }
    
    //
    // MARK: - ACTIONS
    //
    
    @IBAction func btnNewGamePressed(_ sender: UIButton) {
        navigationController?.pushViewController(GameViewController.fromStoryboard(), animated: true)
    }
    

}
