
import UIKit

class HomeViewController: UIViewController {
    
    var userDetails: [StoryDetailsData] = DetailedStoryAPI.getDetailedStories()
    let reuseIdentifier = "Cell"
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        return cv
    }()

    let tableView = UITableView()
    var menu = MenuAPI.getMenu()

    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "change") == true {
            menu = MenuAPI.getMenu()
            tableView.reloadData()
            UserDefaults.standard.set(false, forKey: "change")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //  let defaults = UserDefaults.standard
    //  let total = defaults.string(forKey: "total")
        
        //            let userDefaults = UserDefaults.standard
        //            userDefaults.set(true, forKey: "presentationWasViewed")
        //            dismiss(animated: true, completion: nil)
        
        setupCollectionView()
        setupTableView()
    }
    //MARK: - Actions
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .none

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true

        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        
    }
}
 // MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoryCollectionViewCell
        cell.data = userDetails[indexPath.row]
        return cell
    }

}

// MARK: - CollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContentView") as! ContentViewController
            vc.modalPresentationStyle = .overFullScreen
            vc.pages = self.userDetails
            vc.currentIndex = indexPath.row
            self.present(vc, animated: true, completion: nil)
        }
    }
}

// MARK: - CollectionViewDelegateFlowLayoyt
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
}

// MARK:- Table View Data Source
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        cell.menu = menu[indexPath.row]
        return cell
    }
}

// MARK:- Table View Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Home"
    }
}
