//
//  Conductor.swift
//  Mic Input
//
//  Created by Mark Jeschke on 10/20/21.
//

import AudioKit
import AVFoundation

class Conductor {
    
    static let sharedInstance = Conductor()
    
    // Instantiate the audio engine and Mic Input node objects
    let engine = AudioEngine()
    var mic: AudioEngine.InputNode!
    
    // Add effects for the Mic Input.
    var delay: Delay!
    var reverb: Reverb!
    let mixer = Mixer()
    
    // MARK: Initialize the audio engine settings.
    
    init() {
        
        // AVAudioSession requires the AVFoundation framework to be imported in the header.
        
        do {
            Settings.bufferLength = .medium
            try AVAudioSession.sharedInstance().setPreferredIOBufferDuration(Settings.bufferLength.duration)
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord,
                                        options: [.defaultToSpeaker, .mixWithOthers, .allowBluetoothA2DP])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let err {
            print(err)
        }
        
        // The audio signal path with be:
        // input > mic > delay > reverb > mixer > output
                
        // Mic is connected to the audio engine's input...
        
        mic = engine.input

        // Mic goes into the delay...
        
        delay = Delay(mic)
        delay.time = AUValue(0.5)
        delay.feedback = AUValue(30.0)
        delay.dryWetMix = AUValue(15.0)
        
        // Delay output goes into the reverb...
        
        reverb = Reverb(delay)
        reverb.loadFactoryPreset(.largeHall2)
        reverb.dryWetMix = AUValue(0.4)
        
        // Reverb output goes into the mixer...

        mixer.addInput(reverb)
        
        // Engine output is connected to the mixer.
        engine.output = mixer

    }
    
    // MARK: Start and stop the audio engine via the SceneDelegate
    
    func startAudioEngine() {
        do {
            print("Audio engine was started.")
            try engine.start()
        } catch {
            Log("AudioKit did not start! \(error)")
        }
    }

    func stopAudioEngine() {
        engine.stop()
        print("Audio engine was stopped.")
    }
    
}

