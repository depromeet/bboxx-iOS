import SwiftUI
import UIKit

struct SelectFeelingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = SelectFeelingViewModel()
    
    private let feelingRows = [
        GridItem(.flexible()),GridItem(.flexible()), GridItem(.flexible())
    ]
    private let imageWidth: CGFloat = 136
    @State private var completed: Bool = false
    private var selectedFeelingCount = 0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Color("BboxxBackgroundColor").ignoresSafeArea()
                VStack(spacing: 40) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(ImageAsset.main_empty_selection_backButton)
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("BboxxGrayColor"))
                        })
                        
                        Spacer()
                    }
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    
                    // MARK: Top Comments
                    HStack {
                        VStack(spacing: 20) {
                            HStack {
                                Text("지금 네 감정을\n이 중에서 골라볼래?")
                                    .fixedSize()
                                    .font(.custom("Pretendard-Bold", size: 24))
                                Spacer()
                            }
                            
                            HStack {
                                Text("최대 5개까지 고를 수 있어")
                                    .fixedSize()
                                    .foregroundColor(Color("BboxxGrayColor"))
                                    .font(.custom("Pretendard-Regular", size: 14))
                                Spacer()
                            }
                        }
                    }
                    .padding(.leading, 25)
                    .frame(alignment: .leading)
                    
                    
                    // MARK: Select Feelings
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: feelingRows, alignment: .center, spacing: 0) {
                            ForEach(0..<13) { num in
                                Button(action: {
                                    // TODO: check selected feelings 1~5
                                    // selectedFeelingCount += 1
                                }) {
                                    // TODO: put fetched feelings in button
//                                    let url = URL(string: "")!
//                                    FeelingButton(name: "화가나", imageUrl: url)
                                    
//                                    Circle()
                                    // TODO: load image
                                    Image("감정일기_scroll-\(num)")
                                        .resizable()
                                        .frame(width: imageWidth, height: imageWidth)
                                }
                                // TODO: remove
                                .buttonStyle(PlainButtonStyle())
                                Circle()
                                    .frame(maxWidth: 50, maxHeight: 50)
                                    .foregroundColor(Color("BboxxBackgroundColor"))
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                        .background(Color("BboxxBackgroundColor"))
                        .frame(maxWidth: imageWidth * 10, maxHeight: geometry.size.height / 2 - 10)
                        
                    }
                    
                    NavigationLink(destination: FeelingNoteWritingView()) {
                        Button(action: {
                            
                        }) {
                            Text("다 골랐어")
                                .font(.system(size: 20))
                                .foregroundColor(Color("BboxxGrayColor"))
                                .padding([.top, .bottom], 20)
                                .padding([.leading, .trailing], 90)
                                .background(Color.gray)
                                .cornerRadius(10)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width * 0.75, height: 70 ,alignment: .bottom)
                    }
                    .padding(.bottom, 50)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height - 20, alignment: .top)
                .padding(.top, 30)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(edges: .all)
            
        }
        
    }
    
}

struct SelectFeelingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectFeelingView().previewDevice("iPhone 13")
    }
}