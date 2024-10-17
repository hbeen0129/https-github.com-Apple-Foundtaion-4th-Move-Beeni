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
        
        // 화면 전환 네비게이션으로 전체 감싸기
        NavigationView {
            // 스크롤 할 수 있는 뷰로 감싸기
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
                        NavigationLink (destination: RunCreateView()){
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 33, height: 33)
                                .padding(.top, 15)
                                .padding(.trailing, 15)
                                .padding()
                            
                        }
                        
                        
                    }// HStack 러닝 모임 찾기, 모임 개설 페이지 아이콘
                    
                    
                    // 검색창
                    VStack {
                        TextField("검색어를 입력하세요.", text: $searchText)
                            .padding(13) // 내부 여백
                            .background(Color(.systemGray6)) // 검색창 배경색상
                            .cornerRadius(10) // 모서리 둥글게
                            .padding(.horizontal, 18) // 가로 여백
                        
                        
                    }
                    Spacer()
                    
                } // VSatck 전체
                
            } // 스크롤뷰
            
        } // Navigation 전체
        
    } // var body 전체
    
} // RunView 전체


// 러닝 모임 개설 페이지
struct RunCreateView: View {
    @State private var RunCreateText: String = "" // 제목 저장하는 변수
    @State private var SelectedDate = Date() // 날짜 저장하는 변수
    @State private var SelectedLocation = "서울" // 위치 선택하는 변수
    @State private var SelectedSubLocation = "" // 세부 위치 선택하는 변수
    @State private var CourseLength: Double = 5.0 // 코스 길이를 저장하는 변수
    @State private var SelectedMinutes: Int = 4 // 분 초기값
    @State private var SelectedSeconds: Int = 0 // 초 초기값 (0 또는 30)
    //    @State private var runningPace: Double = 4.0 // 기본 러닝 페이스 (4분)
    @State private var RunnerCount = "2" // 인원수 선택하는 변수
    @State private var RunningTime = "4 : 00" // 러닝 페이스 변수
    @State private var TextAdd: String = "" // 상세 설명 추가 변수
    let locations = ["서울", "부산", "대구"/*, "인천", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주"*/]
    let subLocations = [
        "서울": ["강서구", "강남구", "종로구"],
        "부산": ["해운대구", "서면", "광안리"],
        "대구": ["중구", "남구", "수성구"],
        // 필요에 따라 다른 도시와 세부 지역 추가하면 됨
    ]
    
    let RunCount = ["2", "3", "4", "5", "6", "7", "8"]
    var RunTime = ["4 : 00", "4 : 30", "5 : 00", "5 : 30", "6 : 00", "6 : 30", "7 : 00", "7 : 30", "8 : 00"]
    
    // 분과 초에 대한 선택값을 제공
    let minutes = Array(4...8) // 4분에서 8분까지 선택 가능
    let seconds = [0, 30] // 초는 0초 또는 30초 선택 가능
    
    
    
    var body: some View {
        // 스크롤뷰로 전체 감싸기
        ScrollView {
            // 제목 입력
            VStack {
                TextField("제목을 입력하세요.", text: $RunCreateText)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
                    .padding(.top, 10)
            }
            
            // 캘린더
            VStack {
                DatePicker("모임 날짜", selection: $SelectedDate, displayedComponents: .date)
                    .datePickerStyle(CompactDatePickerStyle()) // 컴팩트 스타일
                    .padding(.horizontal, 22)
                    .padding(.top, 8)
                    .padding(.leading, 5)
                Spacer()
            }
            
            // 장소 선택
            VStack(alignment: .leading) {
                Text("러닝 장소")
                    .padding(.horizontal, 22)
                    .padding(.leading, 5)
                    .padding(.top, 18)
                
                // 러닝 장소 피커
                HStack {
                    Picker("도시를 선택하세요", selection: $SelectedLocation) {
                        ForEach(locations, id: \.self) { location in
                            Text(location)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding(.horizontal, 22)
                    
                    
                    Picker("세부 지역을 선택하세요", selection: $SelectedSubLocation) {
                        ForEach(subLocations[SelectedLocation] ?? [], id: \.self) { subLocation in
                            Text(subLocation)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding(.horizontal, 22)
                }
                
            }
            
            
            // 참여 인원
            HStack {
                Text("참여 인원 선택")
                    .padding(.horizontal, 22)
                
                // 참여 인원 목록 상자
                Menu {
                    ForEach(RunCount, id: \.self) { count in
                        Button(action: {
                            RunnerCount = count // 선택된 인원 수 저장
                        }) {
                            Text(count)
                        }
                    }
                } label: {
                    HStack {
                        Text(RunnerCount) // 현재 선택된 인원 수
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.up") // 화살표 아이콘
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
                }
                Spacer()
                
            } // HStack 참여인원
            
            
            // 코스 길이 슬라이더
            VStack {
                Slider(value: $CourseLength, in: 0...20, step: 1.0)
                    .padding()
                
                // 슬라이더 범위 표시
                HStack {
                    Text("0 km") // 최소값
                    Spacer()
                    Text("20 km") // 최대값
                }
                .padding(.horizontal)
                
                // 선택된 코스 길이 표시
                Text("코스 길이: \(CourseLength, specifier: "%.1f") km")
                    .font(.headline)
                    .padding()
            }
            
            
            // 러닝 페이스 Stepper
            HStack {
                Text("러닝 페이스")
                    .padding(.horizontal, 22)
                
                // 참여 인원 목록 상자
                Menu {
                    ForEach(RunTime, id: \.self) { Time in
                        Button(action: {
                            RunningTime = Time// 선택된 인원 수 저장
                        }) {
                            Text(Time)
                        }
                    }
                } label: {
                    HStack {
                        Text(RunningTime) // 현재 선택된 인원 수
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "chevron.up") // 화살표 아이콘
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
                }
                Spacer()
                
            } // HStack 러닝 페이스
            
            // 상세 설명 추가
            VStack {
                TextField("상세 설명 추가", text: $TextAdd)
                    .frame(height: 200)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
                    .padding(.top, 10)
                
            }
            
            // 개설하기 버튼
            VStack {
                Button(action: {
                    print("버튼 누르면 실행")
                }) {
                    Text("개설하기")
                        .foregroundColor(.white)
                        .padding(.horizontal, 80)
                        .padding(.vertical, 15)
                        .background(Color(.systemTeal))
                        .cornerRadius(10)

                }
                
                
            }
            
        } // ScrollView 전체
        .navigationBarTitle("러닝 모임 개설") // 네비게이션바 제목
        .navigationBarTitleDisplayMode(.inline) // 네비게이션바 글씨 스타일
    } // var body 전체
} // RunCreateView 전체
