//
//  ViewController.swift
//  TestSwiftFinal
//
//  Created by APPLE on 12/17/21.
//  Copyright © 2021 APPLE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewTime: UILabel!
    @IBOutlet weak var viewWall: UIImageView!
    @IBOutlet weak var viewBall: UIImageView!
    @IBOutlet weak var buttonStart: UIButton!
    
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timeCounting: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonStart.setTitle("Start", for: .normal)
    }
    
    @IBAction func clickStart(_ sender: UIButton) {
        let timeRun = Double.random(in: 1...3)
        let runBack = Int.random(in: 50...200)
        self.viewBall.transform = CGAffineTransform(translationX: 0, y: 0)
        count = 0
        viewTime.text = String(count)
        
        
            timeCounting = true
            buttonStart.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            
            UIView.animate(withDuration: timeRun, animations: {
                self.viewBall.transform = CGAffineTransform(translationX: 0, y: 382)
            }, completion: {_ in
                UIView.animate(withDuration: 1, animations: {
                    self.viewBall.transform = CGAffineTransform(translationX: 0, y: CGFloat(382 - runBack))
                }, completion: {_ in
                    UIView.animate(withDuration: 1, animations: {
                        self.viewBall.transform = CGAffineTransform(translationX: 0, y: 382)
                    }, completion: {_ in
                        self.timer.invalidate()
                        self.timeCounting = false
                        self.timer.invalidate()
                        self.buttonStart.setTitle("Start", for: .normal)
                    })
                })
            })
    }
    
    @objc func timerCounter () -> Void {
        count = count + 1
        viewTime.text = String(count)
    }
    
    
}

