import SwiftUI

struct MainEmptySelectionView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(ImageAsset.main_empty_selection_full_background)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                VStack {
                    VStack(spacing: 120) {
                        NavigationLink(destination: DecibelMeasurementView().navigationBarHidden(true)) {
                            Image(ImageAsset.main_empty_selection_shouting)
                                .resizable()
                                .frame(width: 250, height: 130)
                        }
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 6)
                        NavigationLink(destination: FeelingNoteWritingView().navigationBarHidden(true)) {
                            Image(ImageAsset.main_empty_selection_feelingNote)
                                .resizable()
                                .frame(width: 250, height: 130)
                        }
                        
                        .frame(width: 20, height: 20)
                    }
                    .padding(.bottom, -200)
                }
                .frame(alignment: .top)
                .edgesIgnoringSafeArea(.all)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainEmptySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MainEmptySelectionView()
    }
}
