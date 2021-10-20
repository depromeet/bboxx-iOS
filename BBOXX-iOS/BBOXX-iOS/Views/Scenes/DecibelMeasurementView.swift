import SwiftUI

struct DecibelMeasurementView: View {
    
    @ObservedObject var decibelMeasurementViewModel = DecibelMeasurementViewModel()
    
    @State var showMic = true
        
    var body: some View {
        VStack {
            Text(self.decibelMeasurementViewModel.guideString)
                .font(.custom("HelveticaNeue", size: 24))
                .multilineTextAlignment(.center)
                
            Spacer()
                .frame(height: 65)
            
            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 172, height: 172)
                
                Circle()
                    .trim(from: 0.0, to: self.decibelMeasurementViewModel.circleProgress)
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 172, height: 172)
                    .rotationEffect(Angle(degrees: -90))
                
                Button(action: {
                    self.startMeasuring()
                }) {
                    if showMic {
                        Image("mic.fill")
                            .frame(width: 30, height: 32)
                    } else {
                        Text("\(self.decibelMeasurementViewModel.timeLeft)")
                        
                    }
                }
                .font(.custom("HelveticaNeue", size: 40))
                .frame(width: 160, height: 160, alignment: .center)
                .foregroundColor(.black)
                .background(Color.yellow)
                .cornerRadius(160)
                
            }
            
            Spacer()
                .frame(height: 65)
        }
    }
    
    func startMeasuring() {
        self.showMic.toggle()
        self.decibelMeasurementViewModel.setUpMonitoring()
    }
}

struct DecibelMeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        DecibelMeasurementView()
    }
}
