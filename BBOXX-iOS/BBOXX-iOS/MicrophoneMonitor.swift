//
//  MicrophoneMonitor.swift
//  NoiseDetection
//
//  Created by eunwoo on 2021/10/04.
//

import Foundation
import AVFoundation

class MicrophoneMonitor: ObservableObject {
    
    // 1 녹음기와 타이머 선언
    private var recorder: AVAudioRecorder
    private var timer: Timer?
    
    // 2 데시벨과 최대 데시벨 변수 선언
    @Published var decibel: Float = 0.0
    
    var maxDecibel: Float = -160.0 // 최저(-160)로 초기화
    
    init() {
        // 3 오디오 권한 확인
        let audioSession = AVAudioSession.sharedInstance()
        if audioSession.recordPermission != .granted {
            audioSession.requestRecordPermission { (isGranted) in
                if !isGranted {
                    fatalError("You must allow audio recording for this demo to work")
                }
            }
        }
        
        // 4 실제로 오디오 녹음을 저장하지 않기 때문에 임시 디렉토리에 가까움, 오디오 설정
        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let recorderSettings: [String:Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        // 5 오디오를 녹음하는 부분
        do {
            recorder = try AVAudioRecorder(url: url, settings: recorderSettings)
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
            
            startMonitoring()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // 6 초기화 되는 즉시 모니터링 시작
    private func startMonitoring() {
        recorder.isMeteringEnabled = true
        recorder.record()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            // 7 오디오 전력 값 업데이트
            self.recorder.updateMeters()
            self.decibel = self.recorder.averagePower(forChannel: 0)
            
            if self.decibel > self.maxDecibel {
                self.maxDecibel = self.decibel
            }
        })
    }
    
    // 8 초기화 해제될 때 리소스 정리
    deinit {
        timer?.invalidate()
        recorder.stop()
    }
}
