/*
Removing training zeros
Usage:
select a.deal_id ,dbo.trim_zero(a.deal_id)
from t_trn_loan a inner join t_trn_loan_valuation b 
on (dbo.trim_zero(a.deal_id) = dbo.trim_zero(b.deal_id) and b.valuation_date ='20210331') 
where '20210331' between start_validity_date and end_validity_date



*/
CREATE FUNCTION dbo.trim_zero ( @varchar varchar(200))
RETURNS VARCHAR(200)
AS
BEGIN
   DECLARE @varchar_out VARCHAR(100);
   IF @varchar like '0%'
      SET @varchar_out = SUBSTRING(@varchar, 2, len(@varchar)) 
   ELSE
      SET @varchar_out = @varchar
   RETURN @varchar_out;
END;
