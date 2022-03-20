//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 05.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var basicView: UIView!

    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        basicView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColor()
        
        setValue(for: redColorLabel, greenColorLabel, blueColorLabel)
        
    }
   

    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redColorLabel.text = string(from: redSlider)
        case greenSlider:
            greenColorLabel.text = string(from: greenSlider)
        default:
            blueColorLabel.text = string(from: blueSlider)
        }
    }
    
    private func setColor() {
        basicView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redColorLabel:
                redColorLabel.text = string(from: redSlider)
            case greenColorLabel:
                greenColorLabel.text = string(from: greenSlider)
            default:
                blueColorLabel.text = string(from: blueSlider)
            }
            
        }
        
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
