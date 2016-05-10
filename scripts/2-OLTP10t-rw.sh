#HOST="--mysql-socket=/tmp/mysql.sock"
HOST="--mysql-host=172.16.0.4"
#HOST="--mysql-socket=/tmp/proxysql.sock"
#HOST="--mysql-socket=/tmp/max.sock"
#HOST=127.0.0.1
ulimit -n 100000
./sysbench --test=tests/db/oltp55.lua --oltp_tables_count=10 --oltp_table_size=10000000 --num-threads=100 $HOST --mysql-user=sbtest --mysql-password=sbtest --oltp-read-only=on --max-time=300 --max-requests=0 --report-interval=10 --rand-type=pareto --rand-init=on --mysql-db=sbtest10t --mysql-ssl=off run | tee -a res.warmup.ro.txt
OUT="res.ps57.io100"
DIR="res-OLTP10t-rw/$OUT"
mkdir -p $DIR
#for i in 1 2 3 4 5 6 8 10 13 16 20 25 31 38 46 56 68 82 100 120 145 175 210 250 300 360 430 520 630 750 870 1000
for i in 1 3 5 8 13 20 31 46 68 100 145 210 300 430 630 870 1000 1200
#for i in 870 1000 1200
do
time=600
./sysbench --forced-shutdown=1 --test=tests/db/oltp.lua --oltp_tables_count=10 --oltp_table_size=10000000 --num-threads=${i} $HOST --mysql-user=sbtest --mysql-password=sbtest --mysql-db=sbtest10t --oltp-read-only=off --max-time=$time --max-requests=0 --report-interval=10 --rand-type=pareto --rand-init=on --mysql-ssl=off run | tee -a $DIR/res.thr${i}.txt
sleep 30
done
