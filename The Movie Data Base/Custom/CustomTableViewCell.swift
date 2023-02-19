//
//  CustomTableViewCell.swift
//  The Movie Data Base
//
//  Created by Maxim Dmytruk on 04.02.2023.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleFilmLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 20
        posterImageView.layer.cornerRadius = 10
        
    }

    func configureCell (result:MovieJSONModel) {
        
        //MARK: - Labels
        self.titleFilmLabel.text = result.title 
        self.yearLabel.text = result.releaseDate
        self.descriptionLabel.text = result.overview
        
        //MARK: - ImageView
        if let posterPath = result.posterPath {
            posterImageView.sd_setImage(with: URL(string: NetworkManager().basicImageURL + posterPath))
        }
      
    }
    func configureCell (result:TvSeriesJSONModel) {
        
        self.titleFilmLabel.text = result.name
        self.yearLabel.text = result.firstAirDate
        self.descriptionLabel.text = result.overview
        
        //MARK: - ImageView
        if let posterPath = result.posterPath {
            posterImageView.sd_setImage(with: URL(string: NetworkManager().basicImageURL + posterPath))
        }
    }
    
}
