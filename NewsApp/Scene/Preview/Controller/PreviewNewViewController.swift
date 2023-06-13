//
//  PreviewNewViewController.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 13/06/2023.
//

import UIKit

class PreviewNewViewController: UITableViewController {
    
    var new: News?
    var newImage: UIImage = UIImage(systemName: "questionmark")!

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImages(new!)
        tableView.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = false
        title = new?.title
       
        tableView.register(PreviewNewCell.self, forCellReuseIdentifier: PreviewNewCell.reuseIdentifier)
    }

    func fetchImages(_ new: News) {
            let url = new.url
            
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data else { return }
                    
                    DispatchQueue.main.async {
                        let image = UIImage(data: data)
                        self.newImage = image ?? UIImage(systemName: "questionmark")!
                        self.tableView.reloadData()
                    }
                }.resume()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreviewNewCell.reuseIdentifier, for: indexPath) as! PreviewNewCell

        cell.selectionStyle = .none
        let date = Settings.shared.dateFormatted(date: new!.date)
        cell.configureCell(title: new!.title, description: new!.description, date: date, image: newImage)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
