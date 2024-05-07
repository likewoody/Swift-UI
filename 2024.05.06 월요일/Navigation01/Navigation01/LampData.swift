//
//  LampData.swift
//  Navigation01
//
//  Created by Woody on 5/6/24.
//

import SwiftUI

// 데이터 모델 정의 - 관찰자 모드
// ObservableObject static 같은 것인데 보안이 강화된 모드이다.
// struct는 안되고 class 사용
class LampData: ObservableObject {
    
    // Published 공개한다는 의미
    @Published var sharedData: String = ""
    @Published var sharedLampStatus: String = "lamp_on"
}

