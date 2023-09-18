//
//  ShrimplixViewModel.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/18.
//

import Foundation

class ShrimplixViewModel {
    
    var email: Observable<String?> = Observable("")
    var password: Observable<String?> = Observable("")
    var nickname: Observable<String?> = Observable("")
    var location: Observable<String?> = Observable(nil)
    var promocode: Observable<String?> = Observable(nil)
    var statement = Observable("")
    
    func showLoginStatement() {
        
        guard let email = email.value, email.contains("@") else {
            statement.value = "적절한 이메일 형식이 아닙니다."
            return
        }
        
        guard let password = password.value,
                password.count > 6 &&
                password.count < 10 else {
            statement.value = "비밀번호는 6~10자리로 작성해주세요."
            return
        }
        
    }
    
}
