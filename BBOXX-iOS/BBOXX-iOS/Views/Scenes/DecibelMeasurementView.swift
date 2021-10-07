import SwiftUI

struct DecibelMeasurementView: View {
    @ObservedObject var decibelMeasurementViewModel = DecibelMeasurementViewModel()
    
    var body: some View {
        VStack {
            // 클릭 시, 측정 시작
            Button("Button", action: {
                self.decibelMeasurementViewModel.setUpMonitoring()
            })
            Text("타이머: \(decibelMeasurementViewModel.timeLeft)")
            Text(String(format: "%.0f dBFS",  decibelMeasurementViewModel.decibel))
            
            // 최고 데시벨
            Text(String(format: "%.0f dBFS",  decibelMeasurementViewModel.maxDecibel))
        }
    }
}

struct DecibelMeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        DecibelMeasurementView()
    }
}
