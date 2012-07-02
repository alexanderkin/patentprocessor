import sqlite3 as sql
import os
import sys
import logging
import benchmark

#  bmVerify(['final_r7', 'final_r8'], filepath="/home/ysun/disambig/newcode/all/", outdir = "/home/ayu/results_v2/")
        
# Text Files
txt_file = 'benchmark_errors.txt'
opened_file = open(txt_file, 'U')
log_file = 'benchmark_results.log'

# Logging
logging.basicConfig(filename=log_file, level=logging.DEBUG)
open(log_file, "w")

# Set Up SQL Connections
con = sql.connect('invnum_N_zardoz_with_invpat.sqlite3') 

with con:

    con_cur = con.cursor()
    logging.info("Beginning to query database")
    con_cur.execute("CREATE INDEX IF NOT EXISTS index_invnum ON invpat (Invnum)");
    con_cur.execute("CREATE INDEX IF NOT EXISTS index_lastname ON invpat (Lastname)");
    con_cur.execute("CREATE INDEX IF NOT EXISTS index_firstname ON invpat (Firstname)");
    count = 0
    errors = 0
    success = 0

    while True:
        
        line_read = opened_file.readline()
        # print line_read
        
        if not line_read:
            print "EXITING"
            break
        count = count + 1
        if count%100 == 0:
            print "starting patent", count

        split_lines = line_read.split(', ')

        # Strip out weird characters/formatting
        # Need to add leading "0" to Patent if not Design/Util/etc..

        patent_to_match = split_lines[0].strip(' \t\n\r')
        if len(patent_to_match) == 7:
            patent_to_match = "0" + patent_to_match
        last_name = split_lines[1].strip(' \t\n\r')
        first_name = split_lines[2].strip(' \t\n\r')

















