//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Mohsina Rahman on 6/29/18.
//  Copyright © 2018 Mohsina Rahman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate
{
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var tapToRecordbutton: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopRecordingbutton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
       
    }
    @IBAction func recordAudio(_ sender: Any)
    {
      
    }
    
    @IBAction func stopRecording(_ sender: Any)
    {
        
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool)
    {
        if flag
        {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
            
        }
        else
        {
            print ("recording was not successful")
        }
    }
    
    
    
    
}

