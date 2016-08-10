//
//  GameViewController.swift
//  Sirculate
//
//  Created by Roydon Jeffrey on 8/6/16.
//  Copyright © 2016 Italyte. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //Update the scores
    @IBOutlet var highScoreLabel: UILabel!
    @IBOutlet var CurrentScoreLabel: UILabel!
    
    @IBOutlet var replayLabel: UIButton!
    
    //Determines how the position of the ball
    @IBOutlet var fallingBall: UIImageView!
    
    //To increment the score
    var highScore = 0
    var currentScore = 0
    
    //Holds the different colors for the ball animation and random selection
    var ballColorsArray = ["redBall", "greenBall", "blueBall", "yellowBall"]
    
    //Controls the rate of the falling ball
    var timer = NSTimer()
    
    //Restart the game after round ends
    @IBAction func replay(sender: AnyObject) {
        
        currentScore = 0
        
        let randomBallColor = Int(arc4random_uniform(UInt32(ballColorsArray.count)))
        fallingBall.image = UIImage(named: ballColorsArray[randomBallColor])
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    func update() {
        
        fallingBall.center = CGPointMake(fallingBall.center.x, fallingBall.center.y + 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let randomBallColor = Int(arc4random_uniform(UInt32(ballColorsArray.count)))
        fallingBall.image = UIImage(named: ballColorsArray[randomBallColor])
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        replayLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
