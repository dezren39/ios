//
//  ViewController.swift
//  IC_tapMe
//
//  Created by Pope, Drewry on 4/26/17.
//  Copyright © 2017 assignmentInClass5 Drew Pope. All rights reserved.
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Exclamation marks makes these instance property variables 'implicitly unwrapped optionals'
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var score = 0
    var seconds = 0
    var countDownTimer = Timer()
    
    //Sound-related instance variables declared as optionals just in case the AVAudioPlayer is not available for some reason.
    var buttonBeep: AVAudioPlayer?
    var secondBeep: AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    // Helper method to find and connect an audio 
    // file to an AVAudioPlayer instance
    func setupAudioPlayerWithFile(_ file:String,extensionType:String) -> AVAudioPlayer? {
        // Bundle.main.path will tell you where in the project to look for the passed-in file, giving you back the absolute path to the file.
        let path = Bundle.main.path(forResource: file, ofType: extensionType)
        
        let url = URL(fileURLWithPath: path!)
        
        //Make a variable called audioPlayer an optional in case there is a condition when an AVAudioPlayer object cannot be created, which could be dependant on the device being used.
        var audioPlayer:AVAudioPlayer?
        
        //Try to instantiate an AVAudioPlayer object and store it in variable.
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            print("Player not available.")
        }
        
        return audioPlayer
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_time.png")!)
        scoreLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_score.png")!)
        
        //create audioPlayers
        //for soundPath in ["buttonTap"] {
        if let buttonSound = self.setupAudioPlayerWithFile("ButtonTap", extensionType: "wav") {
            self.buttonBeep = buttonSound
        }
        if let secondBeep = self.setupAudioPlayerWithFile("SecondBeep", extensionType: "wav") {
            self.secondBeep = secondBeep
        }
        if let bgMusic = self.setupAudioPlayerWithFile("HallOfTheMountainKing", extensionType: "mp3") {
            self.backgroundMusic = bgMusic
        }
        //}
        
        setupGame()
        
    }
    
    //(re)setup game
    func setupGame() {
        seconds = 10
        score = 0
        
        timeLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \n\(score)"
        countDownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.subtractTime), userInfo: nil, repeats: true)
        
        view.backgroundColor = UIColor(patternImage: UIImage(named:"bg_tile.png")!)
        
        backgroundMusic?.play()
    }
    
    //called every second from out timer, should decrement seconds,
    // update the timerLabel, and pop up and alert to see if the user wants to play again.
    func subtractTime() {
        seconds -= 1
        timeLabel.text = "Time: \(seconds)"
        if seconds == 0 {
            //Stop the timer.
            countDownTimer.invalidate()
            
            let countDownAlert = UIAlertController(title: "Time is up!", message: "You scored \(score) points.", preferredStyle: UIAlertControllerStyle.alert)
            
            // Adjust what the button says and does.
            let playAgainAction = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: {action in self.setupGame()})
            
            countDownAlert.addAction(playAgainAction)
            
            present(countDownAlert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //Underscore denotes lack of need of external name.
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("button Tapped")
        score += 1
        scoreLabel.text = "Score: \n\(score)"
        
        //play our button tapped sound. use ? when
        // we call the play method. if an avaudioplayer object
        //exists when we play the play method is called.
        buttonBeep?.play()
        
    }
    
}

