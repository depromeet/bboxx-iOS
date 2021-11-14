import SwiftUI

struct FeelingNoteReviewView: View {
    
    @ObservedObject var viewModel = FeelingNoteReviewViewModel()
    
    @State private var cardShown: Bool = false
    @State private var cardDismissal: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tag: Int? = 0
    
    var feelingNote: FeelingNote?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(ImageAsset.backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxTextColor").opacity(0.7))
                        })
                        .frame(
                            alignment: .topLeading
                        )
                    }
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    
                    Text("예전에 네가 느낀 감정이야")
                        .font(.custom("Pretendard-Bold", size: 24))
                        .foregroundColor(Color("BboxxTextColor"))
                        
                        .padding(.top, 20)
                        .padding(.leading, 24)
                    
                    ScrollView() {
                        VStack(alignment: .leading) {
                            Text(self.feelingNote?.createdAt ?? "")
                                .font(.custom("Pretendard-Medium", size: 12))
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.85))
                                
                                .padding(.top, 30)
                            
                            Text(self.feelingNote?.title ?? "")
                                .font(.custom("Pretendard-Bold", size: 20))
                                .foregroundColor(Color("BboxxTextColor"))
                                
                                .padding(.top, 10)
                            
                            Text(self.feelingNote?.content ?? "")
                                .font(.custom("Pretendard-Regular", size: 16))
                                .foregroundColor(Color("BboxxTextColor"))
                                
                                .padding(.top, 10)
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                    }
                    .background(Color.white)
                    .cornerRadius(24)
                    
                    .padding(.top, 20)
                    
                    VStack { // SelectTagView로 넘어갈 때, 감정일기 id 값 넘겨줘야 함
                        NavigationLink(destination: SelectTagView().navigationBarHidden(true)) {
                            Text("다시보니 괜찮아졌어")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 56)
                                .background(Color("BboxxTextColor"))
                                .cornerRadius(16)
                                
                                .padding(.top, 42)
                                .padding(.leading, 24)
                                .padding(.trailing, 24)
                        }
                        
                        Button(action: {
                            cardShown.toggle()
                            cardDismissal.toggle()
                        }, label: {
                            Text("완전히 버리고싶어")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.4))
                        })
                        .frame(maxWidth: .infinity, minHeight: 42)
                        
                        .padding(.top, 10)
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        .padding(.bottom, 20)
                    }
                    .background(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color(UIColor.white).opacity(0.05), location: 0),
                            .init(color: .white, location: 0.2)
                        ]), startPoint: .top, endPoint: .bottom)
                    )
                    
                    .padding(.top, -46)
                }
                .background(Color("BboxxBackgroundColor").ignoresSafeArea())
                
                NavigationLink(destination:
                                FeelingNoteDeleteCompleteView()
                                .navigationBarHidden(true), tag: 1, selection: $tag) {
                    EmptyView()
                }
                
                BottomCard(cardShown: $cardShown,
                           cardDismissal: $cardDismissal,
                           height: UIScreen.main.bounds.height/1.5) {
                    CardContent(title: "이전 감정을 완전히 지울까?", subTitle: "완전히 지우면 다시는 이 글을 볼 수 없어.")
                    
                    HStack {
                        Button(action: {
                            self.dismiss()
                        }, label: {
                            Text("아냐, 냅둘래")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(Color("BboxxTextColor"))
                                .opacity(0.6)
                        })
                        .frame(width: 156, height: 56, alignment: .center)
                        
                        Spacer().frame(width: 19)
                        
                        Button(action: {
                            self.tag = 1
                            viewModel.deleteFeelingNote(feelingNoteId: feelingNote?.id ?? 0)
                        }, label: {
                            Text("응, 지워줘")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 156, height: 56, alignment: .center)
                        .background(Color("BboxxGrayColor"))
                        .cornerRadius(16)
                        
                    }
                    .padding(.top, 38)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 30)
                }
                .animation(.default)
                
            }
            .navigationBarHidden(true)
        }
    }
    
    func dismiss() {
        cardDismissal.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
            cardShown.toggle()
        })
    }
}

struct FeelingNoteReviewView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingNoteReviewView()
    }
}
