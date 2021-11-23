import SwiftUI
import UIKit

struct SelectFeelingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = SelectFeelingViewModel()
    
    private let feelingRows = [
        GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())
    ]
    let imageWidth: CGFloat = 136
    @State var completed: Bool = true
    @State var selectedFeelingCount = 0
    
    var category: String = ""
    var categoryId: Int = 0
    var title: String = ""
    var content: String = ""
    
    var body: some View {
        ZStack {
            Color("BboxxBackgroundColor").ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(ImageAsset.backButton)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("BboxxTextColor"))
                })
                .padding(.leading, 16)
                
                Text("지금 네 감정을\n이 중에서 골라볼래?")
                    .font(.custom("Pretendard-Bold", size: 24))
                    
                    .padding(.top, 23)
                    .padding(.leading, 24)
                
                Text("최대 5개까지 고를 수 있어.")
                    .fixedSize()
                    .foregroundColor(Color("BboxxGrayColor").opacity(0.7))
                    .font(.custom("Pretendard-Regular", size: 14))
                    
                    .padding(.top, 10)
                    .padding(.leading, 24)
                
                ScrollView() {
                    VStack(spacing: 10){
                        ForEach(0..<3) { row in
                            HStack {
                                ForEach(0..<3) { column in // create 3 columns
                                    Button(action: {}, label: {
                                        FeelingButton(emotion: viewModel.emotions[row * 3 + column], viewModel: viewModel)
                                        
                                    })
                                    Circle()
                                        .frame(maxWidth: 100, maxHeight: 100)
                                        .foregroundColor(Color("BboxxBackgroundColor"))
                                    
                                }
                            }
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                .padding(.top, 15)
                .padding(.leading, 5)
                
                NavigationLink(destination: FeelingNoteRemindView(
                                title: self.title,
                                content: self.content,
                                category: self.category)) {
                    Button(action: {
                    }) {
                        Text("다 골랐어")
                            .foregroundColor(.white)
                            .font(.custom("Pretendard-SemiBold", size: 18))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .background(Color("BboxxGrayColor"))
                    .cornerRadius(16)
                    
                    .padding(.top, 20)
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                    .padding(.bottom, 30)
                }
            }
            .padding(.top, 20)
            
        }.navigationBarHidden(true)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct SelectFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectFeelingView().previewDevice("iPhone 13")
    }
}
