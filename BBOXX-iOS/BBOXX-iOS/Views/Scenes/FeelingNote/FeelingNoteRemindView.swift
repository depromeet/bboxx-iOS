import SwiftUI

struct FeelingNoteRemindView: View {
    
    @ObservedObject var viewModel = FeelingNoteRemindViewModel()
    
    var title: String = ""
    var content: String = ""
    var category: String = "학업문제"
    
    @State var tag: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("네 힘든 감정을 정리해볼래?")
                    .font(.custom("Pretendard-Bold", size: 24))
                    .foregroundColor(Color("BboxxGrayColor"))
                    
                    .padding(.top, 59)
                    .padding(.leading, 24)
                
                ScrollView() {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("오늘")
                                .font(.custom("Pretendard-Medium", size: 28))
                                .foregroundColor(Color("BboxxTextColor"))
                            
                            Text(category)
                                .font(.custom("Pretendard-Bold", size: 28))
                                .foregroundColor(Color("BboxxGrayColor"))
                                
                                .padding(.top, 3.57)
                            
                            Text("로 힘들었어.")
                                .font(.custom("Pretendard-Medium", size: 28))
                                .foregroundColor(Color("BboxxTextColor"))
                        }
                        .padding(.top, 30)
                        
                        Text(title)
                            .font(.custom("Pretendard-Bold", size: 20))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                            .padding(.top, 27)
                        
                        Text(content)
                            .font(.custom("Pretendard-Regular", size: 16))
                            .foregroundColor(Color("BboxxGrayColor"))
                            
                            .padding(.top, 10)
                        
                        Text("내 감정은..")
                            .font(.custom("Pretendard-Bold", size: 20))
                            .foregroundColor(Color("BboxxTextColor"))
                            
                            .padding(.top, 30)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 20) {
                                ForEach(0..<10) { index in
                                    Image("")
                                        .frame(width: 80, height: 80)
                                        .background(Color("BboxxGrayColor"))
                                }
                            }
                        }
                        .frame(height: 80)
                        
                        .padding(.top, 40)
                        .padding(.trailing, -24)
                        
                        NavigationLink(destination:
                                        FeelingNoteResultView()
                                        .navigationBarHidden(true)
                                       , tag: 1, selection: self.$tag) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            self.tag = 1
                            
                        }, label: {
                            Text("버릴래")
                                .font(.custom("Pretendard-SemiBold", size: 18))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: .infinity, minHeight: 56)
                        .background(Color("BboxxGrayColor"))
                        .cornerRadius(16)
                        
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                        
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                }
                .background(Color.white)
                .cornerRadius(24)
                
                .padding(.top, 20)
                
            }
            .navigationBarHidden(true)
            .background(Color("BboxxBackgroundColor").ignoresSafeArea())
        }
        
    }
}
