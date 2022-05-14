ALTER TABLE s2_store
	DROP
		CONSTRAINT FK_s2_list_TO_s2_store
		CASCADE;

ALTER TABLE s2_menu
	DROP
		CONSTRAINT FK_s2_store_TO_s2_menu
		CASCADE;

ALTER TABLE s2_review
	DROP
		CONSTRAINT FK_s2_store_TO_s2_review
		CASCADE;

ALTER TABLE s2_review
	DROP
		CONSTRAINT FK_s2_mem_TO_s2_review
		CASCADE;

ALTER TABLE s2_list
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_mem
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_store
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE s2_zipcode
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
        


/* 지역리스트 */
DROP TABLE s2_list 
	CASCADE CONSTRAINTS;

/* 회원정보 */
DROP TABLE s2_mem 
	CASCADE CONSTRAINTS;

/* 맛집 */
DROP TABLE s2_store 
	CASCADE CONSTRAINTS;

/* 메뉴 */
DROP TABLE s2_menu 
	CASCADE CONSTRAINTS;

/* 리뷰 */
DROP TABLE s2_review 
	CASCADE CONSTRAINTS;

/* 주소정보 */
DROP TABLE s2_zipcode 
	CASCADE CONSTRAINTS;
    
DROP TABLE s2_storelike
	CASCADE CONSTRAINTS;
    
DROP TABLE s2_reviewlike
	CASCADE CONSTRAINTS;

/* 지역리스트 */
CREATE TABLE s2_list (
	list_no NUMBER NOT NULL, /* 리스트번호 */
	list_name VARCHAR(60), /* 리스트이름 */
	list_pic CLOB, /* 지역사진 */
	list_coment CLOB /* 코멘트 */
);

ALTER TABLE s2_list
	ADD
		CONSTRAINT PK_s2_list
		PRIMARY KEY (
			list_no
		);

/* 회원정보 */
CREATE TABLE s2_mem (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_id VARCHAR2(20) NOT NULL, /* ID */
	mem_pw VARCHAR2(20) NOT NULL, /* PW */
	mem_birth VARCHAR2(20), /* 생년월일 */
	mem_tel VARCHAR2(30), /* 전화번호 */
	mem_add CLOB, /* 주소 */
	mem_pic CLOB /* 프로필사진 */
);

ALTER TABLE s2_mem
	ADD
		CONSTRAINT PK_s2_mem
		PRIMARY KEY (
			mem_no
		);

/* 맛집 */
CREATE TABLE s2_store (
	st_no NUMBER NOT NULL, /* 맛집번호 */
	st_name VARCHAR(30), /* 이름 */
	st_add CLOB, /* 주소 */
	st_tel VARCHAR(30), /* 전화번호 */
	st_kind VARCHAR(30), /* 음식종류 */
	st_price VARCHAR(30), /* 가격대 */
	st_parking VARCHAR(4), /* 주차 */
	st_time VARCHAR(30), /* 영업시간 */
	st_restday VARCHAR(10), /* 휴일 */
	st_preview CLOB, /* 식당소개 */
	st_regdate DATE DEFAULT sysdate, /* 등록일 */
	st_pic CLOB, /* 맛집사진 */
	list_no NUMBER, /* 리스트번호 */
	st_like NUMBER, /* 좋아요 */
    st_location VARCHAR(50) /* 위도경도 */
);

ALTER TABLE s2_store
	ADD
		CONSTRAINT PK_s2_store
		PRIMARY KEY (
			st_no
		);

/* 메뉴 */
CREATE TABLE s2_menu (
	st_no NUMBER, /* 맛집번호 */
	menu_name VARCHAR(30), /* 메뉴이름 */
	menu_price NUMBER, /* 가격 */
	menu_pic CLOB /* 메뉴사진 */
);

/* 리뷰 */
CREATE TABLE s2_review (
	re_no NUMBER NOT NULL, /* 리뷰번호 */
	st_no NUMBER, /* 맛집번호 */
	mem_no NUMBER, /* 회원번호 */
	re_review CLOB, /* 리뷰 */
	re_score NUMBER, /* 평점 */
	re_regdate DATE DEFAULT sysdate, /* 등록일 */
	re_like NUMBER /* 좋아요 */
);

ALTER TABLE s2_review
	ADD
		CONSTRAINT PK_s2_review
		PRIMARY KEY (
			re_no
		);

/* 주소정보 */
CREATE TABLE s2_zipcode (
	zip_code VARCHAR2(20), /* 우편번호 */
	zip_si VARCHAR2(20) NOT NULL, /* 시 */
	zip_gugun VARCHAR2(20) NOT NULL, /* 구군 */
	zip_dong VARCHAR2(20) NOT NULL, /* 동 */
	zip_sbunji VARCHAR2(20), /* 시작번지 */
	zip_ebunji VARCHAR2(20), /* 끝번지 */
	zip_seq NUMBER NOT NULL /* 번호 */
);

CREATE TABLE s2_storelike (
    mem_no NUMBER,
    st_no NUMBER
);

CREATE TABLE s2_reviewlike (
    mem_no NUMBER,
    re_no NUMBER
);

ALTER TABLE s2_zipcode
	ADD
		CONSTRAINT PK_s2_zipcode
		PRIMARY KEY (
			zip_seq
		);

ALTER TABLE s2_store
	ADD
		CONSTRAINT FK_s2_list_TO_s2_store
		FOREIGN KEY (
			list_no
		)
		REFERENCES s2_list (
			list_no
		);

ALTER TABLE s2_menu
	ADD
		CONSTRAINT FK_s2_store_TO_s2_menu
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		);

ALTER TABLE s2_review
	ADD
		CONSTRAINT FK_s2_store_TO_s2_review
		FOREIGN KEY (
			st_no
		)
		REFERENCES s2_store (
			st_no
		);

ALTER TABLE s2_review
	ADD
		CONSTRAINT FK_s2_mem_TO_s2_review
		FOREIGN KEY (
			mem_no
		)
		REFERENCES s2_mem (
			mem_no
		);