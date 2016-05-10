MySQL 5.5 / 5.6 / 5.7 - OLTP RW
===============================

Setup
-----

-   Client (sysbench) and server are on different servers, connected via 10Gb network.
-   CPU: 56 logical CPU threads servers Intel(R) Xeon(R) CPU E5-2683 v3 @ 2.00GHz
-   sysbench 10 tables x 10mln rows, pareto distribution
-   OS: Ubuntu 15.10 (Wily Werewolf)
-   Kernel 4.2.0-30-generic

Results
-------

![](summary-OLTP-RW_files/figure-markdown_github/proxysql-1.svg)

### Relative performance

base value: MySQL 5.7

![](summary-OLTP-RW_files/figure-markdown_github/schema-relative-2-1.svg)
