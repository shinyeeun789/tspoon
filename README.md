<div align="center">
  <img src="https://github.com/shinyeeun789/tspoon/assets/70800414/c9481387-953e-45d9-9908-8fa802f1ceb6" height="120px">
</div>

#
학부모 커뮤니티 웹 애플리케이션 개발 프로젝트입니다.

##  💻 프로젝트 소개

### 🕰 개발 기간
2023.09.09 ~ 2023.09.29

### 개발 환경
![Java](https://img.shields.io/badge/Java-007396.svg?&style=for-the-badge&logo=Java&logoColor=white)
![Spring](https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![Bulma](https://img.shields.io/badge/bulma-00D1B2.svg?&style=for-the-badge&logo=bulma&logoColor=white)
![jquery](https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=javascript&logoColor=white)
![ApacheTomcat](https://img.shields.io/badge/ApacheTomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black)
![MariaDB](https://img.shields.io/badge/mariadb-003545?style=for-the-badge&logo=mariadb&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/intellijidea-000000?style=for-the-badge&logo=intellijidea&logoColor=white)


<br/>

## 📌 프로젝트 산출물
### 1. Usecase Diagram
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram1" src="https://github.com/shinyeeun789/tspoon/assets/70800414/b3202298-c55d-4645-9311-d6033a0dad3b">
      <sub><b> PIC1 : 회원 관리 USECASE DIAGRAM</sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram2" src="https://github.com/shinyeeun789/tspoon/assets/70800414/d82bac8f-c152-4f88-b6e5-0c19c5054cc8">
      <sub><b> PIC2 : 마이페이지 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram3" src="https://github.com/shinyeeun789/tspoon/assets/70800414/c8d87398-62c2-4e93-9572-de63c391f9db">
      <sub><b> PIC3 : 관리자페이지 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram4" src="https://github.com/shinyeeun789/tspoon/assets/70800414/bb4fa063-c43e-473d-972a-bd1cb265bfd3">
      <sub><b> PIC4 : 커뮤니티 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram5" src="https://github.com/shinyeeun789/tspoon/assets/70800414/beefdc0f-0b1a-4f6b-b26e-7fb980e6faa2">
      <sub><b> PIC5 : 고객지원 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram6" src="https://github.com/shinyeeun789/tspoon/assets/70800414/e50a11af-645c-4e2f-b43f-3f6e7d92d1e7">
      <sub><b> PIC6 : 이벤트 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="usecasediagram7" src="https://github.com/shinyeeun789/tspoon/assets/70800414/f28198b3-5d01-4770-a407-126b3dc4f90d">
      <sub><b> PIC7 : 출석체크 USECASE DIAGRAM </sub></b>
    </td>
  </tr>
</table>

### 2. ERD
<img width="1300" alt="ERD" src="https://github.com/shinyeeun789/tspoon/assets/70800414/c1a87e7d-574f-4a8b-9c20-da118b366994">

### 3. Class Diagram
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="classdiagram1" src="https://github.com/shinyeeun789/tspoon/assets/70800414/ad741686-a1e3-45c2-bc46-277d8d92732e">
      <sub><b> PIC1 : dto 패키지 클래스 다이어그램 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="classdiagram2" src="https://github.com/shinyeeun789/tspoon/assets/70800414/a3074e0b-48f8-4865-97a1-765c3d3aac64">
      <sub><b> PIC2 : util 패키지 클래스 다이어그램 </sub></b>
    </td>
  </tr>
</table>

<br/>
<br/>

## 📱 주요 기능
### 1. 회원 기능
#### (1) 회원가입
- 아이디 중복 체크, 비밀번호와 비밀번호 확인의 값이 동일한지 체크한 후, 모든 조건이 true인 경우에만 회원가입할 수 있도록 구현
- 정규표현식 : 아이디(영문소문자, 숫자 조합 8글자 이상), 비밀번호(8자~16자, 영문소문자/숫자/특수문자 1개 이상)
- 다음 주소 API를 활용하여 사용자의 주소 정보를 가져와 데이터베이스에 저장
- 비밀번호는 암호화하여 데이터베이스에 저장
#### 📷 View
