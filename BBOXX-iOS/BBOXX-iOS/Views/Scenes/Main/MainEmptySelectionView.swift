import SwiftUI

struct MainEmptySelectionView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Image(ImageAsset.main_empty_selection_background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                        })
                        .padding(.top, 16)
                        .padding(.leading, 16)

                        Spacer()
                    }
                    
                    Text("오늘 무슨 일 있었어?")
                        .font(.custom("Pretendard-Regular", size: 14))
                        .foregroundColor(.white)
                    
                        .padding(.top, 24)
                        .padding(.leading, 30)

                    Text("기분 시원하게 풀러갈까?")
                        .font(.custom("Pretendard-Bold", size: 28))
                        .foregroundColor(.white)
                    
                        .padding(.top, 2)
                        .padding(.leading, 28)
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 24) {
                        NavigationLink(destination: DecibelMeasurementView().navigationBarHidden(true)) {
                            Image(ImageAsset.main_empty_selection_shouting)
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 170)
                        }
                        
                        NavigationLink(destination: SelectCategoryView().navigationBarHidden(true)) {
                            Image(ImageAsset.main_empty_selection_feelingNote)
                                .resizable()
                                .frame(maxWidth: .infinity, maxHeight: 170)
                        }
                    }
                    .padding(.top, 47)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                    
                    Spacer()
                }

            }
            .navigationBarHidden(true)
            
        }
    }
}

struct MainEmptySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MainEmptySelectionView()
    }
}
