//
//  NewsCell.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 12/06/2023.
//

import UIKit

class NewsCell: UITableViewCell {
    static let reuseIdentifire = "NewsCell"
    
    let newsImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "photo.on.rectangle")
        image.tintColor = .black
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backgroundColor = .systemGray6
        
        addSubview(newsImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(dateLabel)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.widthAnchor.constraint(equalToConstant: 80),
            newsImageView.heightAnchor.constraint(equalToConstant: 80),
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            newsImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
       
    }
    
    func configureCell(title: String, description: String, date: String, image: UIImage) {
        newsImageView.image = image
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
    }

}
