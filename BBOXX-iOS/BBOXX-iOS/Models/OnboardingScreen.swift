import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String = "BboxxLogo"
    var comment: String
}

var boardingScreens: [BoardingScreen] = [

    BoardingScreen(comment: "안녕? 난 네 비밀친구 빡스야 \n요즘 어떻게 지내?"),
    BoardingScreen(comment: "요즘 힘든 일이 참 많지? \n어딘가에 말하고 싶지 않아?"),
    BoardingScreen(comment: "스트레스가 너무 쌓였다면 \n나한테 소리를 지르거나"),
    BoardingScreen(comment: "감정일기로 네 감정을 \n정리해서 나한테 버려봐"),
    BoardingScreen(comment: "나중에 네가 괜찮아진다면 \n성장일기를 써서 \n다시 네 감정을 정리할 수 있어")
]

let lastOnboardingScreens = BoardingScreen(comment: "힘든 일이 있으면 \n언제든지 나를 찾아와 \n내가 네 얘길 들어줄께")
