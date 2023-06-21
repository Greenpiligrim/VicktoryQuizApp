//
//  TestView.swift
//  Vicktory
//
//  Created by Greenpilligrim on 18/06/23.
//

import SwiftUI
import AVFoundation

struct TestView: View {
    @State private var isPlay: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var currentTime: TimeInterval = 0.1
    @State private var duration: TimeInterval = 0.1
    @State private var timer: Timer?

    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    isPlay.toggle()
                    if isPlay {
                        playAudio()
                    } else {
                        stopAudio()
                    }
                }) {
                    Image(systemName: isPlay ? "stop.fill" : "play.fill")
                        .font(.system(size: 20))
            }
            }.padding()
           
            VStack {
         

                GeometryReader { geometry in
                    let width = geometry.size.width
                    
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                            .frame(width: width * CGFloat(currentTime / duration), height: 4)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue.opacity(0.2))
                            .frame(height: 4)
                    
                      
                    
                }.frame(maxWidth: .infinity, maxHeight: 5)
              
            }
            .padding()
            
       



        }
        .onAppear {
            setupAudio()
        }
    }



    func setupAudio() {
        currentTime = 0.1
        duration = 0.1
        guard let audioPath = Bundle.main.path(forResource: "sound", ofType: "mp3") else {
            print("Audio file not found")
            return
        }

        let audioURL = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            duration = audioPlayer?.duration ?? 0
            audioPlayer?.prepareToPlay()
        } catch {
            print("Failed to play audio: \(error.localizedDescription)")
        }
    }

    func playAudio() {
        if audioPlayer == nil {
            setupAudio()
        }

        audioPlayer?.play()
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { _ in
            currentTime = audioPlayer?.currentTime ?? 0
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
        timer?.invalidate()
        timer = nil
        audioPlayer = nil
    }
}


//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}


