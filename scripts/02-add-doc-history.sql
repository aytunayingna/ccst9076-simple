-- 创建文档编辑历史表
-- 这个表将存储每一次文档保存操作的快照
CREATE TABLE IF NOT EXISTS document_history (
    id SERIAL PRIMARY KEY,
    -- 关联到具体的文档
    document_id INTEGER NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
    -- 关联到进行编辑的用户
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    -- 保存当时的文档内容
    content TEXT,
    -- 记录编辑时间
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 为 document_id 和 created_at 创建索引以提高查询性能
CREATE INDEX IF NOT EXISTS idx_document_history_document_id ON document_history(document_id);
CREATE INDEX IF NOT EXISTS idx_document_history_created_at ON document_history(created_at);
