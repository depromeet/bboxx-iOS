import SwiftUI

struct NotificationListView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("나의 타임머신")
                .font(.custom("HelveticaNeue", size: 24))
                .bold()
            
                .padding(.top, 10)
                .padding(.leading, 24)
            
            List() {
                ForEach(1..<10) { _ in
                    NotificationCell()
                }
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
