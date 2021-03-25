//
//  SpaceXViewController.swift
//  SpaceXLatestLaunch
//
//  Created by Kralpi on 3/25/21.
//

import UIKit
import Alamofire
import Kingfisher

class SpaceXViewController: UIViewController {

    weak var viewToNetworkManager: ViewToNetworkManager?
    var networkManager = NetworkManager()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNetwork()
        self.viewToNetworkManager?.getData()
    }
    
    func setupNetwork() {
        self.viewToNetworkManager = networkManager
        networkManager.managerToView = self
    }
    
    func setupData(data: DataModel) {
        self.titleLabel.text = data.name
        self.detailLabel.text = data.details
        self.imageView.kf.setImage(with: URL(string: data.largeImage ?? "text"))
    }
    
}

extension SpaceXViewController: NetworkManagerToView {
    
    func successData(data: DataModel) {
        self.setupData(data: data)
    }
    
    func error(error: AFError?) {
        let alert = UIAlertController(title: error?.failureReason, message: error?.errorDescription, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
