//
//  CardSelectionVC.swift
//  CardShuffler
//
//  Created by Cesar Lopez on 10/18/22.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var CardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var timer: Timer!
    var cards: [UIImage?] = Card.allValues

    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        CardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }

    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
