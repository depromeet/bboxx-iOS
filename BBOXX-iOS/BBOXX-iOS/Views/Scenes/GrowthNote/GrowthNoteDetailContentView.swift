import SwiftUI

struct GrowthNoteDetailContentView: View {
    
    var growthNote: GrowthNote
    var backgroundColor: Color
    @State var currentIsGrowthNote: Bool = false
    @State private var reader: ScrollViewProxy?
    @State private var cardShown: Bool = false
    @State private var cardDismissal: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init(growthNote: GrowthNote, backgroundColor: Color) {
        self.growthNote = growthNote
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack {
            
            backgroundColor
            ScrollView(.vertical, showsIndicators: false) {
                GrowthNoteDetailView(growthNote: growthNote, backgroundColor: backgroundColor)
                Spacer()
                Divider()
                    .foregroundColor(Color("BboxxGrayColor"))
                HStack() {
                    Text("이전에 쓴 감정일기 보기")
                        .font(.custom("Pretendard-SemiBold", size: 20))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(.white)
                        .background(backgroundColor.ignoresSafeArea())
                    Spacer()
                        .frame(maxWidth: 80)
                    Image(currentIsGrowthNote ? ImageAsset.downButton : ImageAsset.upButton)
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .leading)
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    // 현재 화면이 성장일기이면(isGrowthNote == true)
                    currentIsGrowthNote.toggle()
                    cardShown.toggle()
                    cardDismissal.toggle()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 10)
            .background(backgroundColor.ignoresSafeArea())
            
            .navigationBarHidden(true)
            
            VStack {
                if cardShown {
                    HStack() {
                        Text("이전에 쓴 감정일기 보기")
                            .font(.custom("Pretendard-SemiBold", size: 20))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.white)
                            .background(backgroundColor.ignoresSafeArea())
                        Spacer()
                        Image(currentIsGrowthNote ? ImageAsset.downButton : ImageAsset.upButton)
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .leading)
                        Spacer()
                    }
                    .opacity(cardShown ? 1 : 0)
                    .animation(Animation.default.delay(0.5))
                    .background(backgroundColor.ignoresSafeArea())
                    .padding(10)
                    .onTapGesture {
                        // 현재 화면이 성장일기이면(isGrowthNote == true)
                        currentIsGrowthNote.toggle()
                        cardShown.toggle()
                        cardDismissal.toggle()
                    }
                }
                
                
                BottomCard(cardShown: self.$cardShown,
                           cardDismissal: self.$cardDismissal,
                           height: UIScreen.main.bounds.height - 25,
                           isFeelingNoteCard: true) {
                    FeelingNoteCardContent(writtenDate: growthNote.createAt, title: growthNote.title, note: growthNote.content)
                    Spacer()
                }
                
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 20)
        .background(backgroundColor.ignoresSafeArea())
        
    }
}
