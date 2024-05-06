//
//  ContentView.swift
//  DatePicker
//
//  Created by Woody on 5/5/24.
//

import SwiftUI

struct DatePickerView: View {
    
    // datePicker를 사용하기 위해 date 받아오기
    @State var currentDate = Date()
    
//    @State var selectDate = Date()
    // 간단하게 사용할 수 있는 SwiftUI 기능인거 같다. 좀 찾아봐야 할듯
    @State var selectDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
    // 색깔
    @State var bgColor: Color = .white
    // 현재 시간을 비교하면서 초마다 변경되는 색상을 바꿔주기 위한 카운트
    @State var count = 1

    // Timer 만들기, main Thread 사용
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    
    
    // closure
    // formatter for datePicker 선택했을 시 맞추기 위함
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        // HH -> 24, hh -> 12
        formatter.dateFormat = "yyyy-MM-dd EEE HH:mm:ss"
        
        return formatter
    }
    
    var body: some View {
        ZStack {
            bgColor.ignoresSafeArea()
            
            VStack {
                Text("알람 시간 맞추기")
                    .bold()
                
                Spacer()
                Text("현재 시간 : \(currentDate, formatter: dateFormatter)")
                    .onReceive(timer, perform: { input in
                        // currentDate에 timer로부터 받은 시간을 input을 통해 계속 집어 넣는다.
                        alarmSet(input)
                    }) // Text
                
                // selection datePicker 선택했을 때의 값
                // in Date값이 있어야 한다.  ...의 의미는 무한정으로 쓸 수 있따라는 의미
                // 근데 여기에서는 in이 있다면 이전 데이트가 select이 안된다 그렇기 떄문에 in을 뺐다.
                DatePicker("", selection: $selectDate, displayedComponents: [.date, .hourAndMinute])
                    // 안보이던 label을 hide로 설정함으로써 datepicker가 중앙으로 위치하게 된다.
                    .labelsHidden()
                    // type 변경
                    .datePickerStyle(.wheel)
                    .padding() // DatePicker
                
                
                Text("선택 시간 : \(selectDate, formatter: dateFormatter)")
                
                Spacer()
            }
        } // VStack
    } // body
        

    
    // ---- Functions ----
    func alarmSet(_ input: Date){
        currentDate = input
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm aaa"
        
        // formatting 해주는 방법 String
        let alarmTime = formatter.string(from: selectDate)
        let currentTime = formatter.string(from: input)
        
        count += 1
        if alarmTime == currentTime {
            if count % 2 == 0 {
                bgColor = .blue
            } else{
                bgColor = .red
            }
        } else {
            bgColor = .white
            count = 0
        }
        
    }
        
} // ContentView
    

#Preview {
    DatePickerView()
}
