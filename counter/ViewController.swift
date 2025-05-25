//
//  ViewController.swift
//  counter
//
//  Created by Владислав Маскайкин on 25.05.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    private var currentValue: Int {
        get {
            return Int(counterLabel.text!)!
        }
        set {
            counterLabel.text = "\(newValue)"
        }
    }
    
    @IBAction func plusTappedAction() {
        currentValue+=1
        addHistoryMsg("значение изменено на +1")
    }
    
    @IBAction func minusTappedAction() {
        if (currentValue > 0) {
            currentValue-=1
            addHistoryMsg("значение изменено на -1")
        } else {
            addHistoryMsg("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetTappedAction() {
        currentValue = 0
        addHistoryMsg("значение сброшено")
    }
    
    private func addHistoryMsg(_ msg: String) {
        let timestamp = DateFormatter.localizedString(
            from: Date(),
            dateStyle: .medium,
            timeStyle: .medium
        )
        
        historyTextView.text = historyTextView.text! + "\n\(timestamp): \(msg)"
    }
}

