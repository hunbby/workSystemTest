# 프로젝트 목료

1. 기본적인 업무관리 시스템 구현

2. 참고한 사이트 (http://qdpm.net/demo/v9/index.php/)

   **Administrator** (have full access)
   Email: administrator@localhost.com
   Password: administrator

   **Client** (can view only his projects and have access to tickets)
   Email: client@localhost.com
   Password: client

   **Developer** (have access to projects and tasks, no configuration/users access)
   Email: developer@localhost.com
   Password: developer

3. 캘린더를 사용해서 좀 더 보기 편하도록 구성

# 프로젝트 실행 방법

메이븐 프로젝트

DB : oracle

Server : tomcat

1. maven import
2. table.sql, seq.sql 파일 사용하여 테이블 생성
3. tomcat 에 프로젝트 연결후 실행
4. 사용자 아이디는 sqldeveloper 에서 직접 등록

# WorkSystemTest

구현해야하는 기능

1. 공지사항 팝업 오늘 하루 뛰우지 않기 기능 구현

2. 공지사항 체크박스 추가 후 체크한 항목만 공지사항 팝업에 나오도록 처리

3. 로그인 화면에서 회원가입 페이지 추가

4. 회원가입시 관리자가 승인을 해야만 사용 가능하도록 구현

5. 부서관리 - 부서 삭제시 부서에 등록되어있는 사용자 데이터 처리

6. 업무관리 수정 - 불필요한 데이터까지 가져오도록 되어있음

7. ajax사용시 컨트롤러에서 jsp 파일 자체를 result 로 돌려주는 방식을 jsp 의 include 를 할수 있도록 수정

8. 프로젝트관리, 업체관리 상세보기에서 새로고침하면 목록으로 돌아가는 것 수정 ajax -> jsp

   

