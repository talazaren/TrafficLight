//
//  ViewController.swift
//  TrafficLight
//
//  Created by Tatiana Lazarenko on 1/26/24.
//

import UIKit

final class ViewController: UIViewController {
    let statusOn: CGFloat = 1
    let statusOff: CGFloat = 0.3

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var lightButton: UIButton!
    
    private var activeLight: TrafficLight?
    
    private enum TrafficLight {
        case red
        case yellow
        case green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = statusOff
        yellowLightView.alpha = statusOff
        greenLightView.alpha = statusOff
    }
    
    @IBAction func lightButtonDidTapped() {
        lightButton.setTitle("NEXT", for: .normal)
        
        switch activeLight {
        case .red:
            redLightView.alpha = statusOff
            yellowLightView.alpha = statusOn
            activeLight = .yellow
        case .yellow:
            yellowLightView.alpha = statusOff
            greenLightView.alpha = statusOn
            activeLight = .green
        case .green:
            greenLightView.alpha = statusOff
            redLightView.alpha = statusOn
            activeLight = .red
        case nil:
            redLightView.alpha = statusOn
            activeLight = .red
        }
    }
}

