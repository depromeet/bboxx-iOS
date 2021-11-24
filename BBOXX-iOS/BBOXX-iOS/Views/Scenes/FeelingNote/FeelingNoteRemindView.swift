import SwiftUI
import SwiftKeychainWrapper

struct FeelingNoteRemindView: View {
    @ObservedObject var viewModel = FeelingNoteRemindViewModel()
    
    var title: String
    var content: String
    var emotionStatusList: [Int] = [] // emotion의 id만 뽑아 배열로 넘겨받기
    
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
                            
                            Text(viewModel.category)
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
                                ForEach(emotionStatusList, id: \.self) { emotionId in
                                    ForEach(viewModel.emotions, id: \.id) { emotion in
                                        if emotionId == emotion.id {
                                            AsyncImage(
                                                url: URL(string: emotion.emotionURL)!,
                                                placeholder: { Text("Loading..") },
                                                image: { Image(uiImage: $0).resizable() }
                                            )
                                        }
                                    }
                                }
                                .frame(width: 90, height: 90)
                            }
                        }
                        .frame(height: 90)
                        
                        .padding(.top, 20)
                        .padding(.trailing, -24)
                        
                        NavigationLink(destination:
                                        FeelingNoteResultView()
                                        .navigationBarHidden(true)
                                       , tag: 1, selection: self.$tag) {
                            EmptyView()
                        }
                        
                        Button(action: {
                            self.tag = 1
                            viewModel.postFeelingNote(categorId: viewModel.categoryId,
                                                      content: content,
                                                      emotionStatusList: emotionStatusList,
                                                      memberId: KeychainWrapper.standard.integer(forKey: "memberId") ?? 0,
                                                      title: title)
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
