# Airline Reservation System
JDBC만을 이용해 구현해본 레거시 프로젝트로, 항공 예약 시스템 프로젝트입니다.

### 기술스택
- Eclipse
- MySQL
- JDBC
- Html
- CSS


### Installing

본 프로젝트는 로컬로 작동하므로.
Mysql Database를 설치하고 DriverManager.getConnection()의 파라미터 정보가 Mysql Database 정보와 일치하면 연결됩니다.

1.DBairport.src.airport.DB Class에서 Database Connection을 설정합니다.
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/c7faf635-a859-473e-a660-fba665675bc7)
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/b2c011b3-bb76-4290-8a00-b2d93859bc76)

2.DBairport.WebContent.SQL.CreateDB에 있는 Create Table문을 사용해 테이블을 생성합니다.


## Deployment

1. 데이터베이스 생성 및 ERD작성
2. 개발 제안서 제출 및 교수 컨설팅 2회 실시 
3. 설계문서, UI보고서 설계
4. 데이터베이스 및 UI수정
5. JDBC, HTML, CSS 작성
6. 실행 시 오류 및 충돌 개선

## File Information
login.html - 웹 브라우저에서 form 태그를 이용하여 id와 pw를 입력받고 확인 버튼을 누르면 login_ok.jsp 문서로 전달한다.

login.html - 회원가입 버튼을 누를 경우 signup.html로 이동한다.

signup.html - form 태그를 이용하여 승객 정보를 입력받고 signup.jsp 문서로 전달한다.

signup.html - id 중복확인 버튼을 누르면 id를 idcheck.jsp 문서로 전달한다.

signup.html - id 찾기 버튼을 누르면 id_find.jsp 문서로 전달한다

id_find_pro - passenger , administrator table에 같은 이름과 전화번호가 있으면 ID를 signup.html로 반환한다. 없으면 "해당 이름으로 가입한 아이디가 없거나, 입력한 정보가 틀립니다." 메시지 출력

pw_find_pro - passenger , administrator table에 같은 이름과 전화번호가 있으면 pw를 새로운 비밀번호로 바꾼다.

signup.html - pw 찾기 버튼을 누르면 pw_find.jsp 문서로 전달한다.

idcheck.jsp - 새창을 띄우고 form 태그를 이용하여 id를 입력받아

idCheckpro.jsp 문서로 전달한다.

idCehckpro.jsp - id가 administarotr 테이블의 adID 또는, passenger 테이블의 ID와 겹치면 "사용 가능한 아이디입니다." 메시지를 출력하고 signup.html 문서로 돌아가고 그렇지 않으면 "해당 아이디는 사용하실 수 없습니다." 메시지를 출력한다.

signup.jsp - signup.jsp 에서 전달 받은 승객 정보를 insert 한 후에 login.html 문서로 돌아간다.

login_ok.jsp - 입력받은 id와 pw가 administrator 테이블의 관리자 id와 pw가 일치하면 index_a.jsp 문서로 이동하고 passenger 테이블의 승객 id와 pw와 일치하면 index_p.jsp 문서로 이동한다.

index_a.jsp - 항공편 조회(flightCheck.jsp), 항공기 조회(aircraftCheck.jsp), 항공기 배정(assign.jsp),

승객 조회(passenger_Check.jsp), 관리자조회(administartor_check.jsp), 환불내역(refundCheck.jsp), 로그아웃(login.html)을 할 수 있는 관리자 전용 화면이다.

index_p.jsp - 항공편 조회(assignCheck.jsp), 예약 조회(listRS_reservation2.jsp), 로그아웃(login.html)을 할 수 있는 승객 전용 화면이다.

administrator_check.jsp - 관리자의 모든 리스트를 출력함. 관리자추가 버튼을 누르면 administratorInsert.html 실행, 리스트중 1개를 선택해 삭제 버튼을 누르면 administratorDelete.jsp 실행

administratorInsert.html - 관리자조회에서 추가 버튼을 누르면 가지는 페이지로 추가할 관리자의 정보를 입력하는 페이지다.

administratorInsert.jsp - administratorInsert.html에서 받아온 관리자 정보를 DB에 추가한다.(관리자 아이디 중복체크 실행)

administratorDelete.jsp - 관리자 조회에서 선택받은 값을 가져온후 DB에서 제거

aircraftCheck.jsp - 항공기의 모든 리스트를 출력한다. 항공기 추가버튼을 누르면 aircraftInsert.html 실행 , 리스트중 1개를 선택해 삭제 버튼을 무르면 aircraftDelete.jsp 실행

aircraftInsert.html - 항공기 조회에서 추가버튼을 누르면 가지는 페이지로 추가할 항공기의 정보를 입력하는 페이지이다.

aircraftInsert.jsp - aircraftInsert.html에서 받아온 항공기 정보를 DB에 추가한다.(항공기 번호 중복체크함)

aircraftDelete.jsp - 항공기 조회에서 선택받은 값을 가져온후 DB에서 제거

assign.jsp - 항공편 조회와 같은 항공편들의 리스트가 출력됩니다. 리스트들중 1개를 선택후 배정 버튼을 누르면 assignInsert.jsp가 실행되고 삭제 버튼을 누르면 assignDelete.jsp가 실행됨

assignInsert.jsp - 항공기의 리스트들이 출력, 항공기리스트들중 1개를 선택하고 환불 여부를 정하고 선택을 누르면 assignInsert2.jsp실행

assignInsert2.jsp - assign.jsp에서 받아온 항공편 정보와 assignInsert.jsp에서 받아온 항공기 정보를 가져와 DB에 추가함.(항공편과 항공기의 배정 중복체크함)

assignDelete.jsp - 배정된 리스트들을 출력합니다. 그중 1개를 선택하고 삭제 누르면 assignDelete2.jsp 실행

assignDelete2.jsp - assignDelete.jsp에서 받은 값을 DB에서 삭제함

erroepageSelect.jsp - 만약 선택을 하지않으면 '하나 이상 선택하시오' 창을띄우고 이전 페이지로 돌아가짐 (오류체크)

flightCheck.jsp - 항공편 리스트 출력합니다. 그중 1개를 선택하고 삭제를 누르면 flightDelete.jsp 실행, 추가 버튼을 누르면 flightInsert.html 실행함

flightDelete.jsp - flightCheck.jsp에서 입력받은 항공편 정보를 DB에서 삭제함

flightInsert.html - 추가할 항공편의 정보를 입력하는 페이지이다.

flightInsert.jsp - flightInsert.html 에서 입력받은 정보를 DB에 추가하는 페이지이다. (항공편 중복 체크함)

passenger_Check.jsp - 모든 승객의 리스트를 출력하고 승객을 선택하는 페이지, 선택후 예약조회를 누르면 reservationcheck.jsp 실행

reservationcheck.jsp - passenger_Check.jsp에서 받아온 선택된 승객의 id값을 가져와 그 승객이 예약한 리스트를 조회, 리스트중 1개를 선택후 환불 누르면 환불여부 체크후 refund.html 실행

refund.html - 환불 사유를 입력받는 페이지로 환불 버튼을 누르면 refund.jsp 실행

refund.jsp - reservationcheck.jsp에서 선택한 예약을 DB에서 삭제후 환불 정보를 DB에 추가(환불 정보 추가할때 세션에 로그인 되어있는 관리자의 id값이 들어감)

refundCheck.jsp - 모든 환불 리스트를 출력함

listRS_reservatoin2.jsp - 승객 로그인 후 세션에 로그인 되어있는 아이디 정보를 가져와 승객의 예약 리스트를 출력, 리스트중 1개 선택후 환불 누르면 환불 여부 체크후 refund2.html 실행

refund2.html - 환불 사유를 입력받는 페이지로 환불 버튼을 누르면 refund2.jsp 실행

refund2.jsp - reservationcheck.jsp에서 선택한 예약을 DB에서 삭제후 환불 정보를 DB에 추가(환불 정보 추가할때 승객이 직접 환불함으로 관리자의 id값이 들어가지 않음)

assignCheck.jsp - 배정된 항공편과 항공기의 리스트들의 일제히 출력, 선택후(다중 선택 가능) 인원수(최대10명)를 선택받고 예약을 누르면 reservation.jsp 실행 (이떄 자리가없으면 자리없다고 출력, 만약 다중선택중 일부가 예약불가(자리없음or남은자리대비 인원수 초과)상태면 예약 가능한 것은 다 예약함)

reservation.jsp - assignCheck.jsp에서 선택한 배정된 항공편과 항공기와 인원수를 가져와 DB에 추가함


## UI Specification
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/91cbd9e5-2763-45c0-ad66-35ce0711eea5)
[로그인 화면]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/c5d73503-6456-4c13-a8c6-6f707dd4851e)
[회원가입 화면]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/1b347b29-6f49-457d-8b22-07d734c41adb)
[아이디/비밀번호 찾기]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/49dd8816-5422-48b2-a579-dd36a27ecd64)
[관리자-항공편 조회]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/339fd7ef-16de-4f45-88e3-9168afe15ae3)
[관리자-항공편 조회-항공편 등록]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/a7386c0a-89b4-46f0-8cd2-3d36d4a0f118)
[관리자-항공기 조회]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/e1fc4153-47d9-44f4-81b1-e9c203f8a750)
[관리자-항공기 조회-항공기 등록]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/b47e9638-3d7e-4669-8881-69640bab4fc8)
[관리자-항공기 배정]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/7ad6881f-3fe2-4d0b-9276-c599095209fa)
[관리자-승객 조회]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/5d4d4919-9acc-4a69-a460-3d60d431b885)
[관리자-승객 조회-예약 조회]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/57912efa-87e7-4972-8d28-76fd763d9827)
[관리자-관리자 조회]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/beb37d29-dab8-45c8-9cec-4650fb4e3643)
[관리자-관리자 조회-관리자 추가]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/da6af2a1-66fa-494b-a4ba-f52137d6323b)
[관리자-환불 내역]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/dcab8a54-5fb9-4d4c-a21c-4f14163d2d3a)
[승객-항공편 조회]
![image](https://github.com/hwlee9905/Airline_Reservation_System/assets/127581593/9cfe6069-597e-4f86-ad5c-a78b77de4fa3)
[승객-예약 조회]

## Authors

* **hwlee9905** - [github](https://github.com/hwlee9905)

## License

This project is licensed under hwlee9905

