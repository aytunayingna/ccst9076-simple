-- Add submission tracking columns to documents table
ALTER TABLE documents 
ADD COLUMN IF NOT EXISTS is_submitted BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS submitted_at TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS submitted_by INTEGER REFERENCES users(id);

-- Add final submission tracking to document_history table
ALTER TABLE document_history 
ADD COLUMN IF NOT EXISTS is_final_submission BOOLEAN DEFAULT FALSE;
