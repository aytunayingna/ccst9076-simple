-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    avatar_url VARCHAR(255)
);

-- 创建小组表
CREATE TABLE IF NOT EXISTS groups (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- 创建用户与小组的关联表 (多对多)
CREATE TABLE IF NOT EXISTS group_members (
    user_id INTEGER REFERENCES users(id),
    group_id INTEGER REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);

-- 创建消息表
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    group_id INTEGER REFERENCES groups(id),
    user_id INTEGER REFERENCES users(id),
    content TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 创建共享文档表
CREATE TABLE IF NOT EXISTS documents (
    id SERIAL PRIMARY KEY,
    group_id INTEGER REFERENCES groups(id) UNIQUE,
    content TEXT,
    last_updated_by INTEGER REFERENCES users(id),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 插入一些种子数据用于演示
INSERT INTO users (id, name, avatar_url) VALUES
(1, '小明', '/placeholder.svg?height=40&width=40'),
(2, '小红', '/placeholder.svg?height=40&width=40'),
(3, '小刚', '/placeholder.svg?height=40&width=40')
ON CONFLICT (id) DO NOTHING;

INSERT INTO groups (id, name) VALUES
(1, '第一学习小组')
ON CONFLICT (id) DO NOTHING;

INSERT INTO group_members (user_id, group_id) VALUES
(1, 1),
(2, 1),
(3, 1)
ON CONFLICT (user_id, group_id) DO NOTHING;

INSERT INTO documents (group_id, content) VALUES
(1, '这是我们小组的共享文档。在这里开始协作吧！')
ON CONFLICT (group_id) DO NOTHING;

INSERT INTO messages (group_id, user_id, content) VALUES
(1, 1, '大家好，我们开始讨论今天的课题吧。'),
(1, 2, '好的，我先来分享一下我的想法。')
ON CONFLICT (id) DO NOTHING;
