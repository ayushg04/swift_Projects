import UIKit
import Vision
@available(iOS 13.0, *)

class TableViewCell: UITableViewCell{
    @IBOutlet weak var numberLabel: UILabel!
}

@available(iOS 13.0, *)

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    

    let imagePhotoLibraryPicker = UIImagePickerController()
    @IBOutlet private weak var numbersTableView:UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var request = VNRecognizeTextRequest(completionHandler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numbersTableView.delegate = self
        numbersTableView.dataSource = self
        setupGallery()
    }
    var finalnumbers:Array = [""]

    @IBAction func touchInsideCameraBtn(_ sender: Any) {
        self.present(imagePhotoLibraryPicker, animated: true, completion: nil)
    }
    // image picker
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.imageView.image = image
        print(image!)
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
                })
            
            DispatchQueue.main.async {
                print("Imei Number: \(text)")
                for numbers in (0..<text.count){
                    print(text.count)
                    print(text[numbers])
                    if self!.validationCheckIMEI(inputNumber: text[numbers]) {
                        print(text[numbers])
                        self!.finalnumbers.append(text[numbers])
                        self!.numbersTableView.reloadData()
                        
                    }
                    
                }
            }
            
            
        }
        let requests:[VNRequest] = [request]
        //Process Request
        do {
            try handler.perform(requests)
        }
        catch let error
        {
            print(error)
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.finalnumbers.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.numberLabel?.text = finalnumbers[indexPath.row]
        return cell
    }
    
    func validationCheckIMEI(inputNumber:String) -> Bool {
       
        return true
    }
}
