/*
    Merge together two disctinct MySQL tables
    mysqldump [options] uspto -T /var/lib/mysql/uspto
    
    READ THIS: http://dev.mysql.com/doc/refman/5.5/en/optimizing-innodb-bulk-data-loading.html
*/

SELECT "[dir]", NOW();
SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
SET SESSION tx_isolation='READ-UNCOMMITTED';
SET innodb_lock_wait_timeout = 500;
SET autocommit=0; 

SELECT "patent";
LOAD DATA LOCAL INFILE '[dir]/patent.txt' INTO TABLE uspto.patent FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "location";
LOAD DATA LOCAL INFILE '[dir]/location.txt' IGNORE INTO TABLE uspto.location FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "subclass";
LOAD DATA LOCAL INFILE '[dir]/subclass.txt' IGNORE INTO TABLE uspto.subclass FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "mainclass";
LOAD DATA LOCAL INFILE '[dir]/mainclass.txt' IGNORE INTO TABLE uspto.mainclass FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "application";
LOAD DATA LOCAL INFILE '[dir]/application.txt' INTO TABLE uspto.application FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "assignee";
LOAD DATA LOCAL INFILE '[dir]/assignee.txt' INTO TABLE uspto.assignee FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "inventor";
LOAD DATA LOCAL INFILE '[dir]/inventor.txt' INTO TABLE uspto.inventor FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "ipcr";
LOAD DATA LOCAL INFILE '[dir]/ipcr.txt' INTO TABLE uspto.ipcr FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "lawyer";
LOAD DATA LOCAL INFILE '[dir]/lawyer.txt' INTO TABLE uspto.lawyer FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "usreldoc";
LOAD DATA LOCAL INFILE '[dir]/usreldoc.txt' INTO TABLE uspto.usreldoc FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "uspc";
LOAD DATA LOCAL INFILE '[dir]/uspc.txt' INTO TABLE uspto.uspc FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "citation";
LOAD DATA LOCAL INFILE '[dir]/citation.txt' INTO TABLE uspto.citation FIELDS TERMINATED by '\t' ENCLOSED BY '\"';
SELECT "otherreference";
LOAD DATA LOCAL INFILE '[dir]/otherreference.txt' INTO TABLE uspto.otherreference FIELDS TERMINATED by '\t' ENCLOSED BY '\"';

COMMIT;
SET autocommit=1; 
SET innodb_lock_wait_timeout = 50;
SET UNIQUE_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 1;
SET SESSION tx_isolation='REPEATABLE-READ';
SELECT NOW();

SELECT SLEEP(300);