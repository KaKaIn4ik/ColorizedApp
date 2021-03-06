//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Кунгурцев Эдуард Сергеевич on 05.03.2022.
//

import UIKit



class SettingsViewController: UIViewController {

    @IBOutlet var basicView: UIView!

    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!

    var delegate: SettingsViewControllerDelegate!
    var mediator: UIColor!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        basicView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        basicView.backgroundColor = mediator
        decompositionComponents()
        setColor()

        setValue(for: redColorLabel, greenColorLabel, blueColorLabel)
        valueTextField(for: redTextField, greenTextField, blueTextField)
        
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
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func doneButtonPressed() {
        guard let color = basicView.backgroundColor else { return }
        delegate.setColor(color: color)
        dismiss(animated: true)
    }

    private func setColor() {
        basicView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func decompositionComponents(){
        
        let mainColor = CIColor(color: mediator)
        
        redSlider.value = Float(mainColor.red)
        greenSlider.value = Float(mainColor.green)
        blueSlider.value = Float(mainColor.blue)

//        redTextField.text = String(mainColor.red)
//        greenTextField.text = String(mainColor.green)
//        blueTextField.text = String(mainColor.blue)
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
    private func valueTextField(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = (string(from: redSlider))
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
}
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

