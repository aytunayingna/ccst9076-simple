-- Add NATE user to the database
INSERT INTO users (id, name, avatar_url) VALUES
(999, 'NATE', '/placeholder.svg?height=40&width=40')
ON CONFLICT (id) DO NOTHING;
