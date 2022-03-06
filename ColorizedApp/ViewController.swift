//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 05.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var basicView: UIView!
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumTrackTintColor = .red
        redColorLabel.text = String(redSlider.value)
        
        greenSlider.minimumTrackTintColor = .green
        greenColorLabel.text = String(greenSlider.value)

        blueSlider.minimumTrackTintColor = .blue
        blueColorLabel.text = String(blueSlider.value)
        
    }
    func changeColor(){
        let sliderValue = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        basicView.backgroundColor = sliderValue
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
    }
    



    @IBAction func redSliderAction() {
        redColorLabel.text = String(redSlider.value)
        changeColor()
    }
    
    @IBAction func greenSliderAction() {
        greenColorLabel.text = String(greenSlider.value)
        changeColor()
    }

    @IBAction func blueSliderAction() {
        blueColorLabel.text = String(blueSlider.value)
        changeColor()
    }
}

