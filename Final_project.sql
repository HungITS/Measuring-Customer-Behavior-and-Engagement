-- Bước 1: Thêm cột mới
ALTER TABLE invoices ADD COLUMN Participants_Count INT;

-- Bước 2: Cập nhật dữ liệu trong cột mới
UPDATE invoices SET Participants_Count = ((LENGTH(Participants) - LENGTH(REPLACE(Participants, ' ', ''))) / LENGTH(' ')+1)/2;


-- update date lại
-- đổi tên cột date thành order date
alter table invoices rename column date to order_date

UPDATE invoices set order_date = date_format(STR_TO_DATE(order_date, '%d-%m-%Y'),'%Y-%m-%d')

ALTER TABLE invoices MODIFY order_date date;

-- orderleads
alter table orderleads rename column date to order_date

UPDATE orderleads set order_date = date_format(STR_TO_DATE(order_date, '%d-%m-%Y'),'%Y-%m-%d')

ALTER TABLE orderleads  MODIFY order_date date;

 --thêm cột status
ALTER TABLE orderleads ADD COLUMN `Status` VARCHAR(10);

UPDATE orderleads SET `Status` = CASE WHEN Converted = 1 THEN 'success' ELSE 'fail' END;

