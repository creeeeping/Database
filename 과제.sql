-- 1. employees 테이블을 생성해주세요
--     - 속성명 id의 자료형은 INT입니다. 추가로 자동으로 1씩 증가하도록 설정하고 기본키로 지정합니다.
--     - 속성명 name의 자료형은 VARCHAR(100)입니다.
--     - 속성명 position의 자료형은 VARCHAR(100)입니다.
--     - 속성명 salary의 자료형은 DECIMAL(10, 2)입니다.

-- 사용할 데이터베이스를 지정하지 않아 에러발생

USE mydatabase;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- 2. 직원 데이터를 employees에 추가해주세요
--     - 이름: 혜린, 직책: PM, 연봉: 90000
--     - 이름: 은우, 직책: Frontend, 연봉: 80000
--     - 이름: 가을, 직책: Backend, 연봉: 92000
--     - 이름: 지수, 직책: Frontend, 연봉: 78000
--     - 이름: 민혁, 직책: Frontend, 연봉: 96000
--     - 이름: 하온, 직책: Backend, 연봉: 130000

INSERT INTO employees (name, position, salary) VALUES ('혜린', 'PM', 90000);
INSERT INTO employees (name, position, salary) VALUES ('은우', 'Frontend', 80000);
INSERT INTO employees (name, position, salary) VALUES ('가을', 'Backend', 92000);
INSERT INTO employees (name, position, salary) VALUES ('지수', 'Frontend', 78000);
INSERT INTO employees (name, position, salary) VALUES ('민혁', 'Frontend', 96000);
INSERT INTO employees (name, position, salary) VALUES ('하온', 'Backend', 130000);


-- 3. 모든 직원의 이름과 연봉 정보만을 조회하는 쿼리를 작성해주세요

SELECT * FROM employees;

-- 4. Frontend 직책을 가진 직원 중에서 연봉이 90000 이하인 직원의 이름과 연봉을 조회하세요. 

SELECT name, salary FROM employees WHERE position = 'Frontend' AND salary <= 90000;

-- 1. PM 직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.

UPDATE employees SET salary = salary * 1.10 WHERE position = 'PM';
SELECT * FROM employees WHERE position = 'Quality Assurance';

-- 2. 모든 Backend' 직책을 가진 직원의 연봉을 5% 인상하세요.

UPDATE employees SET salary  = salary * 1.05 WHERE position = 'Backend';

-- 에러나는 이유를 몰라서 gpt에 검색한결과 Safe Update Mode가 켜져 있어서 에러가 난다해서
-- 해결법을 찾아서 끄고 2번 문제를 해결한뒤 다시 켬

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET salary = salary * 1.05
WHERE position = 'Backend';

SET SQL_SAFE_UPDATES = 1;

-- 3. 민혁 사원의 데이터를 삭제하세요

DELETE FROM employees WHERE name = '민혁';

-- 같은 에러코드가 발생해 그냥 다시 끄고 진행  

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET salary = salary * 1.05
WHERE position = 'Backend';

-- 4. 모든 직원을 position 별로 그룹화하여 각 직책의 평균 연봉을 계산하세요.

 SELECT position, AVG(salary) AS average_salary FROM employees GROUP BY position;
 
 -- 5. employees 테이블을 삭제하세요.
 
 DROP TABLE employees;
 
 -- 위쪽에서 꺼놨던 Safe Update Mode를 다시 켬
 
 SET SQL_SAFE_UPDATES = 1;