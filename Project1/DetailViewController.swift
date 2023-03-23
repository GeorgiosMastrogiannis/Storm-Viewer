import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    var selectedPictureNumber = 0
    var totalPictures = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
            
            // set the total number of pictures
                if let vc = navigationController?.viewControllers.first as? ViewController {
                    totalPictures = vc.pictures.count
                
                selectedPictureNumber = vc.pictures.firstIndex(of: selectedImage!)! + 1
            }
        }
        
        title = "Picture \(selectedPictureNumber) of \(totalPictures)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}

