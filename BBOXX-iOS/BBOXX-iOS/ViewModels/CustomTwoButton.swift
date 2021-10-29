import SwiftUI

struct CustomTwoButton: View {
    
    var firstButtonText: String = ""
    var secondButtonText: String = ""
    
    init(firstButtonText: String, secondButtonText: String) {
        self.firstButtonText = firstButtonText
        self.secondButtonText = secondButtonText
    }
    
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Text(firstButtonText)
                    .font(.custom("Pretendard-SemiBold", size: 18))
                    .foregroundColor(.white)
            })
            .frame(maxWidth: .infinity, minHeight: 56)
            .background(Color("BboxxTextColor"))
            .cornerRadius(16)
            
            .padding(.top, 42)
            .padding(.leading, 24)
            .padding(.trailing, 24)
            
            Button(action: {}, label: {
                Text(secondButtonText)
                    .font(.custom("Pretendard-SemiBold", size: 18))
                    .foregroundColor(Color("BboxxGrayColor").opacity(0.4))
            })
            .frame(maxWidth: .infinity, minHeight: 42)
            
            .padding(.top, 10)
            .padding(.leading, 24)
            .padding(.trailing, 24)
            .padding(.bottom, 20)
        }
    }
}
