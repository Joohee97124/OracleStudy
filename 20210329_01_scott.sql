SELECT USER
FROM DUAL;
--==>> SCOTT

--�� TBL_SAWON ���̺����� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
--   ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�,
--   �޿� �������� �������� ������ ������ �� �ֵ��� �Ѵ�.
SELET �����ȣ, �����, �ֹι�ȣ, �޿�
FROM TBL_SAWON
WHERE ������ ����
ORDER BY �޿� ��������;

SELET SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE ������ ����
ORDER BY SAL DESC;

SELET SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE �ֹι�ȣ 7��° �ڸ� 1���� 1 
      �ֹι�ȣ 7��° �ڸ� 1���� 3
ORDER BY SAL DESC;

SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1'
   OR SUBSTR(JUBUN, 7, 1) = '3'
ORDER BY SAL DESC;
--==>>
/*
1008	������	9804251234567	4000
1011	������	7505071234567	3000
1016	����	7012121234567	2000
1014	������	0203043234567	2000
1015	���ü�	0512123234567	1000
*/

SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3')
ORDER BY SAL DESC;


--�� LENGTH() / LENGTHB()
SELECT ENAME "1"
    , LENGTH(ENAME) "2"
    , LENGTHB(ENAME) "3"
FROM TBL_EMP;
--> LENGTH() �� ���� ���� ��ȯ, LENGTHB() �� ����Ʈ ���� ��ȯ
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/

--�� Ȯ��
SELECT *
FROM NLS_DATABASE_PARAMETERS;
--==>>
/*
NLS_LANGUAGE	        AMERICAN
NLS_TERRITORY	        AMERICA
NLS_CURRENCY	        $
NLS_ISO_CURRENCY	    AMERICA
NLS_NUMERIC_            CHARACTERS	.,
NLS_CHARACTERSET	    AL32UTF8
NLS_CALENDAR	        GREGORIAN
NLS_DATE_FORMAT	        DD-MON-RR
NLS_DATE_LANGUAGE	    AMERICAN
NLS_SORT	            BINARY
NLS_TIME_FORMAT	        HH.MI.SSXFF AM
NLS_TIMESTAMP_FORMAT	DD-MON-RR HH.MI.SSXFF AM
NLS_TIME_TZ_FORMAT	    HH.MI.SSXFF AM TZR
NLS_TIMESTAMP_TZ_FORMAT	DD-MON-RR HH.MI.SSXFF AM TZR
NLS_DUAL_CURRENCY	    $
NLS_COMP	            BINARY
NLS_LENGTH_SEMANTICS	BYTE
NLS_NCHAR_CONV_EXCP	    FALSE
NLS_NCHAR_CHARACTERSET	AL16UTF16
NLS_RDBMS_VERSION	    11.2.0.2.0
*/

--�� �ѱ� �����͸� ó���� ���
--   ����Ʈ ������� ó���ؾ߸� �ϴ� ��Ȳ�̶��
--   �׻� ���ڵ� ����� �� üũ�ϰ� ����ؾ��Ѵ�.


--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "1"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "2"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "3"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "4"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "5"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 2) "6"
FROM DUAL;
--==>> ORACLE ORAHOME BIORA	1	8	8	8	18
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ����� .... (��� ���ڿ�)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!!
--  �� ��° �Ķ���� ���� ã�� �����ϴ�... (��, ��ĵ�� �����ϴ�) ��ġ
--  �� ���� �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ���� (1�� ���� ����)

SELECT '���ǿ���Ŭ �����ο��� �մϴ�' "1"
    , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 1) "2"
    , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 2) "3"
    , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 10) "4"
    , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 11) "5"
FROM DUAL;
--> ������ �Ķ���� (�� ��° �Ķ����) ���� ������ ���·� ���~!! �� 1
--==>> ���ǿ���Ŭ �����ο��� �մϴ�	3	3	10	0


--�� RESERSE()
SELECT 'ORACLE' "1"
    , REVERSE('ORACLE') "2"
    , REVERSE('����Ŭ') "3"
FROM DUAL;
--> ��� ���ڿ� (�Ű�����) �� �Ųٷ� ��ȯ�Ѵ�. (��, �ѱ��� ����)
--==>> ORACLE	ELCARO	???


--�� �ǽ� ��� ���̺� ���� (TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� �ǽ� ������ �Է�
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20210329_01_SCOTT.SQL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20210329_01_SCOTT.SQL
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT FILENO "���Ϲ�ȣ", FILENAME "���ϸ�"
FROM TBL_FILES;

--�� TBL_FILES ���̺��� ������� ���� ���� ��ȸ�� �� �ֵ��� (���ϸ�, Ȯ����)
--   �������� �����Ѵ�.
SELECT SUBSTR(FILENAME, INSTR(FILENAME,'\',-1,1) +1 )
FROM TBL_FILES;
-->> ���� Ǯ��

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES
WHERE FILENO = 1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	                SALES.DOC
2	C:\AAA\PANMAE.XXLS	                        XLS
3	D:\RESEARCH.PPT	                            (null)
4	C:\DOCUMENTS\STUDY.HWP	                    UDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	                MP\SQL.TX
6	D:\SHARE\F\TEST.PNG	                        .PNG
7	C:\USER\GUILONG\PICTURE\PHOTO\SPRING.JPG	\PICTURE\
8	C:\ORACLESTUDY\20210329_01_SCOTT.SQL	    20210329_
*/

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , REVERSE(FILENAME) "�ŲٷεȰ����������"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	                COD.SELAS\CCC\BBB\AAA\:C
2	C:\AAA\PANMAE.XXLS	                        SLXX.EAMNAP\AAA\:C
3	D:\RESEARCH.PPT	                            TPP.HCRAESER\:D
4	C:\DOCUMENTS\STUDY.HWP	                    PWH.YDUTS\STNEMUCOD\:C
5	C:\DOCUMENTS\TEMP\SQL.TXT	                TXT.LQS\PMET\STNEMUCOD\:C
6	D:\SHARE\F\TEST.PNG	                        GNP.TSET\F\ERAHS\:D     
7	C:\USER\GUILONG\PICTURE\PHOTO\SPRING.JPG	GPJ.GNIRPS\OTOHP\ERUTCIP\GNOLIUG\RESU\:C
8	C:\ORACLESTUDY\20210329_01_SCOTT.SQL	    LQS.TTOCS_10_92301202\YDUTSELCARO\:C
*/

/*  
COD.SELAS                   \CCC\BBB\AAA\:C
SLXX.EAMNAP                 \AAA\:C
TPP.HCRAESER                \:D
PWH.YDUTS                   \STNEMUCOD\:C
TXT.LQS                     \PMET\STNEMUCOD\:C
GNP.TSET                    \F\ERAHS\:D     
GPJ.GNIRPS                  \OTOHP\ERUTCIP\GNOLIUG\RESU\:C
LQS.TTOCS_10_92301202       \YDUTSELCARO\:C
*/
--> ���� '\'�� �����ϴ� ��ġ

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , SUBSTR(REVERSE(FILENAME), 1, ����'\'�� �����ϴ� ��ġ-1) "�Ųٷε����ϸ�"
FROM TBL_FILES;

-- ���� '\'�� �����ϴ� ��ġ
SLECT INSTR(REVERSE(FILENAME), '\' , 1, 1)  -- ������ �Ű����� 1 ����
FROOM TBL_FILES;


SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\' , 1, 1) -1) "�Ųٷε����ϸ�"
FROM TBL_FILES;
--> �Ųٷ� �Ǿ����� (�ٽ� REVERSE �������)

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�"
    , REVERSE( SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\' , 1, 1) -1) ) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	                SALES.DOC
2	C:\AAA\PANMAE.XXLS	                        PANMAE.XXLS
3	D:\RESEARCH.PPT         	                RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP                      STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	                SQL.TXT
6	D:\SHARE\F\TEST.PNG                     	TEST.PNG
7	C:\USER\GUILONG\PICTURE\PHOTO\SPRING.JPG	SPRING.JPG
8	C:\ORACLESTUDY\20210329_01_SCOTT.SQL	    20210329_01_SCOTT.SQL
*/


--�� LPAD()
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
    , LPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	****ORACLE
--> �� 10Byte ������ Ȯ���Ѵ�.                   �� �� ��° �Ķ���� ���� ����...
--> �� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.    �� ù ��° �Ķ���� ���� ����,..
--  �� �����ִ� Byte ���� (4Byte) �� ���ʺ��� �� ��° �Ķ���� ������ ä���
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� RPAD()
--> Byte ������ Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
    , RPAD('ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	ORACLE****
--> �� 10Byte ������ Ȯ���Ѵ�.                   �� �� ��° �Ķ���� ���� ����...
--> �� Ȯ���� ������ 'ORACLE' ���ڿ��� ��´�.    �� ù ��° �Ķ���� ���� ����,..
--  �� �����ִ� Byte ���� (4Byte) �� �����ʺ��� �� ��° �Ķ���� ������ ä���
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� LTRIM()
SELECT 'ORAORAORACLEORACLE' "1" -- ���� ���� ����Ŭ ����Ŭ
    , LTRIM('ORAORAORACLEORACLE', 'ORA') "2"
    , LTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"
    , LTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
    , LTRIM('ORA    ORAORACLEORACLE', 'ORA') "5"
    , LTRIM('    ORAORACLEORACLE', ' ') "6"
    , LTRIM('             ORACLE') "7"  -- ���� ���� ���� �Լ��� Ȱ�� (�� ��° �Ķ���� ����)
FROM DUAL;
--==>> 
/*
ORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRAORACLEORACLE	    
    ORAORACLEORACLE	
ORAORACLEORACLE
ORACLE
*/
--> ù ��° �Ķ��ó ���� �ش��ϴ� ���ڿ��� �������
--  ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�. (���� �ϳ��� �ǰ�,,)


--�� RTRIM()
SELECT 'ORAORAORACLEORACLE' "1" -- ���� ���� ����Ŭ ����Ŭ
    , RTRIM('ORAORAORACLEORACLE', 'ORA') "2"
    , RTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"
    , RTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
    , RTRIM('ORA    ORAORACLEORACLE', 'ORA') "5"
    , RTRIM('    ORAORACLEORACLE', ' ') "6"
    , RTRIM('             ORACLE') "7"  
    , RTRIM('ORACLE             ') "8" -- ������ ���� ���� �Լ��� Ȱ�� (�� ��° �Ķ���� ����)
FROM DUAL;
--==>>
/*
ORAORAORACLEORACLE	
ORAORAORACLEORACLE	
AAAORAORAORACLEORACLE	
ORAoRAORACLEORACLE	
ORA    ORAORACLEORACLE	    
    ORAORACLEORACLE            
             ORACLE
ORACLE
*/
--> ù ��° �Ķ��ó ���� �ش��ϴ� ���ڿ��� �������
--  �����ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
--  �̸� ������ ������� ��ȯ�Ѵ�.
--  ��, �ϼ������� ó������ �ʴ´�. (���� �ϳ��� �ǰ�,,)

SELECT LTRIM('�̱���̱�����̽Žű��̽����̱��̱���̽Ź��̱��' , '�̱��') "�׽�Ʈ"
FROM DUAL;
--==>> ���̱��


--�� TRANSLATE()
--> 1:1 �� �ٲپ��ش�.
SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                , 'abcdefghijklmnopqrstuvwxyz') "�׽�Ʈ"
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-8019-2565'
                , '0123456789'
                , '�����̻�����ĥ�ȱ�') "�׽�Ʈ"
FROM DUAL;
--==>> ���Ͽ�-�ȿ��ϱ�-�̿�����
-->> �� �Ű������� �ִ� ������ ����� �ִ� ���� �� �� ���� �ִ� ����� 
--   1:1�� (2��3��° ������) ��Ī�ؼ� �ٲ��ش�


--�� REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����') "�׽�Ʈ"
FROM DUAL;
--==>> MY ����CLE ����HOME


--------------------------------------------------------------------------------

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "1"
    , ROUND(46.678, 2) "2"      -- �Ҽ��� ���� ��°�ڸ����� ǥ�� (��°�ڸ����� �ݿø�)
    , ROUND(48.674, 2) "3"
    , ROUND(48.674, 1) "4"
    , ROUND(48.674, 0) "5"
    , ROUND(48.674) "6"         -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
    , ROUND(48.674, -1) "7"     -- 10�� �ڸ����� ��ȿ�� ǥ��
    , ROUND(48.674, -2) "8"
    , ROUND(48.674, -3) "9"
FROM DUAL;
--==>> 48.678	46.68	48.67	48.7	49	49	50	0	0


--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678 "1"
    , TRUNC(48.678, 2) "2"      -- �Ҽ��� ���� ��°�ڸ����� ǥ�� (��° �ڸ����� ���)
    , TRUNC(48.674, 2) "3"
    , TRUNC(48.674, 1) "4"
    , TRUNC(48.674, 0) "5"
    , TRUNC(48.674) "6"         -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
    , TRUNC(48.674, -1) "7"     -- 10�� �ڸ����� ��ȿ�� ǥ��
    , TRUNC(48.674, -2) "8"
    , TRUNC(48.674, -3) "9"
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0


--�� MOD() �������� ��ȯ�ϴ� �Լ�      %
SELECT MOD(5, 2) "Ȯ��"
FROM DUAL;
--==>> 1
--==>> 5�� 2�� ���� ������ ����� ��ȯ


--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5, 3) "Ȯ��"
FROM DUAL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ


--�� SQRT() ��Ʈ ��������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2) "Ȯ��"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2�� ���� ����� ��ȯ



--�� LOG() �α� �Լ�
--  (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α� �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10,100) "Ȯ��1", LOG(10,10) "Ȯ��2"
FROM DUAL;
--==>> 2	1


--�� �ﰢ�Լ�
--   ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/


--�� �ﰢ�Լ��� ���Լ� (���� : -1 ~ 1)
--   �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/



--�� SIGN()     ����, ��ȣ, Ư¡
--> ���� ��� ���� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2) "1", SIGN(5-5) "2", SIGN(5-7) "3"
FROM DUAL;
--===>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�.


--�� ASCII(), CHR() �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A'), CHR(65)
FROM DUAL;
--==>> 65	A
--> ASCII : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--> CHR   : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.


--------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ ������ �⺻ ������ DAY(�ϼ�) �̴�~!!! CHECK~!!!
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE+3
FROM DUAL;
--==>>
/*
2021-03-29 12:04:05	   -- ����
2021-03-30 12:04:05	   -- 1�� ��
2021-03-27 12:04:05	   -- 2�� ��
2021-04-01 12:04:05    -- 3�� ��
*/


--�� �ð� ���� ����
SELECT SYSDATE, SYSDATE + 1/24, SYSDATE - 2/24
FROM DUAL;
--==>>
/*
2021-03-29 12:06:04	-- ����
2021-03-29 13:06:04	-- 1�ð� ��
2021-03-29 10:06:04 -- 2�ð� ��
*/


--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
/*
-----------------------------------------------------
     ����ð�                    ���� �� �ð�
-----------------------------------------------------
2021-03-29 12:05:52          2021-03-30 14:85:56
-----------------------------------------------------
*/

SELECT SYSDATE "����ð�" , SYSDATE + 1 + 2/24 + 3/(24*60) + 4/(24*60*60)
FROM DUAL;
--==>> 2021-03-29 12:12:43	2021-03-30 14:15:47
-->> ���� Ǭ Ǯ��

--���1.
SELECT SYSDATE "����ð�"
    , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;
--==>>
/*
2021-03-29 12:19:26	
2021-03-30 14:22:30
*/

--���2. (��� �ʷ� ȯ��)
SELECT SYSDATE "����ð�"
    , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4 ) / (24*60*60) "���� �� �ð�"
FROM DUAL;
--==>>
/*
2021-03-29 12:21:14	
2021-03-30 14:24:18
*/


--�� ��¥ - ��¥ = �ϼ�
-- ex) (2021-07-09) - (2021-03-29)
--        ������         ������
SELECT TO_DATE('2021-07-09', 'YYYY-MM-DD') - TO_DATE('2021-03-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> 102

--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2021-07-09', 'YYYY-MM-DD') -- ��¥ �������� ��ȯ
FROM DUAL;
--==>> 2021-07-09 00:00:00

SELECT TO_DATE('2021-07-59', 'YYYY-MM-DD') 
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01847: day of month must be between 1 and last day of month
01847. 00000 -  "day of month must be between 1 and last day of month"
*Cause:    
*Action:
*/

SELECT TO_DATE('2021-13-09', 'YYYY-MM-DD') 
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month"
*Cause:    
*Action:
*/

--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--   ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������~!!!


--�� ADD_MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE "1"
    , ADD_MONTHS(SYSDATE, 2) "2"
    , ADD_MONTHS(SYSDATE, 3) "3"
    , ADD_MONTHS(SYSDATE, -2) "4"
    , ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
--==>>
/*
2021-03-29 12:28:44	-- ����
2021-05-29 12:28:44 -- 2���� ��
2021-06-29 12:29:24 -- 3���� ��
2021-01-29 12:30:13	-- 2���� ��
2020-12-29 12:30:13 -- 3���� ��
*/
--> ���� ���ϰ� ����

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� MONTHS_BETWEEN()
--   ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD') )
FROM DUAL;
--==>> 225.952385752688172043010752688172043011
--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
--�� ������� ��ȣ�� ��-�� (����)�� ��ȯ�Ǿ��� ��쿡��
--   ù��° ���ڰ��� �ش��ϴ� ��¥����
--   �ι�° ���ڰ��� �ش��ϴ� ��¥�� ���̷��� ��� �ǹ̷� Ȯ���� �� �ִ�.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-07-09', 'YYYY-MM-DD') )
FROM DUAL;
--==>> -3.33787671744324970131421744324970131422


--�� NEXT_DAY()
--  ù ��° ���ڰ��� �������� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> 2021-04-03	2021-04-05

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ���� ������ ���� ���� �������� �ٽ� �� �� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>> 2021-04-03	2021-04-05

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�


--�� LAST_DAY()
-- �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>> 2021-03-31


--�� ���úη�... �����̰�... ���뿡 �� ����(?)����.
--   �����Ⱓ�� 22������ �Ѵ�.

--   1. ���� ���ڸ� ���Ѵ�.
SELECT ADD_MONTHS (SYSDATE, 22)
FROM DUAL;
--==>> 2023-01-29


--   2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �ؾ� �Ѵٰ� �����ϸ�
--      �����̰� �� ���� �Ծ�� ���� �����ٱ�.
SELECT TO_DATE(SYSDATE) - TO_DATE('2023-01-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> -671
-- 671 * 3 = 2013��


--�� ���� ��¥ �� �ð����κ���...
--   ������(2021-07-09 18:00:00) ���� ���� �Ⱓ��
--   ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
---------------------------------------------------------------------------
���� �ð�            | ������              |   ��   |  �ð�  |  ��  |  ��  |
---------------------------------------------------------------------------
2021-03-29 14:34:27  | 2021-07-09 18:00:00  |   110  |   3    |  15  |  33  |
---------------------------------------------------------------------------
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==> Session��(��) ����Ǿ����ϴ�.

-- [��Ʈ] --------------------------------------------------------------------

--��1�� 2�ð� 3�� 4�ʡ��� ���ʡ��� ȯ���ϸ�
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;

--��93784�ʡ��� �ٽ� ����, �ð� , ��, �ʡ��� ȯ���ϸ�
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;    

-- [������ Ǯ��] ---------------------------------------------------------------

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�
SELECT �������� - ��������
FROM DUAL;

SELECT TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') 
FROM DUAL;
--==> 2021-07-09 18:00:00 �� ��¥ ����

SELECT TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==> 102.079548611111111111111111111111111111
--> �����ϱ��� ���� �ϼ� (���� : ��)

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : ��
SELECT (�����ϱ��� ���� �ϼ�) * (�Ϸ縦 �����ϴ� ��ü ��)
FROM DUAL;

SELECT (TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==> 8819482

SELECT TRUNC(TRUNC(TRUNC(8819482/60)/60)/24)
     , MOD(TRUNC(TRUNC(8819482/60)/60), 24)
     , MOD(TRUNC(8819482/60), 60)
     , MOD(8819482, 60)
FROM DUAL;    
--> �Ʒ��� ���� ��� (�������� ����ɶ����� ���� �޶����� ������
--  �̷��� �ۼ��ϸ� �ȵ�~!

SELECT SYSDATE "���� �ð�"
     , TO_DATE('2021-07-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"   
     , TRUNC(TRUNC(TRUNC((TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "��" 
     , MOD(TRUNC(TRUNC((TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)  "�ð�"
     , MOD(TRUNC((TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "��"
     , TRUNC(MOD((TO_DATE('2021-07-09 18:00:00','YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "��"
FROM DUAL;    
--==> 102   1   48   54


--�� ����
--   ������ �¾�� �������...
--   �󸶸�ŭ�� ��, �ð�, ��, �ʸ� ��Ҵ���... (����ִ���...)
--   ��ȸ�ϴ� �������� �����Ѵ�.
/*
-----------------------------------------------------------------------------
���� �ð�            | �¾ �ð�           |   ��   |  �ð�  |  ��  |  ��  |
-----------------------------------------------------------------------------
2021-03-29 14:34:27  | 1997-12-24 15:15:00  |  XXX  |   XX   |  XX  |  XX  |
-----------------------------------------------------------------------------
*/
-- ���1)
SELECT SYSDATE "���� �ð�"
    , TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS') "�¾ �ð�"
    , TRUNC( SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS') )"��"
    , TRUNC( MOD( (SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *24, 24 ) ) "�ð�"
    , TRUNC( MOD( (MOD( (SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *24, 24 ))*60, 60) ) "��"
    , TRUNC( MOD( (MOD( (MOD( (SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *24, 24 ))*60, 60))*60 , 60) ) "��"
FROM DUAL;

-- ���2)
SELECT SYSDATE "���� �ð�"
     , TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS') "�¾ �ð�"  
     , TRUNC( (SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *(24*60*60)/24/60/60 ) "��"
     , TRUNC( MOD( (SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *(24*60*60)/60/60 , 24) ) "�ð�"
     , MOD( TRUNC( (SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *(24*60*60)/60) , 60) "��"
     , MOD ((SYSDATE - TO_DATE('1997-12-24 15:15:00', 'YYYY-MM-DD HH24:MI:SS')) *(24*60*60) ,60) "��"
FROM DUAL;    


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--=>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                  --  2021-03-29 �� �⺻ ���� ��¥
    ,ROUND(SYSDATE, 'YEAR') "2"     --  2021-01-01 �� �⵵���� ��ȿ�� ������ (��ݱ�, �Ϲݱ� ����)
    ,ROUND(SYSDATE, 'MONTH') "3"    --  2021-04-01 �� ������ ��ȿ�� ������ (15�� ����)
    ,ROUND(SYSDATE, 'DD') "4"       --  2021-03-30 �� ��¥���� ��ȿ�� ������ (���� ����)
    ,ROUND(SYSDATE, 'DAY') "5"      --  2021-03-28 �� ��¥���� ��ȿ�� ������ (������ ����)
FROM DUAL;

--�� ��¥ ����
SELECT SYSDATE "1"                  --  2021-03-29 �� �⺻ ���� ��¥
    ,TRUNC(SYSDATE, 'YEAR') "2"     --  2021-01-01 �� �⵵���� ��ȿ�� ������ 
    ,TRUNC(SYSDATE, 'MONTH') "3"    --  2021-03-01 �� ������ ��ȿ�� ������ 
    ,TRUNC(SYSDATE, 'DD') "4"       --  2021-03-29 �� ��¥���� ��ȿ�� ������ 
    ,TRUNC(SYSDATE, 'DAY') "5"      --  2021-03-28 �� ��¥���� ��ȿ�� ������ 
FROM DUAL;


--------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

--TO_CHAR()     : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
--TO_DATE()     : ���� ������(��¥ ����)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
--TO_NUMBER()   : ���� ������(���� ����)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�

SELECT 10 "1", TO_CHAR(10) "2"
FROM DUAL;

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ �� �ֵ��� �Ѵ�

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_CURRENCY = '\';       -- ȭ����� : ��(��)
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


-- ��¥ �� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')       -- 2021-03-29 (��¥�湮��)
    , TO_CHAR(SYSDATE, 'YYYY')              -- 2021
    , TO_CHAR(SYSDATE, 'YEAR')              -- TWENTY TWENTY-ONE
    , TO_CHAR(SYSDATE, 'MM')                -- 03
    , TO_CHAR(SYSDATE, 'MONTH')             -- 3��
    , TO_CHAR(SYSDATE, 'MON')               -- 3��
    , TO_CHAR(SYSDATE, 'DD')                -- 29
    , TO_CHAR(SYSDATE, 'DAY')               -- ������
    , TO_CHAR(SYSDATE, 'DY')                -- ��
    , TO_CHAR(SYSDATE, 'HH24')              -- 16
    , TO_CHAR(SYSDATE, 'HH')                -- 04
    , TO_CHAR(SYSDATE, 'HH AM')             -- 04 ����
    , TO_CHAR(SYSDATE, 'HH PM')             -- 04 ����
    , TO_CHAR(SYSDATE, 'MI')                -- 42
    , TO_CHAR(SYSDATE, 'SS')                -- 16
    , TO_CHAR(SYSDATE, 'SSSSS')             -- 60216    �� ���� �귯�� ��ü ��
    , TO_CHAR(SYSDATE, 'Q')                 -- 1        �� �б�
FROM DUAL;

SELECT '04' "1", TO_NUMBER('04') "2"
FROM DUAL;
--> ����4, ����4

SELECT TO_CHAR(4) "1", '4' "2"
FROM DUAL;
--> ����4, ����4

SELECT TO_NUMBER( T0_CHAR(SYSDATE,'YYYY') ) "Ȯ��" 
FROM DUAL;


--�� EXTRACT()       
SELECT TO_CHAR(SYSDATE, 'YYYY')         -- 2021  �� ������ �����Ͽ� ���� Ÿ������...
    , TO_CHAR(SYSDATE, 'MM')            -- 03    �� ���� �����Ͽ� ���� Ÿ������...
    , TO_CHAR(SYSDATE, 'DD')            -- 29    �� ���� �����Ͽ� ���� Ÿ������...
    , EXTRACT(YEAR FROM SYSDATE)        -- 2021  �� ������ �����Ͽ� ���� Ÿ������...
    , EXTRACT(MONTH FROM SYSDATE)       -- 3     �� ���� �����Ͽ� ���� Ÿ������...
    , EXTRACT(DAY FROM SYSDATE)         -- 19    �� ���� �����Ͽ� ���� Ÿ������...
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�


--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "1"                                -- 60000
    , TO_CHAR(60000) "2"                        -- 60000
    , TO_CHAR(60000, '99,999') "3"              -- 60,000
    , TO_CHAR(60000, '$99,999') "4"             -- $60,000
    , TO_CHAR(60000, 'L99,999') "5"             --           \60,000
    , LTRIM( TO_CHAR(60000, 'L99,999') ) "6"    -- \60,000
FROM DUAL;


--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "���� �ð�"
    , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>>
/*
2021-03-29 17:18:01	
2021-03-30 19:21:05
*/


--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "����ð�"
    , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� ���"
    
FROM DUAL;
--==>>
/*
2021-03-29 17:21:45	
2022-06-01 21:26:51
*/


--------------------------------------------------------------------------------

--���� CASE ���� (���ǹ�, �б⹮) ����--
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�¸����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2  WHEN 9 THEN '5+2=9' ELSE '5+2�¸����' END "��� Ȯ��"
FROM DUAL;

SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
        END "��� Ȯ��"
FROM DUAL;
--==>> 1+1=2



--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1' ,2 ,'5-2=2', 3 ,'5-2=3' ,'5-2�¸���') "��� Ȯ��"
FROM DUAL;
--==>> 5-2=3



--�� CASE WHEN THEN ELSE END ����Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '5�� 2�� �� �Ұ�'
        END "��� Ȯ��"
FROM DUAL;
--==>> 5>2


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '���Ҹ���'
            ELSE '���ָ���'
        END ���Ȯ��
FROM DUAL;
--==>> ��������
/*
SELECT CASE WHEN T THEN '��������'
            WHEN 5>2 OR 2=3 THEN '���Ҹ���'
            ELSE '���ָ���'
        END ���Ȯ��
FROM DUAL;
*/


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=2 THEN '���游��'
            ELSE '���ָ���'
        END "��� Ȯ��"
FROM DUAL;


/*
SELECT CASE WHEN T THEN '��������'
            WHEN 5<2 AND 2=2 THEN '���游��
            ELSE '���ָ���'
FROM DUAL;

*/


SELECT CASE WHEN 3<1 AND ( 5<2 OR 3>1) AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=2 THEN '���游��'
            ELSE '���ָ���'
        END "��� Ȯ��"
FROM DUAL;

/*
SELECT CASE WHEN F AND T THEN '��������'
            WHEN F THEN '���游��'
            ELSE '���ָ���'
FROM DUAL;
*/