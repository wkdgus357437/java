======================================================
Oracle Free Use Terms and Conditions (FUTC) License 
======================================================
https://www.oracle.com/downloads/licenses/oracle-free-license.html
===================================================================

ojdbc11-full.tar.gz - JDBC Thin Driver and Companion JARS
========================================================
This TAR archive (ojdbc11-full.tar.gz) contains the 21.6.0.0.1 release of the Oracle JDBC Thin driver(ojdbc11.jar), the Universal Connection Pool (ucp.jar) and other companion JARs grouped by category. 

(1) ojdbc11.jar (5,181,830 bytes) - 
(SHA1 Checksum: 91823e0f79393f05fd1c423f3e5badc613fa82df)
Oracle JDBC Driver compatible with Certified with JDK11, JDK12, JDK13, JDK14, and JDK15;
Note: "java -jar ojdbc11.jar" shows the version as 21.6.0.0.0. But, it is indeed from the release 21.7.0.0. 
(2) ucp11.jar (1,801,612 bytes) - (SHA1 Checksum: ab435345951c2a37b8065e2a88979ac43fbc32c7)
Universal Connection Pool classes to be used with ojdbc11.jar -- for performance, scalability, high availability, sharded and multitenant databases.
Note: "java -jar ucp.jar" shows the version as 21.6.0.0.0. But, it is indeed from the release 21.7.0.0. 
You need to change ucp11.jar to ucp.jar to display the version. 
(3) rsi.jar (345,275 bytes) - (SHA1 Checksum: b311fd774f433f6f293ecb01a7594573628bae34)
Reactive Streams Ingestion (RSI) 
(4) ojdbc.policy (11,515 bytes) - Sample security policy file for Oracle Database JDBC drivers

======================
Security Related JARs
======================
Java applications require some additional jars to use Oracle Wallets. 
You need to use all the three jars while using Oracle Wallets. 
(5) oraclepki.jar (307,830 bytes) - (SHA1 Checksum: d56d4c49ea46cedb3fe2fde2ceb6fc7dd3a31e76)
Additional jar required to access Oracle Wallets from Java
(6) osdt_cert.jar (211,071 bytes) - (SHA1 Checksum: b0cef05e9886a686e840a1c6cf807f7744985e68)
Additional jar required to access Oracle Wallets from Java
(7) osdt_core.jar (312,992 bytes) - (SHA1 Checksum: 64bd0374c6feb0811948f4f6f600746f6c840f6d)
Additional jar required to access Oracle Wallets from Java

=============================
JARs for NLS and XDK support 
=============================

(8) orai18n.jar (1,664,692 bytes) - (SHA1 Checksum: bbe1ac33fdb88d5d3fb0402b05105604f5f0011d) 
Classes for NLS support
(9) xdb.jar (129,578 bytes) - (SHA1 Checksum: e97dcfbc86f0f9f4fffc111d46435f02b6b16e4d)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 
(10) xmlparserv2.jar (1,953,962 bytes) - (SHA1 Checksum: 5a3286a1ec998126fabde509a12af3481526968d)
Classes to support standard JDBC 4.x java.sql.SQLXML interface 
(11) xmlparserv2_sans_jaxp_services.jar (1,949,192 bytes) - (SHA1 Checksum: b8bca62a8e7f5acc2dd67f798e6cf0930c11350d) 
Classes to support standard JDBC 4.x java.sql.SQLXML interface

====================================================
JARs for Real Application Clusters(RAC), ADG, or DG 
====================================================
(12) ons.jar (198,693 bytes) - (SHA1 Checksum: fb91d3c740fa23d2348b80fbdd6f6be2dcd2f6c2)
for use by the pure Java client-side Oracle Notification Services (ONS) daemon
(13) simplefan.jar (32,440 bytes) - (SHA1 Checksum: 5990dfa02a1c723b021f101517eeecca5e227339)
Java APIs for subscribing to RAC events via ONS; simplefan policy and javadoc

==================================================================================
NOTE: The diagnosability JARs **SHOULD NOT** be used in the production environment. 
These JARs (ojdbc11_g.jar,ojdbc11dms.jar, ojdbc11dms_g.jar) are meant to be used in the 
development, testing, or pre-production environment to diagnose any JDBC related issues. 

=====================================
OJDBC - Diagnosability Related JARs
===================================== 

(14) ojdbc11_g.jar (8,604,996 bytes) - (SHA1 Checksum: d1992145a89a959438213183eaeabd6e4e369bf9)
Same as ojdbc8.jar except compiled with "javac -g" and contains tracing code.

(15) ojdbc11dms.jar (7,182,535 bytes) - (SHA1 Checksum: ed67941de2ef0c47d467acf97031d8d7a7dc0b82)
Same as ojdbc8.jar, except that it contains instrumentation to support DMS and limited java.util.logging calls.

(16) ojdbc11dms_g.jar (8,606,867 bytes) - (SHA1 Checksum: fbe3fc471d9480bb556433ca93ec3a3e013a42d0)
Same as ojdbc8_g.jar except that it contains instrumentation to support DMS.

(17) dms.jar (2,194,541 bytes) - (SHA1 Checksum:04b3048f7713d0cd432a74a790a772b8b00c3bbd)
dms.jar required for DMS-enabled JAR files.

==================================================================
Oracle JDBC and UCP - Javadoc and README
==================================================================

(18) JDBC-Javadoc-21c.jar (2,594,500 bytes) - JDBC API Reference 21c

(19) ucp11-Javadoc-21c.jar (812,155 bytes) - UCP Java API Reference 21c

(20) RSI-Javadoc-21c.jar (425,937 bytes) - RSI Java API Reference 21c

(21) simplefan-Javadoc-21c.jar (86,960 bytes) - Simplefan API Reference 21c 

(22) xdb-Javadoc-21c.jar (2,631,108 bytes) - XDB API Reference 21c 

(23) xmlparserv2-Javadoc-21c.jar (2,631,108 bytes) - xmlparserv2 API Reference 21c 

(24) JDBC-Readme.txt: It contains general information about the JDBC driver and bugs that have been fixed in the 21.7.0.0 release. 

(25) UCP-Readme.txt: It contains general information about UCP and bugs that are fixed in the 21.7.0.0 release. 

(26) Bugs-fixed-in-216.txt: It contains the new feature added on top of the  21.6 release. 

=================
USAGE GUIDELINES
=================
Refer to the JDBC Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/21/jjdbc/index.html) and Universal Connection Pool Developers Guide (https://docs.oracle.com/en/database/oracle/oracle-database/21/jjucp/index.html) for more details. 