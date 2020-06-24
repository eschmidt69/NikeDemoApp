import UIKit

class DetailViewController: UIViewController {
    
    // Set the data and view.
    var albumData: Results?
    let detailView = DetailView()
    let activityIndicatory = UIActivityView(frame: CGRect.zero)

    override func viewDidLoad() {
        // Loads the detail View and Indicator
        super.viewDidLoad()
        self.view.addSubview(activityIndicatory)
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Creates a loading indicator for the image.. Stops after download in complete.
        activityIndicatory.startAnimating()
        activityIndicatory.center = detailView.imageView.center

        // Add the indicator.
        self.view.addSubview(activityIndicatory)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01, execute: {
            // Download the image for the Album
            self.downloadImage()
        })
        
        // For this first ViewController we want to lock portrait.
        AppUtility().setOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Put Orientation Back
        AppUtility().setOrientation(.all)
    }
    
    // Start the download
    func downloadImage(){
        // start populating the View
        guard // Un-wrap
            let albumArt = albumData?.artworkUrl100
        else { return }
        
        // Download the image from the link., but I want the image to be the same size as the width..
        // update the link. 
        let updatedSizeLink = albumArt.replacingOccurrences(of: "200x200", with: String(format: "%.0fx%0.f",self.view.frame.width,self.view.frame.width))
        
        // Run the download in this block to update the detail image for the view.
        NetworkLayer().downLoadImageData(updatedSizeLink) { data, response, error in
            if error == nil {
                guard
                    let data = data
                else { return }
                let imageData = UIImage(data: data)
                DispatchQueue.main.async {
                    self.detailView.imageView.image = imageData
                    // Animate just to make it nice. :-)
                    UIView.animate(withDuration: 0.5, animations: {
                        self.detailView.imageView.alpha = 1.0
                    }, completion: {
                        (value: Bool) in
                        // Stop indicator when image load completes
                        self.activityIndicatory.stopAnimating()
                    })
                }
            }else{
                // If image fails to download, UIAlert will popup.
                let refreshAlert = UIAlertController(title: "Download Error!", message: response.debugDescription, preferredStyle: UIAlertController.Style.alert)
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action: UIAlertAction) in }))
                DispatchQueue.main.async {
                    self.present(refreshAlert, animated: true, completion: nil)
                }
            }
        }
        detailView.layoutIfNeeded()
    }
    
    private func setupViews() {
        
        // Add the main view for this controller.
        view.addSubview(detailView)
        detailView.tapDelegate = self
        AppUtility().processVCConstraint(self, detailView, top: 0.0, bottom: 0.0, right: 0.0, left: 0.0)
        detailView.copyrightInfo.text = albumData?.copyright
        
        var genreString: String = ""
        
        guard
            let albumName = albumData?.name,
            let artistName = albumData?.artistName,
            let releaseDate = albumData?.releaseDate,
            let genreArray = albumData?.genres
        else { return }
        
        // Genre is an array
        for genre in genreArray {
            if let genreValue = genre.name {
                genreString += "\(genreValue)-"
            }
        }
        detailView.albumName.text = "Album Name: \(albumName)"
        detailView.artistName.text = "Artist: \(artistName)"
        detailView.releaseDate.text = "Release Date: \(releaseDate)"
        detailView.genre.text = "Genre: \(genreString.dropLast())"
        detailView.genre.sizeToFit()
    }
}


extension DetailViewController: OpenITunes {
    func openITunes() {
        // OPens iTunes with the Model Data
        if let albumURL = albumData?.url?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url  = URL(string: albumURL){
                if UIApplication.shared.canOpenURL(url as URL) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
}
