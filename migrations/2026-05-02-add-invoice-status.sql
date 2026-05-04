ALTER TABLE invoices
  ADD COLUMN status VARCHAR(32) NOT NULL DEFAULT 'open';

ALTER TABLE invoices
  DROP COLUMN legacy_status;
