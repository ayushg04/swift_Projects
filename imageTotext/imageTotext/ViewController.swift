import UIKit
import Vision


@available(iOS 13.0, *)
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePhotoLibraryPicker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var request = VNRecognizeTextRequest(completionHandler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopAnimating()
        setupGallery()
    }
    
    private func startAnimation() {
        self.activityIndicator.startAnimating()
    }
    
    private func stopAnimating() {
        self.activityIndicator.stopAnimating()
    }
    

    @IBAction func touchInsideCameraBtn(_ sender: Any) {
        self.present(imagePhotoLibraryPicker, animated: true, completion: nil)
    }
    // image picker
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        startAnimation()
        self.textView.text = ""
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.imageView.image = image
        print(image!)
        //imageReadDemo()
        setupVisionTextRecogniseImage(image: image)
    }
    
    private func setupGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePhotoLibraryPicker.delegate = self
            imagePhotoLibraryPicker.allowsEditing = true
            imagePhotoLibraryPicker.sourceType = .photoLibrary
        }
    }
    // setup text recoginition
    private func setupVisionTextRecogniseImage(image: UIImage?){
        guard let cgImage = image?.cgImage else {
            fatalError("could not get cgimage")
        }
        
        //Handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        //Request
        let request = VNRecognizeTextRequest{ [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                error == nil else {
                    return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
                }).joined(separator: ", ")
            
            DispatchQueue.main.async {
                self?.textView.text = text
            }
            
            
        }
        
        //Process Request
        do {
            try handler.perform([request])
        }
        catch {
            textView.text = "\(error)"
        }
        
    }
//        var textString = ""
//
//        request = VNRecognizeTextRequest(completionHandler: {(request, error) in
//            guard let observations = request.results as? [VNRecognizedTextObservation] else {
//                fatalError("Recived Invalid Observation")
//            }
//            for observation in observations {
//                guard let topCandidate = observation.topCandidates(1).first else {
//                    print("No Candidate")
//                    continue
//                }
//
//                textString += "\n\(topCandidate.string)"
//
//                DispatchQueue.main.async {
//                    self.stopAnimating()
//                    self.textView.text = textString
//                }
//            }
//        })
//
//
//        // add some properties
//
//        request.customWords = ["custOm"]
//        request.minimumTextHeight = 0.04
//        request.recognitionLevel = .accurate
//        request.recognitionLanguages = ["en_US"]
//        request.usesLanguageCorrection = true
//
//
//        // creating request handler
//        DispatchQueue.global(qos: .userInitiated).async {
//            guard let img = image?.cgImage else{
//                fatalError("Missing Image to scan")
//            }
//            let handle = VNImageRequestHandler(cgImage: img, options: [:])
//            try? handle.perform([self.request])
//        }
//    }
    
//    func detectCat() {
//        let image = CIImage.init(image: imageView.image!)
//        let detectAnimalRequest = VNRecognizeAnimalsRequest { (request, error) in
//            DispatchQueue.main.async {
//                if let results = request.results?.first as? VNRecognizedObjectObservation {
//
//                    let cats = results.labels.filter({$0.identifier == "Cat"})
//                    for cat in cats {
//                        print("Found a cat!!")
//                    }
//                }
//            }
//        }
//
//        DispatchQueue.global().async {
//            do {
//                try VNImageRequestHandler(ciImage: image!).perform([detectAnimalRequest])
//            } catch let error {
//                print(error)
//            }
//        }
//    }
//    func imageReadDemo(){
////        detectCat()
////        return
//       // guard let currentFrameBuffer = self.previewView.session.currentFrame?.capturedImage else { return }
//        let image = CIImage.init(image: imageView.image!)
//           let detectAnimalRequest = VNDetectTextRectanglesRequest { (request, error) in
//               DispatchQueue.main.async {
//                        guard let observations = request.results as? [VNRecognizedTextObservation] else {
//                            fatalError("Recived Invalid Observation")
//                        }
//                       for observation in observations {
//                           print("Found a cat!!")
//                       }
//
//               }
//           }
//
//           DispatchQueue.global().async {
//            do {
//                try VNImageRequestHandler.init(ciImage: image!).perform([detectAnimalRequest])
//
//            } catch let error {
//                print(error)
//            }
//           }
//    }
    
}
