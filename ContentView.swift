import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: .constant(1)) { // 하단 Tab bar
            
            // 프로필 페이지 탭
            ProfileView()
                .tabItem {Label("Profile", systemImage: "house.fill")}
                .tag(0)
            
            // 모임 페이지 탭
            RunView()
                .tabItem {Label("Run", systemImage: "figure.run")}
                .tag(1)
            
            // 채팅 페이지 탭
            ChatView()
                .tabItem {Label("Chat", systemImage: "message.fill")}
                .tag(2)
            
        }
        
    }
    
}

// 스플래시 화면
struct SplashScreen: View {
    @State private var isActive = false // 기본 값 false로 둬서 스플래시 실행 후 나오게
    
    var body: some View {
        if isActive {
            ContentView() // 스플래시가 끝난 후 메인 뷰
        } else {
            VStack{
                Image(systemName: "figure.run") // 로고 이미지 run
                    .resizable() // 이미지 수정 허용
                    .scaledToFit() // 주어진 프레임에 맞게 비율 유지하며 조정
                    .frame(width: 150, height: 150) // 로고 프레임 크기 설정
            }
            // 뷰가 화면에 나타날 때 실행해야 하는 코드
            .onAppear {
                // 2초 후 메인 뷰로 전환
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { withAnimation {
                    isActive = true
                    // 앱 기본 설정 (스탠다드 : 기본값 저장소), true는 사용자가 스플래시 화면을 본 적 있음을 나타냄
                    // 값 저장하는 키와 키값 hasSeenSplashScreen
                    UserDefaults.standard.set(true, forKey: "hasSeenSplashScreen")
                }
                }
            }
        }
        
    }
    
}




// 프로필 페이지
struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // 프로필 글씨, 알림, 설정
            HStack{
                Text("프로필")
                    .font(.largeTitle.bold())
                Spacer() // 텍스트와 이미지 사이 공간 최대화
                Image(systemName: "bell.fill") // 종 모양 이미지
                    .resizable() // 이미지 사이즈 변경할 수 있게 허용
                    .frame(width: 26, height: 30) // 종 사이즈
                    .padding(.horizontal, 15) // 종과 톱니바퀴 사이 간격 가로 패딩
                Image(systemName: "gearshape.fill") // 톱니바퀴 모양 이미지
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal, 35) // 가로 패딩
            .padding(.vertical, 20) // 세로 패딩
            
            // 프로필 사진, 이름, 키워드
            HStack{
                Image("ProfileImage") // 프로필 사진 이미지
                    .resizable() // 이미지 사이즈 변경 허용
                    .frame(width: 100, height: 100)
                Spacer()
                
                // (이름, 새싹), 위치, 온도, 키워드 세로 쌓기
                VStack(alignment: .leading){
                    HStack{ // (이름, 새싹), 위치, 러닝 온도 가로 쌓기
                        VStack(alignment: .leading){ // (이름, 새싹)과 위치 세로 쌓기
                            HStack{ // 이름, 새싹 이미지 가로 쌓기
                                Text("비니")
                                    .font(.title.bold())
                                Image(systemName: "leaf.fill") // 새싹 이미지
                                    .resizable() // 이미지 사이즈 변경 허용
                                    .frame(width: 25, height: 22)
                            }
                            Text("경상북도, 포항시")
                                .font(.system(size: 15))
                        }
                        
                        // 러닝 온도
                        VStack{
                            Image(systemName: "smiley.fill") // 스마일 이미지
                                .resizable()
                                .frame(width: 50, height: 50) // 스마일 이미지 크기
                            
                            Text("36.8")
                        }
                        .frame(width: 70, height: 100) // 스마일 외각
                        .background(Color.teal.opacity(0.3)) // 스마일 외각 색상
                        .cornerRadius(20) // 스마일 외각 라디언스(둥글게)
                        .padding(.horizontal, 20) // 이름, 위치와의 가로 패딩
                        
                    } // HStack (이름, 새싹), 위치, 러닝 온도 가로 쌓기 블록
                    
                    // 키워드
                    HStack{
                        Text("주말선호")
                            .font(.system(size: 13, weight: .bold)) // 폰트 크기, 볼드체
                            .frame(width: 70, height: 24) // 폰트 감싸고 있는 프레임 가로 세로
                            .background(Color.black.opacity(0.7)) // 프레임 색상
                            .foregroundColor(.white) // 폰트 자체 색상
                        Text("취미")
                            .font(.system(size: 13, weight: .bold))
                            .frame(width: 65, height: 24)
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                        Text("건강")
                            .font(.system(size: 13, weight: .bold))
                            .frame(width: 65, height: 24)
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                    }
                    
                } // VStack (이름, 새싹), 위치, 온도, 키워드 세로 쌓기
                
            } // HStack 프로필 사진, 이름, 키워드 다 포함된 블록
            .padding(.horizontal, 30) // 가로 패딩
            .padding(.vertical, 5) // 세로 패딩
            Divider() // 가로선 (구분선)
            
            // 참여 예정 러닝, 뛴 거리 텍스트 박스
            VStack{
                HStack{
                    VStack{
                        Text("2")
                            .foregroundStyle(.black)
                            .font(.system(size: 24, weight: .bold))
                        Text("참여 예정 러닝")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 13, weight: .bold))
                        
                    }
                    .padding(.horizontal, 20)
                    
                    Divider()
                    
                    VStack{
                        Text("42.1km")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .bold))
                        Text("이번 달 뛴 거리")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 13, weight: .bold))
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(Color.gray.opacity(0.15))
                
                
                
            } // VStack 참여 예정, 뛴 거리 블록
            .cornerRadius(15)
            .padding(.horizontal, 18)
            
            // 마지막 러닝 글씨
            VStack{
                Text("마지막 러닝")
                    .font(.system(size: 20, weight: .bold))
            }
            .padding(.leading, 23)
            .padding(.top, 10)
            .padding(.bottom, -2)
            
            // map 이미지
            VStack{
                Image("map")
                    .resizable()
                    .frame(width: 360, height: 250)
                    .cornerRadius(15)
            }
            .frame(maxWidth: .infinity) // 가운데 정렬
            
            // 러닝 정보
            VStack{
                HStack{
                    VStack{
                        Text("5.01")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                        Text("KM")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 13, weight: .bold))
                        
                    }
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity)
                    
                    VStack{
                        Text("5'02''")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                        Text("평균 페이스")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 13, weight: .bold))
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack{
                        Text("25:12")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                        Text("시간")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 13, weight: .bold))
                        
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack{
                        Text("15m")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                        Text("최고 고도")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 13, weight: .bold))
                    }
                    .padding(.leading, -10)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                
                
            } // VStack 하단 러닝 정보 블록
            .padding(.top, -10)
            Divider()
            Spacer() // VStack과 HStack 사이 공간 최대화
            
        } // 가장 큰 VStack 블록
        
    } // var body 블록
} // strust 블록




