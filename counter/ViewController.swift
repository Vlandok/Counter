//
//  ViewController.swift
//  counter
//
//  Created by Владислав Маскайкин on 25.05.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    private var counter: Int = 0 {
        didSet {
            counterLabel.text = "\(counter)"
        }
    }
    
    @IBAction private func didTapPlusButton() {
        counter+=1
        addHistoryMsg("значение изменено на +1")
    }
    
    @IBAction private func didTapMinusButton() {
        if (counter > 0) {
            counter-=1
            addHistoryMsg("значение изменено на -1")
        } else {
            addHistoryMsg("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func didTapResetButton() {
        counter = 0
        addHistoryMsg("значение сброшено")
    }
    
    private func addHistoryMsg(_ msg: String) {
        let timestamp = dateFormatter.string(from: Date())
        let newEntry = "\(timestamp): \(msg)"
        historyTextView.text = (historyTextView.text ?? "") + "\n" + newEntry
        
        let range = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(range)
    }
}

