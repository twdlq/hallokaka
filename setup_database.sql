CREATE DATABASE IF NOT EXISTS vote_db CHARACTER SET utf8;

USE vote_db;

DROP TABLE IF EXISTS vote_record;
DROP TABLE IF EXISTS candidate;
DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE candidate (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    birth_date VARCHAR(20),
    photo VARCHAR(200),
    description TEXT,
    vote_count INT DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE vote_record (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    candidate_id INT NOT NULL,
    vote_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO candidate (name, gender, birth_date, photo, description, vote_count) VALUES
('张三', '男', '1990-03-15', 'candidate1.jpg', '张三，高级工程师，曾获得国家级科技进步奖。长期从事软件开发工作，在人工智能领域有突出贡献，发表论文30余篇，拥有多项技术专利。热心公益事业，多次组织技术讲座。', 0),
('李四', '女', '1992-07-22', 'candidate2.jpg', '李四，医学博士，现任某三甲医院副主任医师。在疫情防控中表现突出，荣获"最美逆行者"称号。积极参与基层医疗服务，为偏远地区提供义诊服务200余次。', 0),
('王五', '男', '1988-11-08', 'candidate3.jpg', '王五，教育工作者，扎根乡村教育15年。创办了乡村图书室，帮助300多名留守儿童完成学业。多次被评为"优秀教师"和"师德标兵"，事迹被多家媒体报道。', 0),
('赵六', '女', '1995-01-30', 'candidate4.jpg', '赵六，环保志愿者，发起"绿色家园"公益项目。组织环保活动100余场，带动数万人参与垃圾分类和植树造林活动。获得"全国优秀志愿者"称号。', 0),
('孙七', '男', '1985-06-18', 'candidate5.jpg', '孙七，企业家，创办科技公司并成功上市。积极履行社会责任，累计捐款5000余万元用于教育事业。设立助学基金，帮助贫困大学生完成学业。', 0);
