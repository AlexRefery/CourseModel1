drop table if exists
    "courseModel".instructor_course,
    "courseModel".instructor,
    "courseModel".student_course,
    "courseModel".students_courses,
    "courseModel".course,
    "courseModel".student,
    "courseModel".grade;




create table if not exists "courseModel"."instructor"
    (
        id bigserial,
        name varchar(100) not null,
        address varchar(255),
        phone_number varchar(20),
        payment real,
        primary key (id)
    );

create table if not exists "courseModel"."course"
    (
        id bigint NOT NULL unique,
        name varchar(255) not null unique,
        cost real not null,
        primary key (id)
    );

create table if not exists "courseModel"."student"
    (
        id bigserial,
        name varchar(100) not null,
        address varchar(255),
        phone varchar(20),
        email varchar(50),
        grade_book int not null,
        academic_perfomance real,
        primary key (id)
    );

create table if not exists "courseModel"."student_course"
    (
        id bigserial,
        student_id bigint,
        course_id bigint,
        isFinished boolean not null,
        primary key (id),
        constraint fk_student_id foreign key (student_id) references "courseModel".student (id),
        constraint fk_course_id foreign key (course_id) references "courseModel".course (id)
    );

create table  if not exists "courseModel".grade
    (
        id bigserial,
        students_course_id bigint,
        grade int,
        PRIMARY KEY (id),
        constraint fk_student_course_id foreign key (students_course_id) references "courseModel".student (id)
    );

create table  if not exists "courseModel".instructor_course
    (
        instructor_id bigint NOT NULL references "courseModel".instructor (id),
        course_id bigint NOT NULL references "courseModel".course (id),
        primary key (instructor_id, course_id)
);

create table  if not exists "courseModel".students_courses
    (
        student_id bigint NOT NULL references "courseModel".student (id),
        course_id bigint NOT NULL references "courseModel".course (id),
        primary key (student_id, course_id)
);



INSERT INTO "courseModel".course (id, name, cost) VALUES ('332'::integer, '1 course'::character varying, '334.09'::float)
returning id;
INSERT INTO "courseModel".course (id, name, cost) VALUES ('335'::integer, '2 course'::character varying, '2342.43'::float)
returning id;
INSERT INTO "courseModel".course (id, name, cost) VALUES ( '21'::integer, '3 course'::character varying, '443.0'::float)
returning id;
INSERT INTO "courseModel".student (name, address, phone, email, academic_perfomance, grade_book) VALUES ('Vasya pupkin'::character varying, 'bdfbdfvdfv'::character varying, '343453453'::character varying, '34532234'::character varying, '34'::double precision, '343'::integer)
returning id;
INSERT INTO "courseModel".student (name, academic_perfomance, grade_book) VALUES ('Turka'::character varying, '211'::integer, '7'::double precision)
returning id;
INSERT INTO "courseModel".student (name, academic_perfomance, grade_book) VALUES ('ISHO ODNA TURKA'::character varying, '76'::integer, '1'::double precision)
returning id;
