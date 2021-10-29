import Foundation
import AVFoundation
import SwiftUI

class DecibelMeasurementViewModel: ObservableObject {
    
    // 1 녹음기와 타이머 선언
    private var recorder: AVAudioRecorder?
    private var timer: Timer?
    
    // 2 평균 데시벨과 최대 데시벨 변수 선언
    @Published var average: Float = 0
    var peak: Float = 0
    
    var guideString = "더 크게\n마음껏 소리쳐!!!!"
    var timeLeft = 3
    var secondsImage = ImageAsset.threeSeconds
    
    @Published var tag: Int? = 0
    
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
    }
    
    func setUpMonitoring() {
        let audioSession = AVAudioSession.sharedInstance()
        
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
        recorder?.isMeteringEnabled = true
        recorder?.record()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            // 7 1초마다 오디오 전력 값 업데이트
            self.recorder?.updateMeters()
            
            self.average = self.recorder?.averagePower(forChannel: 0) ?? 0
            self.peak = self.recorder?.peakPower(forChannel: 0) ?? 0
            
            // 측정되는 단위는 dBFS이므로 실제 dB 값을 얻기 위한 보정
            let correction: Float = 100
            self.average = self.average + correction
            self.peak = self.peak + correction
                                    
            self.timeLeft -= 1
            
            switch self.timeLeft {
            case 2:
                self.guideString = "\n조금만 더!"
                self.secondsImage = ImageAsset.twoSeconds
                break
            case 1:
                self.secondsImage = ImageAsset.oneSeconds
                break
            case 0:
                self.tag = 1
                self.endMonitoring()
                break
            default:
                break
            }
                  
        })
    }
    
    // 8 모니터링 종료 메소드
    private func endMonitoring() {
        self.timer?.invalidate()
        self.recorder?.stop()
    }
}
