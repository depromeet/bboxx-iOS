import Foundation
import AVFoundation

class DecibelMeasurementViewModel: ObservableObject {
    
    // 1 녹음기와 타이머 선언
    private var recorder: AVAudioRecorder?
    private var timer: Timer?
    
    // 2 평균 데시벨과 최대 데시벨 변수 선언
    @Published var average: Float = 0
    var peak: Float = 0
    
    var guideString = "힘든 일을 생각하며\n힘껏 소리질러봐!"
    var circleProgress: CGFloat = 0
    var timeLeft = 3
    
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
            
            self.circleProgress += 0.4
            self.timeLeft -= 1
            
            switch self.timeLeft {
            case 2:
                self.guideString = "더 크게 네 감정을\n마음껏 소리쳐봐!"
                break
            case 1:
                self.guideString = "마지막까지 네 안에 있는\n모든 감정을 털어놓아봐!"
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
