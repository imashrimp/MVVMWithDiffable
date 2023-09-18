//
//  ViewController.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/18.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let shrimplixLabel = {
        let view = UILabel()
        view.textColor = .red
        view.font = .systemFont(ofSize: 45, weight: .heavy)
        view.textAlignment = .center
        view.text = "SHRIMPLIX"
        return view
    }()
    
    let emailTextField = {
        let view = CustomTextField()
        view.placeholder = "이메일 주소 또는 전화번호"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    let pwTextField = {
        let view = CustomTextField()
        view.placeholder = "비밀번호"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    let nicknameTextField = {
        let view = CustomTextField()
        view.placeholder = "닉네임"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    let locationTextField = {
        let view = CustomTextField()
        view.placeholder = "위치"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    let promoCodeTextField = {
        let view = CustomTextField()
        view.placeholder = "추천 코드 입력"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 20)
        return view
    }()
    
    let hoiWonGaIpButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.setTitleColor(.lightGray, for: .highlighted)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let hoiWonGaIpStatementLabel = {
        let view = UILabel()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.backgroundColor = .white
        view.textColor = .red
        return view
    }()
    
    let viewModel = ShrimplixViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setConstraints()
        bind()
    }
    
    func statmenBind() {
        viewModel.statement.bind { statement in
            print(#function, statement)
            self.hoiWonGaIpStatementLabel.text = statement
        }
    }
    
    func bind() {
        
        viewModel.email.bind { email in
            self.emailTextField.text = email
        }
        
        viewModel.password.bind { password in
            self.pwTextField.text = password
        }
        
        viewModel.nickname.bind { nickname in
            self.nicknameTextField.text = nickname
        }
        
        
        viewModel.location.bind {  location in
            self.locationTextField.text = location
        }
        
        
        viewModel.promocode.bind { promoCode in
            self.promoCodeTextField.text = promoCode
        }
        
        
        viewModel.statement.bind { statement in
            print(#function, statement)
            self.hoiWonGaIpStatementLabel.text = statement
        }
        
    }
    
}

extension ViewController {
    
    private func configure() {
        
        view.backgroundColor = .black
        
        [
            shrimplixLabel,
            emailTextField,
            pwTextField,
            nicknameTextField,
            locationTextField,
            promoCodeTextField,
            hoiWonGaIpButton,
            hoiWonGaIpStatementLabel
        ].forEach {
            view.addSubview($0)
        }
        
        emailTextField.addTarget(self,
                                 action: #selector(emailChanged),
                                 for: .editingChanged)
        pwTextField.addTarget(self,
                              action: #selector(passwordChanged),
                              for: .editingChanged)
        nicknameTextField.addTarget(self,
                                    action: #selector(nicknameChanged),
                                    for: .editingChanged)
        locationTextField.addTarget(self,
                                    action: #selector(locationChanged),
                                    for: .editingChanged)
        promoCodeTextField.addTarget(self,
                                     action: #selector(promoCodeChanged),
                                     for: .editingChanged)
        hoiWonGaIpButton.addTarget(self,
                                   action: #selector(hoiWonGaIpButtonTapped),
                                   for: .touchUpInside)
    }
    
    @objc func emailChanged() {
        guard let email = emailTextField.text else { return }
        
        viewModel.email.value = email
    }
    
    @objc func passwordChanged() {
        guard let password = pwTextField.text else { return }
        
        viewModel.password.value = password
    }
    
    @objc func nicknameChanged() {
        guard let nickname = nicknameTextField.text else { return }
        
        viewModel.nickname.value = nickname
    }
    
    @objc func locationChanged() {
        guard let location = locationTextField.text else { return }
        viewModel.location.value = location
    }
    
    @objc func promoCodeChanged() {
        guard let promoCode = promoCodeTextField.text else { return }
        viewModel.promocode.value = promoCode
    }
    
    @objc func hoiWonGaIpButtonTapped() {
        viewModel.email.value = emailTextField.text
        viewModel.password.value = pwTextField.text
        viewModel.showLoginStatement()
    }
    
    private func setConstraints() {
        shrimplixLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(shrimplixLabel.snp.bottom).offset(20)
        }
        
        pwTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(pwTextField.snp.bottom).offset(20)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
        }
        
        promoCodeTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(locationTextField.snp.bottom).offset(20)
        }
        
        hoiWonGaIpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(promoCodeTextField.snp.bottom).offset(20)
        }
        
        hoiWonGaIpStatementLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(hoiWonGaIpButton.snp.bottom).offset(20)
        }
    }
    
}
