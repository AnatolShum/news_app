//
//  PreviewNewCell.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 13/06/2023.
//

import UIKit

class PreviewNewCell: UITableViewCell {
    static let reuseIdentifier = "PreviewNewCell"
    
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
        return label
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backgroundColor = .systemGray5
        
        addSubview(newsImageView)
        addSubview(dateLabel)
        addSubview(titleLabel)
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            newsImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 200),
            newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            dateLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    func configureCell(title: String, description: String, date: String, image: UIImage) {
        newsImageView.image = image
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
    }

}
