CREATE DATABASE IF NOT EXISTS project2;
use project2;

DROP TABLE IF EXISTS faq;
CREATE TABLE IF NOT EXISTS faq(
  faq_no INTEGER AUTO_INCREMENT PRIMARY KEY,
  faq_title VARCHAR(200) NOT NULL, 
  faq_content VARCHAR(1000) NOT NULL  
);

INSERT INTO faq(faq_title, faq_content) VALUES ('부산의 상권정보는 없나요?.','안녕하세요\r\n현재는 서울지역의 상권정보만 제공하고 있습니다.\r\r\n\r\n회원님들의 양해를 구하며 사이트 이용해 참고 하시기 바랍니다.\r\n\r\n');
INSERT INTO faq(faq_title, faq_content) VALUES ('무료인가요? 유료인가요?', '현재 무료로 운영하고 있습니다.');
INSERT INTO faq(faq_title, faq_content) VALUES ('업종별 상권정보도 찾을 수 있나요?', '업종별로 찾아보실 수 있습니다.');
INSERT INTO faq(faq_title, faq_content) VALUES ('지역별 상권정보도 찾을 수 있나요?', '지역별로 찾아보실 수 있습니다.');
INSERT INTO faq(faq_title, faq_content) VALUES ('프랜차이즈 창업정보도 찾을 수 있나요?', '개별 프랜차이즈 창업정보는 제공하고 있지 않습니다.');
COMMIT;

SELECT * FROM faq ORDER BY faq_no DESC;

