//
//  PersonsCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Анна on 17.07.2024.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class PersonsCollectionViewCell: UICollectionViewCell {
    //MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image") ?? UIImage.add
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-Medium", size: 18)
        label.textColor = .white
        label.text = "Rick Sanchez"
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 12)
        label.textColor = .white
        label.text = "Alive"
        
       return label
    }()
    
    private lazy var pointLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 12)
        label.textColor = .white
        label.text = "•"

        return label
    }()
    
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 12)
        label.textColor = .white
        label.text = "Human"
        
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "IBMPlexSans-Regular", size: 12)
        label.textColor = .white
        label.text = "Female"
        
        return label
    }()
    
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func set(character: CharacterCellViewModel) {
        titleLabel.text = character.name
        statusLabel.text = character.status.rawValue
        statusLabel.textColor = character.status.color
        speciesLabel.text = character.species
        genderLabel.text = character.gender
        imageView.kf.setImage(with: character.image)
    }
    
    
    //MARK: - Private methods
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(statusLabel)
        addSubview(pointLabel)
        addSubview(speciesLabel)
        addSubview(genderLabel)
  
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.width.equalTo(84)
            make.height.equalTo(64)
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(15)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
        }
        
        pointLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(statusLabel.snp.trailing).offset(2)
        }
        
        speciesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalTo(pointLabel.snp.trailing).offset(2)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp.bottom).offset(6)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
        }
    }
    
    
}
