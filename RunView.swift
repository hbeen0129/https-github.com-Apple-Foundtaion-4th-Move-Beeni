//
//  SwiftUIView.swift
//  MoveApp
//
//  Created by 이혜빈 on 10/15/24.
//

//import SwiftUICore
import SwiftUI


// Run 페이지
struct RunView: View {
    @State private var searchText: String = "" // 검색어를 저장하는 상태 변수
    var body: some View {
        ScrollView {
            // VStack 페이지 전체
            VStack(alignment: .leading) {
                
                // 러닝 모임 찾기, 모임 개설 페이지 아이콘
                HStack{
                    Text("러닝 모임 찾기")
                        .font(.title.bold())
                        .padding(.top, 15)
                        .padding(.leading, 25)
                        .padding(.bottom, 5)
                    
                    Spacer() // 화면 공간 최대화
                    
                    
                    // 모임 개설 페이지 넘어가는 + 버튼
                    Image(systemName: "plus.app")
                        .resizable()
                        .frame(width: 33, height: 33)
                        .padding(.top, 15)
                        .padding(.trailing, 15)
                        .padding()

                    
                }// HStack 러닝 모임 찾기, 모임 개설 페이지 아이콘
                

                // 검색창
                VStack {
                    TextField("검색어를 입력하세요.", text: $searchText)
                        .padding(13) // 내부 여백
//                        .frame(width: 200, height: 40)
                        .background(Color(.systemGray6)) // 검색창 배경색상
                        .cornerRadius(10) // 모서리 둥글게
                        .padding(.horizontal, 18) // 가로 여백
                        

                }
                Spacer()
                
            } // VSatck 전체
            
            
        } // 스크롤뷰
    }
}

// 러닝 모임 개설 페이지
struct RunCreateView: View {
    var body: some View {
        Text("러닝 모임 개설 페이지")
            .navigationBarTitle("러닝 모임 개설")
            .navigationBarTitleDisplayMode(.large)
        
    }
}
