//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Mohsina Rahman on 6/29/18.
//  Copyright © 2018 Mohsina Rahman. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate
{
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var tapToRecordbutton: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var stopRecordingbutton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        stopRecordingbutton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
       
    }
    @IBAction func recordAudio(_ sender: Any)
    {
        updateControls(startRecording: true)
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
      
    }
    
    @IBAction func stopRecording(_ sender: Any)
    {
        updateControls(startRecording: false)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
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
    
    func updateControls(startRecording: Bool)
    {
        if startRecording
        {
            tapToRecordbutton.text = "Recording in progress"
            stopRecordingbutton.isEnabled = true
            recordButton.isEnabled = false
        }
        else
        {
            recordButton.isEnabled = true
            stopRecordingbutton.isEnabled = false
            tapToRecordbutton.text = "Tap to Record"
        }
    }
    
    
    
}

