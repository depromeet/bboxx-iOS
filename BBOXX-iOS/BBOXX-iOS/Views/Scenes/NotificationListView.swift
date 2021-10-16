import SwiftUI

struct NotificationListView: View {
    
    var body: some View {
        List() {
            ForEach(1..<10) { _ in
                NotificationCell()
            }
            
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
