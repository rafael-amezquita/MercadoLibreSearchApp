//
//  DetailViewController.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailsViewModel = DetailsViewModel()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = detailsViewModel.product?.name ?? "no name"
        priceLabel.text = detailsViewModel.product?.price ?? "no price"
    }
}
