import SwiftUI

struct FeelingNoteReviewView: View {
    
    @ObservedObject var viewModel = FeelingNoteReviewViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("예전에 네가 느낀 감정이야")
                .font(.custom("HelveticaNeue", size: 24))
                .bold()
                
                .padding(.leading, 24)
            
            ScrollView() {
                VStack(alignment: .leading) {
                    Text(self.viewModel.dateString)
                        .font(.custom("HelveticaNeue", size: 12))
                    
                        .padding(.top, 30)
                    
                    Text("아 정말 힘들다")
                        .font(.custom("HelveticaNeue", size: 20))
                        .bold()
                        
                        .padding(.top, 10)
                    
                    Text("어린이집 교사인데 어이가 없는 게 본인은 아닌 척 하면서 진상인 부모님들 많이 봄. 감사하다고 하면 더 잘해드리고 싶고 그러는데 진짜 틈만 나면 아무것도 아닌 걸로 트집 잡고 이러면 감사한 마음 하나도 없고, 잘해드리고 싶지도 않고 진짜 의욕상실...\n\n우리도 돈 받고 이러는 입장에서 나름 잘하려고 하고 있는데 애가 하원 할 때 달려 나온다는 이유로 학대 의심 받고 이러면 어이도 없고, 이게 맞나 싶고 다 부질없어짐. 하원 할 때 안 달려나가는 아이들이 어디 있나 물어보고 싶음. 2학기 학부모 상담 진짜 걱정된다.\n\n어린이집 교사인데 어이가 없는 게 본인은 아닌 척 하면서 진상인 부모님들 많이 봄. 감사하다고 하면 더 잘해드리고 싶고 그러는데 진짜 틈만 나면 아무것도 아닌 걸로 트집 잡고 이러면 감사한 마음 하나도 없고, 잘해드리고 싶지도 않고 진짜 의욕상실...\n\n우리도 돈 받고 이러는 입장에서 나름 잘하려고 하고 있는데 애가 하원 할 때 달려 나온다는 이유로 학대 의심 받고 이러면 어이도 없고, 이게 맞나 싶고 다 부질없어짐. 하원 할 때 안 달려나가는 아이들이 어디 있나 물어보고 싶음. 2학기 학부모 상담 진짜 걱정된다.")
                        .font(.custom("HelveticaNeue", size: 16))
                    
                        .padding(.top, 10)
                }
                .padding(.leading, 24)
                .padding(.trailing, 24)
            }
            .background(Color.white)
            .cornerRadius(24)
            
            .padding(.top, 20)
            
            CustomTwoButton(firstButtonText: "다시보니 괜찮아졌어", secondButtonText: "완전히 버리고싶어")
            .background(
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color(UIColor.white).opacity(0.05), location: 0),
                    .init(color: .white, location: 0.2)
                ]), startPoint: .top, endPoint: .bottom)
            )
            
            .padding(.top, -46)
        }
        
        .background(Color("BboxxBackgroundColor").ignoresSafeArea())

    }
}
