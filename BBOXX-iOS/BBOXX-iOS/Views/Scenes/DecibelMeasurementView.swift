import SwiftUI

struct DecibelMeasurementView: View {
    
    @ObservedObject var viewModel = DecibelMeasurementViewModel()
    
    @State var showMic = true
    
    var body: some View {
        NavigationView {
            VStack {
                if showMic {
                    Text("힘든 일을 생각하며\n힘껏 소리질러!")
                        .font(.custom("Pretendard-Bold", size: 28))
                        .foregroundColor(Color("BboxxBackgroundColor"))
                        .multilineTextAlignment(.center)
                } else {
                    Text(self.viewModel.guideString)
                        .font(.custom("Pretendard-Bold", size: 28))
                        .foregroundColor(Color("BboxxBackgroundColor"))
                        .multilineTextAlignment(.center)
                }
                
                NavigationLink(destination: DecibelMeasurementResultView(decibel: self.viewModel.peak), tag: 1, selection: self.$viewModel.tag) {
                    EmptyView()
                }
                
                Button(action: {
                    self.startMeasuring()
                }) {
                    if showMic {
                        Image(ImageAsset.micButton)
                    } else {
                        Image(self.viewModel.secondsImage)
                    }
                }
                .frame(width: 165, height: 165, alignment: .center)
                
                .padding(.top, 46)
                .padding(.bottom, 46)
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black).ignoresSafeArea()
        }
    }
    
    func startMeasuring() {
        self.showMic.toggle()
        self.viewModel.setUpMonitoring()
    }
}

struct DecibelMeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        DecibelMeasurementView()
    }
}
