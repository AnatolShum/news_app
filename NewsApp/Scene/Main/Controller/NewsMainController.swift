//
//  NewsMainController.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 12/06/2023.
//

import UIKit

class NewsMainController: UITableViewController {
    let group = DispatchGroup()
    let parsingQueue = DispatchQueue.init(label: "Parsing")
    
    var news: [News] = []
    var images: [UIImage] = []
    
    let networkController = NetworkController()
    let loadingView = LoadingView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startIndication()
        title = "World news"
        
        tableView.backgroundColor = .systemGray6
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseIdentifire)
       
        Task {
            do {
                let loadednews = try await networkController.fetchNews()
                for new in loadednews {
                    news.append(new)
                    fetchImages(new: new)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchImages(new: News) {
        let basicImage = UIImage(systemName: "photo.on.rectangle")!
            let url = new.url

            group.enter()
            parsingQueue.sync {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data else { return }

                    let image = UIImage(data: data) ?? basicImage
                    self.images.append(image)
                    self.group.leave()
                }.resume()
            }
        
        group.wait()
        tableView.reloadData()
    }
    
//    func fetchImages() {
//        let basicImage = UIImage(systemName: "photo.on.rectangle")!
//        for new in news {
//            let url = new.url
//
//            group.enter()
//            parsingQueue.sync {
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    guard let data = data else { return }
//
//                    let image = UIImage(data: data)
//                    self.images.append(image ?? basicImage)
//                    self.group.leave()
//                }.resume()
//            }
//        }
//        group.wait()
//        tableView.reloadData()
//    }

    private func startIndication() {
        addChild(loadingView)
        loadingView.view.frame = view.frame
        view.addSubview(loadingView.view)
        loadingView.didMove(toParent: self)
    }
    
    private func stopIndication() {
            loadingView.willMove(toParent: nil)
            loadingView.view.removeFromSuperview()
            loadingView.removeFromParent()
        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifire, for: indexPath) as! NewsCell
        
        let item = news[indexPath.row]
        let date = Settings.shared.dateFormatted(date: item.date)
       
        group.notify(queue: .main) {
            let image = self.images[indexPath.row]
            
            cell.configureCell(title: item.title, description: item.description, date: date, image: image)
            
            self.stopIndication()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = news[indexPath.row]
        let previewNewViewController = PreviewNewViewController()
        previewNewViewController.new = new
       
        navigationController?.pushViewController(previewNewViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
