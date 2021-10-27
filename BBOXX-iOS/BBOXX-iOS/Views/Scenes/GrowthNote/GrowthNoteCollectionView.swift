import SwiftUI

struct GrowthNoteCollectionView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 24) ?? .systemFont(ofSize: 24), .foregroundColor : UIColor.brown]
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack(alignment: .center) {
                    Button(action: {}, label: {
                        Image(ImageAsset.leftSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                    
                    Text("2021년 10월")
                        .font(.custom("HelveticaNeue", size: 18))
                    
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    Button(action: {}, label: {
                        Image(ImageAsset.rightSmallIcon)
                            .frame(width: 24, height: 24)
                    })
                }
                .padding(.top, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .frame(width: 315, height: 450)
                                .background(Color.red)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 41)
                
            }.navigationTitle(Text("성장일기"))
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BboxxBackgroundColor").ignoresSafeArea())
    }
}

struct GrowthNoteCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GrowthNoteCollectionView()
    }
}
