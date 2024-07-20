//
//  FullscreenAlertViewController.swift
//  RickAndMorty
//
//  Created by Анна on 19.07.2024.
//

import UIKit
import SnapKit

final class FullscreenAlertViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "AlertImage") ?? UIImage.add
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 28)
        label.textColor = .white
        label.text = "Network Error"
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-Regular", size: 16)
        label.textColor = UIColor(red: 109/255, green: 120/255, blue: 133/255, alpha: 1)
        label.text = "There was an error connecting. Please check your internet."
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var retryButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Retry", for: .normal)
        button.addTarget(self, action: #selector(self.retryAction), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 66/255, green: 180/255, blue: 202/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "IBMPlexSans-Medium", size: 18)
        
        return button
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        
        return view
    }()
    
    //MARK: - Properties
    private let dismissAction: () -> Void
    
    //MARK: - Life cycle
    init(dismissAction: @escaping () -> Void) {
        self.dismissAction = dismissAction
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.addSubview(contentView)
        contentView.addSubviews([imageView, titleLabel, descriptionLabel, retryButton])
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(66)
            make.leading.trailing.equalToSuperview().inset(70)
            make.height.equalTo(263)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(31)
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        retryButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(85)
            make.height.equalTo(42)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc
    func retryAction() {
        dismiss(animated: true, completion: dismissAction)
    }
}

