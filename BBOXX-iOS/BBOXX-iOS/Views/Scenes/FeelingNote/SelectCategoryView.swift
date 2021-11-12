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
    @State private var selectedCategory = ""
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
                        .foregroundColor(Color("BboxxGrayColor"))
                        .frame(
                            alignment: .topTrailing
                        )
                    
                        .padding(.top, 16)
                        .padding(.trailing, -8)
                }
                Spacer()
            }
            .background(
                
                Color("BboxxBackgroundColor")
                    .ignoresSafeArea()
            )
            .padding(.leading, 20)
            VStack(spacing: 80){
                VStack(spacing: 20) {
                    Text("있잖아.. 나 오늘")
                        .font(.system(size: 30, weight: .bold))
                        .font(.custom("Pretendard-Bold", size: 30))
                        .foregroundColor(Color("BboxxTextColor"))
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
                        .font(.system(size: 30, weight: .bold))
                        .font(.custom("Pretendard-Bold", size: 30))
                        .foregroundColor(Color("BboxxTextColor"))
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
                
                Image(ImageAsset.select_category_image)
                    .resizable()
                    .frame(maxWidth: 288,
                           maxHeight: 240,
                           alignment: .topTrailing)
                
                
            }
            .padding([.leading, .top], 20)
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            
            NavigationLink(destination:
                            FeelingNoteWritingView(category: selectedCategory, categoryId: viewModel.categoryId)
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
                            .fontWeight(.semibold)
                            .foregroundColor(enableButton ? Color(.white) : Color("BboxxGrayColor").opacity(0.4))
                        .padding(.vertical,20)
                        .padding(.horizontal,120)
                        .background(enableButton ? Color("BboxxGrayColor") : Color("disabledButtonColor"))
                        .cornerRadius(16)
                }
                .disabled(enableButton == false)
                .frame(alignment: .bottom)
                .padding(.bottom, 50)
                    
                    if showPicker {
                        Picker("선택하기", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) { category in
                                Text(category.rawValue)
                            }
                        }
                        .background(Color(.white))
                        .pickerStyle(WheelPickerStyle())
                        
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
