-- Add reply_to functionality to messages table
ALTER TABLE messages ADD COLUMN reply_to INTEGER REFERENCES messages(id);

-- Add index for better performance when querying replies
CREATE INDEX IF NOT EXISTS idx_messages_reply_to ON messages(reply_to);

-- Add a column to track if a message is a reply (for easier querying)
ALTER TABLE messages ADD COLUMN is_reply BOOLEAN DEFAULT FALSE;

-- Create index for is_reply column
CREATE INDEX IF NOT EXISTS idx_messages_is_reply ON messages(is_reply); 