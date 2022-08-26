//
//  File.swift
//  MagicGathering
//
//  Created by Nguyễn Việt on 25/08/2022.
//

import UIKit
import SnapKit
import ViewAnimator

class MTGCardExploreController: BaseViewController {
    
    private enum CellStyles {
        case checklist
        case textOnly
        case image
        
    }
    
    // UIMenu buttons state
    private var checkListState: UIMenu.State = .on
    private var textOnlyState: UIMenu.State = .off
    private var imageState: UIMenu.State = .off
    
    private let animations = [AnimationType.vector(CGVector(dx: 0, dy: 30))]
    private var style: CellStyles = .checklist
    private var searchController = UISearchController()
    private var activityIndicator: LoadMoreActivityIndicator!
    let viewModel = MTGCardExploreViewModel()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
//        tv.estimatedRowHeight = 300
//        tv.contentInsetAdjustmentBehavior = .automatic
        //        extendedLayoutIncludesOpaqueBars = true
        //        tv.bounces = true
        //        tv.alwaysBounceVertical = true
        tv.register(ImageCardCell.self)
        tv.register(TextOnlyCardCell.self)
        tv.register(CheckListCardCell.self)
        activityIndicator = LoadMoreActivityIndicator(scrollView: tv, spacingFromLastCell: 10, spacingFromLastCellWhenLoadMoreActionStart: 60)
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0.0
        }
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupMenu()
    }
    
    override func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        view.bringSubviewToFront(viewIndicator)
    }
    
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.automaticallyShowsCancelButton = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
    }
    
    private func setupMenu() {
        let options = UIBarButtonItem(title: "", image: .init(systemName: "ellipsis"), primaryAction: nil, menu: setupOptionsMenu())
        navigationItem.rightBarButtonItems = [options]
    }
    
    func setupOptionsMenu() -> UIMenu {
        return UIMenu(children: [
            UIAction(title: "Image Only", image: UIImage(systemName: "photo"), state: imageState, handler: { (_) in
                self.tapOnImage()
            }),
            UIAction(title: "Check list", image: UIImage(systemName: "list.bullet.rectangle"), state: checkListState, handler: { (_) in
                self.tapOnChecklist()
            }),
            UIAction(title: "Text Only", image: UIImage(systemName: "doc.plaintext"),state: textOnlyState, handler: { (_) in
                self.tapOnTextOnly()
            }),
        ])
    }
    
    func tapOnImage() {
        style = .image
        DispatchQueue.main.async {
            self.imageState = .on
            self.checkListState = .off
            self.textOnlyState = .off
            self.setupMenu()
            self.reloadTableView()
        }
    }
    
    func tapOnChecklist() {
        style = .checklist
        DispatchQueue.main.async {
            self.imageState = .off
            self.checkListState = .on
            self.textOnlyState = .off
            self.setupMenu()
            self.reloadTableView()
        }
    }
    
    func tapOnTextOnly() {
        style = .textOnly
        DispatchQueue.main.async {
            self.imageState = .off
            self.checkListState = .off
            self.textOnlyState = .on
            self.setupMenu()
            self.reloadTableView()
        }
    }
    
    private func reloadTableView() {
        self.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.tableView.reloadData()
            self.stopAnimating()
            UIView.animate(views: self.tableView.visibleCells, animations: self.animations)
        }
    }
}

extension MTGCardExploreController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch style {
        case .checklist:
            return 50
        case .image:
            return 450
        case .textOnly:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = viewModel.cards[indexPath.row]
        let vc = MTGCardDetailController()
        vc.viewModel = MTGCardDetailViewModel(card: card)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}

extension MTGCardExploreController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch style {
        case .image:
            let cell = tableView.reuse(ImageCardCell.self,for: indexPath)
            cell.selectionStyle = .none
            let card = viewModel.cards[indexPath.row]
            cell.cardVM = ImageCardViewModel(card: card)
            cell.clicked = {
                self.viewModel.cards[indexPath.row].isFlipped.toggle()
                cell.flipImage()
            }
            return cell
        case .checklist:
            let cell = tableView.reuse(CheckListCardCell.self,for: indexPath)
            cell.selectionStyle = .none
            let card = viewModel.cards[indexPath.row]
            cell.cardVM = CheckListCardViewModel(card: card)
            if indexPath.row % 2 == 0 {
                cell.containerView.backgroundColor = .white
            } else {
                cell.containerView.backgroundColor = .systemGroupedBackground
            }
            return cell
        case .textOnly:
            let cell = tableView.reuse(TextOnlyCardCell.self, for: indexPath)
            cell.selectionStyle = .none
            let card = viewModel.cards[indexPath.row]
            cell.cardVM = TextOnlyCardViewModel(card: card)

            return cell
            
        }
    }
}

extension MTGCardExploreController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //        guard let text = searchController.searchBar.text else {
        //            return
        //        }
    }
}

extension MTGCardExploreController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        if !text.isEmpty {
            viewModel.cards.removeAll()
            tableView.reloadData()
            self.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.viewModel.fetch(query: text) {
                    self.tableView.reloadData()
                    self.stopAnimating()
                    UIView.animate(views: self.tableView.visibleCells, animations: self.animations)
                }
            }
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
