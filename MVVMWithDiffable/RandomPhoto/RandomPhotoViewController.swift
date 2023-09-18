//
//  RandomPhotoViewController.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/19.
//

import UIKit
import SnapKit

class RandomPhotoViewController: UIViewController {
    
    let randomImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let showRandomImageButton = {
        let view = UIButton()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGreen
        view.setTitle("랜덤 이미지", for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 35, weight: .bold)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.darkGray, for: .highlighted)
       return view
    }()
    
    let viewModel = RandomPhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setConstraints()
        
        bind()
 
    }
    
    func bind() {
        viewModel.randomPhotoList.bind { randomPhotot in
            guard let url = URL(string: randomPhotot.urls.regular) else { return }
            DispatchQueue.global().async {
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.randomImageView.image = UIImage(data: data)
                }
            }
        }
        
        
    }
 
    @objc func showRandomImageButtonTapped() {
        viewModel.loadRandomPhoto()
        
    }

}

extension RandomPhotoViewController {
    func configure() {
        view.backgroundColor = .white
        
        view.addSubview(randomImageView)
        view.addSubview(showRandomImageButton)
        
        showRandomImageButton.addTarget(self, action: #selector(showRandomImageButtonTapped), for: .touchUpInside)
    }
    
    func setConstraints() {
        randomImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(300)
        }
        
        showRandomImageButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
    }
}
