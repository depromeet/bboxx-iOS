import SwiftUI

struct DecibelMeasurementView: View {
    
    @ObservedObject var viewModel = DecibelMeasurementViewModel()
    
    @State var showMic = true
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BboxxGrayColor").ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxBackgroundColor").opacity(0.7))
                        })
                        
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    
                    Spacer()
                    
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
                    
                    NavigationLink(destination: DecibelMeasurementResultView(
                        decibel: self.viewModel.peak,
                        title: self.viewModel.title,
                        backgroundColor: self.viewModel.backgroundColor,
                        decibelResultImage: self.viewModel.decibelResultImage
                    )
                    .navigationBarHidden(true), tag: 1, selection: self.$viewModel.tag) {
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
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }.navigationBarHidden(true)
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
