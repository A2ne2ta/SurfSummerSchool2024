//
//  DetailPersonViewController.swift
//  RickAndMorty
//
//  Created by Анна on 17.07.2024.
//

import UIKit
import SnapKit
import Kingfisher

class DetailPersonViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var backButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-Bold", size: 24)
        label.textColor = .white
        label.text = "Brad"
        
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1.0)
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image") ?? UIImage.add
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        
        
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 16)
        label.textColor = .white
        label.backgroundColor = UIColor(red: 25/255, green: 135/255, blue: 55/255, alpha: 1.0)
        label.text = "Alive"
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 5
        
        return view
    }()
    
    // MARK: - Properties
    private var keyValueLabels: [KeyValueLabelView] = []
    private let viewModel: DetailsViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([imageView, statusLabel, stackView])
        
        keyValueLabels.forEach { label in
            stackView.addArrangedSubview(label)
        }
        
        setupConstraints()
    }
    
    private func setupLabels() {
        titleLabel.text = viewModel.name
        imageView.kf.setImage(with: viewModel.image)
        statusLabel.text = viewModel.status.rawValue
        statusLabel.backgroundColor = viewModel.status.color
        
        let labelsData = [
            ("Species:", viewModel.species),
            ("Gender:", viewModel.gender),
            ("Episodes:", viewModel.episode.map({$0.lastPathComponent}).joined(separator: ", ")),
            ("Last known location:", viewModel.location.name)
        ]
        
        keyValueLabels = labelsData.map { KeyValueLabelView(key: $0.0, value: $0.1) }
    }
    
    private func setupConstraints() {
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            make.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(320)
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(42)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    @objc
    func backAction() {
        navigationController?.popViewController(animated: true)
    }
}



