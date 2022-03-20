//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 20.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(color: UIColor)
    
}

class MainViewContoller : UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else {return}
        settingVC.mediator = view.backgroundColor
        settingVC.delegate = self
        
    }
    
}

// MARK: - SettingsViewControllerDelegate
extension MainViewContoller: SettingsViewControllerDelegate {
    func setColor(color: UIColor) {
    
    }
    

    
    
}
