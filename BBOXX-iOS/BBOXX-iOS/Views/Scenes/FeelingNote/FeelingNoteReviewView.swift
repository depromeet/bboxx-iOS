import SwiftUI

struct FeelingNoteReviewView: View {
    
    @ObservedObject var viewModel = FeelingNoteReviewViewModel()
    
    @State private var cardShown: Bool = false
    @State private var cardDismissal: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tag: Int? = 0
    
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
                            Text(self.viewModel.dateString)
                                .font(.custom("Pretendard-Medium", size: 12))
                                .foregroundColor(Color("BboxxGrayColor").opacity(0.85))
                                
                                .padding(.top, 30)
                            
                            Text("아 정말 힘들다")
                                .font(.custom("Pretendard-Bold", size: 20))
                                .foregroundColor(Color("BboxxTextColor"))
                                
                                .padding(.top, 10)
                            
                            Text("어린이집 교사인데 어이가 없는 게 본인은 아닌 척 하면서 진상인 부모님들 많이 봄. 감사하다고 하면 더 잘해드리고 싶고 그러는데 진짜 틈만 나면 아무것도 아닌 걸로 트집 잡고 이러면 감사한 마음 하나도 없고, 잘해드리고 싶지도 않고 진짜 의욕상실...\n\n우리도 돈 받고 이러는 입장에서 나름 잘하려고 하고 있는데 애가 하원 할 때 달려 나온다는 이유로 학대 의심 받고 이러면 어이도 없고, 이게 맞나 싶고 다 부질없어짐. 하원 할 때 안 달려나가는 아이들이 어디 있나 물어보고 싶음. 2학기 학부모 상담 진짜 걱정된다.\n\n어린이집 교사인데 어이가 없는 게 본인은 아닌 척 하면서 진상인 부모님들 많이 봄. 감사하다고 하면 더 잘해드리고 싶고 그러는데 진짜 틈만 나면 아무것도 아닌 걸로 트집 잡고 이러면 감사한 마음 하나도 없고, 잘해드리고 싶지도 않고 진짜 의욕상실...\n\n우리도 돈 받고 이러는 입장에서 나름 잘하려고 하고 있는데 애가 하원 할 때 달려 나온다는 이유로 학대 의심 받고 이러면 어이도 없고, 이게 맞나 싶고 다 부질없어짐. 하원 할 때 안 달려나가는 아이들이 어디 있나 물어보고 싶음. 2학기 학부모 상담 진짜 걱정된다.")
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
                    
                    VStack {
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
