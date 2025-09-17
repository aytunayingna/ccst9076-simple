-- Add user_id column to documents table to support user-specific documents
ALTER TABLE documents 
ADD COLUMN IF NOT EXISTS user_id INTEGER REFERENCES users(id);

-- Create index for better performance
CREATE INDEX IF NOT EXISTS idx_documents_group_user ON documents(group_id, user_id);

-- Update existing documents to have user_id = NULL (shared documents)
UPDATE documents SET user_id = NULL WHERE user_id IS NULL;
