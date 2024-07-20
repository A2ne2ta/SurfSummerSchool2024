//
//  PersonsListViewController.swift
//  RickAndMorty
//
//  Created by Анна on 17.07.2024.
//


import UIKit
import SnapKit

final class PersonsListViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-Bold", size: 24)
        label.textColor = .white
        label.text = "Rick & Morty Characters"
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let width = (view.frame.width - 20)
        layout.itemSize = CGSize(width: width, height: 96)
        layout.minimumLineSpacing = 4
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width,
                                                            height: view.frame.height),
                                              collectionViewLayout: layout)
        
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    //MARK: - Properties
    private var viewModel: PersonsViewModelProtocol
    
    //MARK: - Life cycle
    init(viewModel: PersonsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setupUI()
        viewModel.loadData()
    }
    
    //MARK: - Private methods
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.showError = { error in
            // TODO: Alert error
            let alert = FullscreenAlertViewController(dismissAction: {})
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(nameTitleLabel)
        view.addSubview(collectionView)
        
        collectionView.register(PersonsCollectionViewCell.self
                                , forCellWithReuseIdentifier: "PersonsCollectionViewCell")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension PersonsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonsCollectionViewCell", for: indexPath) as? PersonsCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1.0)
        cell.layer.cornerRadius = 20
        
        let character = viewModel.getCharacter(for: indexPath.row)
        cell.set(character: character)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension PersonsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.getCharacter(for: indexPath.row)
        let detailPersonViewController = DetailPersonViewController(viewModel: DetailsViewModel(character: character))
        
        navigationController?.pushViewController(detailPersonViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.numberOfCells - 15) {
            viewModel.loadData()
        }
    }
}
