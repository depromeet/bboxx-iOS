import SwiftUI

struct NotificationListView: View {
    var body: some View {
        List() {
            NotificationCell()
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
