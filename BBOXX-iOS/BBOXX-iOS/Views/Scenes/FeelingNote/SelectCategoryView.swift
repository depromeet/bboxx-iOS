import SwiftUI

enum Category: String, CaseIterable {
    case work = "직장문제"
    case study = "학업문제"
    case career = "취업문제"
    case family = "가족문제"
    case relationship = "대인관계"
    case others = "다른문제"
}

struct SelectCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = SelectCategoryViewModel()
    
    @State var enableButton: Bool = false
    var categories = Category.allCases
    @State var showPicker: Bool = false
    @State private var selectedCategory: String = ""
    private let defaultText = "선택하기"
    
    @State var tag: Int? = 0

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(ImageAsset.backButton)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("BboxxGrayColor").opacity(0.7))
                        .frame(
                            alignment: .topTrailing
                        )
                    
                        .padding(.top, 16)
                        .padding(.leading, 16)
                }
                Spacer()
            }
            
            VStack(spacing: 80){
                VStack(spacing: 20) {
                    Text("있잖아.. 나 오늘")
                        .font(.custom("Pretendard-Bold", size: 28))
                        .foregroundColor(Color("BboxxGrayColor"))
                        .frame(maxWidth: .infinity,alignment: .leading)
                    ZStack {
                        
                    Button {
                        showPicker.toggle()
                        
                    } label: {
                        Image(ImageAsset.select_category_pickView)
                            .resizable()
                            .frame(maxWidth: 213,
                                   maxHeight: 56,
                                   alignment: .leading)
                    }
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                        if selectedCategory != "" {
                            Text("\(selectedCategory)")
                                .foregroundColor(Color("BboxxTextColor"))
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .padding(.leading, 20)
                        } else {
                            Text("\(defaultText)")
                                .foregroundColor(Color("BboxxTextColor"))
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .padding(.leading, 20)
                        }
                    }
                    
                    
                    Text("때문에 힘들어")
                        .font(.custom("Pretendard-Bold", size: 28))
                        .foregroundColor(Color("BboxxGrayColor"))
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                
                Image(ImageAsset.select_category_image)
                    .resizable()
                    .frame(maxWidth: 288,
                           maxHeight: 240,
                           alignment: .topTrailing)
                
                
            }
            .padding([.leading, .top], 24)
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            
            NavigationLink(destination:
                            FeelingNoteWritingView()
                            .navigationBarHidden(true), tag: 1, selection: $tag) {
                EmptyView()
            }
            
            VStack {
                ZStack {
                    Button {
                        self.tag = 1
                        if selectedCategory != "" { enableButton = true }
                        viewModel.selectCategoryId(selectedCategory)
                    } label: {
                        Text("다 골랐어")
                            .font(.custom("Pretendard-SemiBold", size: 18))
                            .foregroundColor(enableButton ? Color(.white) : Color("BboxxGrayColor").opacity(0.4))
                    }
                    .frame(maxWidth: .infinity, maxHeight: 56)
                    .background(enableButton ? Color("BboxxGrayColor") : Color("disabledButtonColor"))
                    .cornerRadius(16)
                    .disabled(!enableButton)
                    
                    .padding(.leading, 24)
                    .padding(.trailing, 24)
                    .padding(.bottom, 30)
                    
                    
                    if showPicker {
                        VStack {
                            HStack {
                                Spacer()
                                Button {
                                    showPicker = false
                                    enableButton = true
                                    print($selectedCategory)
                                } label: {
                                    Text("Done")
                                        .font(.custom("Pretendard-Bold", size: 15))
                                        .foregroundColor(Color("BboxxTextColor"))
                                }
                            }
                            .padding(.trailing, 30)
                            .padding(.top, 30)
                            
                            Picker("선택하기", selection: $selectedCategory) {
                                ForEach(categories, id: \.self) { category in
                                    Text(category.rawValue).tag(category.rawValue)
                                        .font(.custom("Pretendard-Regular", size: 22))
                                        .foregroundColor(Color("BboxxTextColor"))
                                }
                            }
                            .background(Color(.white))
                            .pickerStyle(WheelPickerStyle())
                        }
                        .background(Color(.white))
                        .frame(maxWidth: .infinity, maxHeight: 150)
                    }
                }
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .background(
            
            Color("BboxxBackgroundColor")
                .ignoresSafeArea()
        )
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryView()
    }
}
