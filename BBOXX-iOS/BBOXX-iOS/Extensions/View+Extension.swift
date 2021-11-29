import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
    
    // 키보드 내림
    func endTextEditing() {
        UIApplication.shared.windows.first{$0.isKeyWindow }?.endEditing(true)
    }
}
