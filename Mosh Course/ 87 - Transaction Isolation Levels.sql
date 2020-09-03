/* 
---- Levels: ----

// https://sqlperformance.com/2014/04/t-sql-queries/the-repeatable-read-isolation-level

- READ UNCOMMITED: 
 - doesn't set any locks
 - all concurency problems may appear
 
- READ COMMITED:
 - good at protection against Dirty Reads
 
- REPEATABLE READ:
 - good at protection against:
  -> Lost Updates
  -> Dirty Reads
  -> Non-repeating Reads

- SERIALIZABLE:
 - protects against:
  -> Lost Updates
  -> Dirty Reads
  -> Non-repeating Reads
  -> Phantom Reads
  
  */
  
  SHOW VARIABLES LIKE 'transaction_isolation';
  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
  -- all future connections in the current session will be done through serializable isolation level
  SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  -- sets all new transactions in all new sessions to this isolation level
