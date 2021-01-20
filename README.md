# BookPickple - 김종연(JongYeon Kim)

KH정보교육원 : [NCS]웹 기반 빅데이터 시각화 개발자 양성과정 (2020년 08월 13일 ~ 2021년 01월 18일)

## 프로젝트 소개

### 주제 : 도서 쇼핑몰 (Final/개인프로젝트)
### 기획 의도
- 코로나19로 온라인 도서 판매량이 증가하는 추세
- 구매 금액에 따른 등급제, 포인트 차등 지급으로 사용자의 재구매율 증대를 목표로 함

### 구현 기간
- 2020년 12월 14일 ~ 2021년 1월 15일

### 구현 기능
* 회원가입 / 로그인
  - validation 체크
  - 아이디, 이메일 중복 체크
  - 비밀번호 암호화 (BCryptPasswordEncoder)
  - 로그인 인터셉터
  - 임시 비밀번호 메일 전송 (Java Mail)
      
* 메인
  - 신간(최신등록순 10개)
  - 베스트셀러(판매량순 9개)
  - 화제의 책(평점개수, 평점순, 등록순 10개)
  
* 도서
  - 도서 키워드 자동완성 검색 (ajax)
  - 카테고리별 리스트 조회( + 평점/개수/판매량 조회)
  - 상세 조회 및 리뷰 조회
  - 최근 본 도서 (최대 5개)
  
* 장바구니
  - 담기 : 도서 리스트, 상세에서 담기
  - 조회 : 최신 순으로 조회, 총 금액 / 총 포인트 / 등급별 추가 포인트 조회
  - 변경 및 삭제: 수량 변경
 
* 주문 및 결제
  - 주문서 작성 및 결제 : 주문 방법 - 도서 리스트(개별), 도서 상세(개별), 카트(개별/전체) - Iamport 연동
  - 포인트 : 기본 5% 적립 + 등급별 차등 적립(1~3%), 결제 시 포인트 사용
  - 배송 완료 후 리뷰 등록
 
* 마이페이지
  - 주문내역 : 주문/결제 내역 조회 및 배송 조회
  - 프로필 : 조회, 수정, 탈퇴
  - 1:1 문의 : 등록, 조회
  
* 관리자 페이지
  - 현황 조회 : 이번 달 일별 가입자 수, 성별, 분야별 판매량, 연령대별 차트 조회 - Chart.js 연동
  - 회원 조회
  - 도서 관리 : 도서 등록, 조회, 수정, 삭제
  - 배송 관리 : 결제 내역 조회, 배송 상태 변경, 배송 조회 - sweettracker 연동
    + 배송 완료 후 포인트 적립
  - 1:1 문의 관리 : 문의 조회, 답변 등록
  - EDM 전송 : 회원 가입 시 이메일 수신 확인한 회원들에게 단체 메일 전송 (Java Mail)

#
### 사용 툴
--------------
![development tool](https://user-images.githubusercontent.com/59308878/105133620-69695280-5b30-11eb-88d4-5fd96f3858e9.PNG)

#
### DB 설계
----------------
![db](https://user-images.githubusercontent.com/59308878/105133332-e8aa5680-5b2f-11eb-965f-bc1c5794f368.PNG)

#
### 주요 페이지 설명 및 시연 이미지
---------------
![tiles](https://user-images.githubusercontent.com/59308878/105134194-599e3e00-5b31-11eb-9168-c2b405d419d3.PNG)
* 사용 이유
  - <jsp:include> 방식은 공통으로 사용하는 jsp 파일 이름이 변경되면 모두 수정해야하는 불편함을 가지고 있음
    + ex) 제공하는 서비스 페이지가 100개인 경우, header.jsp와 footer.jsp를 모두 수정해야함 -> 레이아웃 공통화 필요성
    
![javamailPNG](https://user-images.githubusercontent.com/59308878/105134699-27d9a700-5b32-11eb-9fee-3e1575a3ed42.PNG)
* 비밀번호 찾기 시 임시 비밀번호 전송 및 이메일 수신 동의 한 멤버에게 단체 메일 전송

![chartjs](https://user-images.githubusercontent.com/59308878/105134990-94ed3c80-5b32-11eb-9688-189b4e58376f.PNG)
![iamport](https://user-images.githubusercontent.com/59308878/105135265-1a70ec80-5b33-11eb-91b6-5bcd7310e66c.PNG)
![sweettracker](https://user-images.githubusercontent.com/59308878/105135298-28bf0880-5b33-11eb-90c8-a70adf8c4b0d.PNG)
![inserbook](https://user-images.githubusercontent.com/59308878/105135609-ae42b880-5b33-11eb-93d6-a966b07f562e.PNG)
![booklist](https://user-images.githubusercontent.com/59308878/105135672-c7e40000-5b33-11eb-8295-d295e168425e.PNG)
![booklist-member](https://user-images.githubusercontent.com/59308878/105135753-e5b16500-5b33-11eb-824d-65f6c43b65f8.PNG)
![recentlybook](https://user-images.githubusercontent.com/59308878/105135831-feba1600-5b33-11eb-863a-887247af2ec0.PNG)
![search](https://user-images.githubusercontent.com/59308878/105135893-198c8a80-5b34-11eb-99bb-304d0cde5761.PNG)
![cart](https://user-images.githubusercontent.com/59308878/105136257-b2230a80-5b34-11eb-9778-43c18069fc93.PNG)
![order](https://user-images.githubusercontent.com/59308878/105136276-ba7b4580-5b34-11eb-9641-c21c3b74fd79.PNG)
![orderlist](https://user-images.githubusercontent.com/59308878/105136298-c1a25380-5b34-11eb-89b5-309bfe1bb9cc.PNG)
![delivery](https://user-images.githubusercontent.com/59308878/105136313-c961f800-5b34-11eb-8248-37f76099e2e9.PNG)
![inquiry](https://user-images.githubusercontent.com/59308878/105136337-cff06f80-5b34-11eb-9fd3-0cef63909c31.PNG)
![trigger](https://user-images.githubusercontent.com/59308878/105136347-d67ee700-5b34-11eb-9298-eb0ef0257adf.PNG)




