import SwiftUI
import Photos

class DecibelMeasurementResultViewModel: ObservableObject {
    
    var decibel: Int {
        return UserDefaults.standard.integer(forKey: "decibel")
    }
    var decibelResultTitle: String {
        return UserDefaults.standard.string(forKey: "decibelResultTitle") ?? ""
    }
    var decibelResultBgColor: UIColor {
        return UserDefaults.standard.colorForKey(key: "decibelResultBgColor") ?? UIColor.white
    }
    var decibelResultImage: String {
        return UserDefaults.standard.string(forKey: "decibelResultImage") ?? ""
    }
    
    func takeCapture() -> UIImage {
        var image: UIImage?
        guard let currentLayer = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.layer else { return UIImage() }
        
        let currentScale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale)
        
        guard let currentContext = UIGraphicsGetCurrentContext() else { return UIImage() }
        
        currentLayer.render(in: currentContext)
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
    func saveImage(image: UIImage) {
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized else { return }
            
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }, completionHandler: nil)
        }
        
    }
}
