import SwiftUI
import UIKit

struct SelectFeelingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = SelectFeelingViewModel()
    
    let imageWidth: CGFloat = 136
    
    var category: String = ""
    var categoryId: Int = 0
    var title: String = ""
    var content: String = ""
    
    @State var selectedEmotionIdList: [Int] = []
    @State var enableButton: Bool = true
    
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
                                        FeelingButton(selectedEmotionIdList: self.$selectedEmotionIdList, enableButton: self.$enableButton, emotion: viewModel.emotions[row * 3 + column])
                                        
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
                            .foregroundColor(enableButton ? Color("BboxxGrayColor").opacity(0.4) : .white)
                            .font(.custom("Pretendard-SemiBold", size: 18))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .background(enableButton ? Color("BboxxGrayColor").opacity(0.2) : Color("BboxxTextColor"))
                    .cornerRadius(16)
                    .disabled(enableButton)
                    
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
