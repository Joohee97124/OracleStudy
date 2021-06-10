SELECT USER
FROM DUAL;
--==>> SCOTT

SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.

--�� SCOTT.TBL_INSA ���̺��� ���� ���� ������ ���� ���� ������ ����
--   (�� �ȵǰ� �ݺ��� Ȱ�� ����ϱ�)

DECLARE
    VINSA TBL_INSA%ROWTYPE;
    VNUM  TBL_INSA.NUM%TYPE := 1001;
BEGIN  
    LOOP
        SELECT NAME, TEL, BUSEO
            INTO VINSA.NAME, VINSA.TEL, VINSA.BUSEO
        FROM TBL_INSA
        WHERE NUM = VNUM;
        
        DBMS_OUTPUT.PUT_LINE(VINSA.NAME || '-' || VINSA.TEL || '-' || VINSA.BUSEO);
        
        EXIT WHEN VNUM >= 1060;
        
        VNUM := VNUM +1;            -- VNUM �� 1��ŭ ����
        
    END LOOP;
END;
--==>>
/*
ȫ�浿-011-2356-4528-��ȹ��
�̼���-010-4758-6532-�ѹ���
�̼���-010-4231-1236-���ߺ�
������-019-5236-4221-������
�Ѽ���-018-5211-3542-�ѹ���
�̱���-010-3214-5357-���ߺ�
����ö-011-2345-2525-���ߺ�
�迵��-016-2222-4444-ȫ����
������-019-1111-2222-�λ��
������-011-3214-5555-������
������-010-8888-4422-������
���ѱ�-018-2222-4242-ȫ����
���̼�-019-6666-4444-ȫ����
Ȳ����-010-3214-5467-���ߺ�
������-016-2548-3365-�ѹ���
�̻���-010-4526-1234-���ߺ�
�����-010-3254-2542-���ߺ�
�̼���-018-1333-3333-���ߺ�
�ڹ���-017-4747-4848-�λ��
������-011-9595-8585-�����
ȫ�泲-011-9999-7575-���ߺ�
�̿���-017-5214-5282-��ȹ��
���μ�--������
�踻��-011-5248-7789-��ȹ��
�����-010-4563-2587-������
�����-010-2112-5225-������
�迵��-019-8523-1478-�ѹ���
�̳���-016-1818-4848-�λ��
�踻��-016-3535-3636-�ѹ���
������-019-6564-6752-�ѹ���
����ȯ-019-5552-7511-��ȹ��
�ɽ���-016-8888-7474-�����
��̳�-011-2444-4444-������
������-011-3697-7412-��ȹ��
������--���ߺ�
���翵-011-9999-9999-�����
�ּ���-011-7777-7777-ȫ����
���μ�-010-6542-7412-������
������-010-2587-7895-������
�ڼ���-016-4444-7777-�λ��
�����-016-4444-5555-�����
ä����-011-5125-5511-���ߺ�
��̿�-016-8548-6547-������
����ȯ-011-5555-7548-������
ȫ����-011-7777-7777-������
����-017-3333-3333-�ѹ���
�긶��-018-0505-0505-������
�̱��--���ߺ�
�̹̼�-010-6654-8854-���ߺ�
�̹���-011-8585-5252-ȫ����
�ǿ���-011-5555-7548-������
�ǿ���-010-3644-5577-��ȹ��
��̽�-011-7585-7474-�����
����ȣ-016-1919-4242-ȫ����
���ѳ�-016-2424-4242-������
������-010-7549-8654-������
�̹̰�-016-6542-7546-�����
�����-010-2415-5444-��ȹ��
�Ӽ���-011-4151-4154-���ߺ�
��ž�-011-4151-4444-���ߺ�


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

-----------------------------------------------------------------------------------

--���� FUNCTION(�Լ�) ����--

-- 1. �Լ��� �ϳ� �̻��� PL / SQL ������ ������ �����ƾ����
--    �ڵ带 �ٽ� ����� �� �ֵ��� ĸ��ȭ �ϴµ� ���ȴ�.
--    ����Ŭ������ ����Ŭ�� ���ǵ� �⺻ ���� �Լ��� ����ϰų�
--    ���� ������ �Լ��� ���� �� �ִ� (�� ����� ���� �Լ�)
--    �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
--    ���� ���ν���ó�� EXECUTE ���� ���� ������ �� �ִ�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[(
    �Ű�����1 �ڷ���
    , �Ű�����2 �ڷ���
)]
RETURN ������Ÿ��
IS
    -- �ֿ� ���� ���� (��������)
BEGIN
    -- ���๮;
    ...
    RETURN ��;
    
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;
*/

--�� ����� ���� �Լ�(������ �Լ�)��
--   IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--   �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN ���� �����ؾ� �ϰ�,
--   FUNCTION �� �ݵ�� ���� ���� ��ȯ�Ѵ�.


--�� TBL_INSA ���̺��� ������� 
--   �ֹι�ȣ�� ������ ������ ��ȸ�Ѵ�.
SELECT NAME, SSN, DECODE( SUBSTR(SSN, 8, 1), 1, '����' , 2 ,'����') "����"
FROM TBL_INSA;

--�� FUNCTION ����
-- �Լ��� : FN_GENDER()
--                   �� SSN(�ֹε�Ϲ�ȣ) �� 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER
(
    VSSN VARCHAR2       -- �Ű����� : �ڸ���(����) ���� ����
)
RETURN VARCHAR2         -- ��ȯ�ڷ��� : �ڸ���(����) ���� ����
IS
    -- �ֿ� ���� ����
    VRESULT VARCHAR2(20);
BEGIN
    -- ���� �� ó��
    IF (SUBSTR(VSSN,8,1) IN ('1','3'))
        THEN VRESULT := '����';
    ELSIF (SUBSTR(VSSN,8,1) IN ('2','4'))
        THEN VRESULT := '����';
    ELSE
        VRESULT := '����Ȯ�κҰ�';
        
    END IF;
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.



--�� ������ ���� �� ���� �Ű����� (�Է� �Ķ����) �� �Ѱܹ޾�
--   A �� B ���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--   �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(10,3)
FROM DUAL;
--==>> 1000
*/

CREATE OR REPLACE FUNCTION FN_POW
(  
    VNUM1 NUMBER 
    , VNUM2 NUMBER 
)
RETURN NUMBER
IS 
    COUNT NUMBER := 1;
    VNUM3 NUMBER ; 
BEGIN
    VNUM3 := 1;
    FOR COUNT IN 1..VNUM2 LOOP
        VNUM3 := VNUM3 * VNUM1;
    END LOOP;
    
    RETURN VNUM3;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.

SELECT FN_POW(10,3)
FROM DUAL;
--==>> 1000

----------------------------------[������ Ǯ��]---------------------------------

CREATE OR REPLACE FUNCTION FN_POW
(
    A NUMBER                        -- 10
  , B NUMBER                        -- 3
)
RETURN NUMBER
IS 
    VRESULT NUMBER := 1;            -- ������
    VNUM NUMBER;
    
BEGIN
    FOR VNUM IN 1..B LOOP           -- 1 ~ 3
        VRESULT := VRESULT * A ;    -- 1 * 10 * 10 * 10 
    END LOOP;
    
    RETURN VRESULT;
    
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.


-- < ���� >
--�� TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
--   �޿��� (�⺻��*12)+���� ������� ������ �����Ѵ�.
--   �Լ��� : FN_PAY(�⺻��, ����)
CREATE OR REPLACE FUNCTION FN_PAY
(
    V_BASICPAY  IN TBL_INSA.BASICPAY%TYPE
    , V_SUDANG  IN TBL_INSA.SUDANG%TYPE
)
RETURN NUMBER
IS
    V_PAY NUMBER;
    
BEGIN
    V_PAY := (V_BASICPAY *12) + V_SUDANG;
    
    RETURN V_PAY;
END;
--==>> Function FN_PAY��(��) �����ϵǾ����ϴ�.

-- Ȯ��
SELECT NAME, BASICPAY, SUDANG, FN_PAY(BASICPAY,SUDANG)"�޿�"
FROM TBL_INSA;
--==>> 
/*
ȫ�浿	2610000	200000	31520000
�̼���	1320000	200000	16040000
�̼���	2550000	160000	30760000
������	1954200	170000	23620400
�Ѽ���	1420000	160000	17200000
�̱���	2265000	150000	27330000
����ö	1250000	150000	15150000
�迵��	950000	145000	11545000
������	840000	220400	10300400
������	2540000	130000	30610000
������	1020000	140000	12380000
���ѱ�	880000	114000	10674000
���̼�	1601000	103000	19315000
Ȳ����	1100000	130000	13330000
������	1050000	104000	12704000
�̻���	2350000	150000	28350000
�����	950000	210000	11610000
�̼���	880000	123000	10683000
�ڹ���	2300000	165000	27765000
������	880000	140000	10700000
ȫ�泲	875000	120000	10620000
�̿���	1960000	180000	23700000
���μ�	2500000	170000	30170000
�踻��	1900000	170000	22970000
�����	1100000	160000	13360000
�����	1050000	150000	12750000
�迵��	2340000	170000	28250000
�̳���	892000	110000	10814000
�踻��	920000	124000	11164000
������	2304000	124000	27772000
����ȯ	2450000	160000	29560000
�ɽ���	880000	108000	10668000
��̳�	1020000	104000	12344000
������	1100000	160000	13360000
������	1050000	140000	12740000
���翵	960400	190000	11714800
�ּ���	2350000	187000	28387000
���μ�	2000000	150000	24150000
������	2010000	160000	24280000
�ڼ���	2100000	130000	25330000
�����	2300000	150000	27750000
ä����	1020000	200000	12440000
��̿�	1100000	210000	13410000
����ȯ	1060000	220000	12940000
ȫ����	960000	152000	11672000
����	2650000	150000	31950000
�긶��	2100000	112000	25312000
�̱��	2050000	106000	24706000
�̹̼�	1300000	130000	15730000
�̹���	1950000	103000	23503000
�ǿ���	2260000	104000	27224000
�ǿ���	1020000	105000	12345000
��̽�	960000	108000	11628000
����ȣ	980000	114000	11874000
���ѳ�	1000000	104000	12104000
������	1950000	200000	23600000
�̹̰�	2520000	160000	30400000
�����	1950000	180000	23580000
*/


--�� TBL_INSA ���̺��� �Ի����� ��������
--   ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
--   ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
---  �Լ��� : FN_WORKYEAR(�Ի���)
CREATE OR REPLACE FUNCTION FN_WORKYEAR
(
 V_IBSADATE IN TBL_INSA.IBSADATE%TYPE
 
)
RETURN NUMBER
IS
    V_GUNU NUMBER(4,1);      -- �ٹ����
BEGIN
    V_GUNU := (MONTHS_BETWEEN(SYSDATE, V_IBSADATE))/12;
    
    RETURN V_GUNU;
END;
--==>> Function FN_WORKYEAR��(��) �����ϵǾ����ϴ�

-- Ȯ��
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE)"�ٹ��⵵"
FROM TBL_INSA;
--==>>
/*
ȫ�浿	1998-10-11	22.5
�̼���	2000-11-29	20.4
�̼���	1999-02-25	22.1
������	2000-10-01	20.5
�Ѽ���	2004-08-13	16.7
�̱���	2002-02-11	19.2
����ö	1998-03-16	23.1
�迵��	2002-04-30	18.9
������	2003-10-10	17.5
������	1997-08-08	23.7
������	2000-07-07	20.8
���ѱ�	1999-10-16	21.5
���̼�	1998-06-07	22.8
Ȳ����	2002-02-15	19.1
������	1999-07-26	21.7
�̻���	2001-11-29	19.4
�����	2000-08-28	20.6
�̼���	2004-08-08	16.7
�ڹ���	1999-12-10	21.3
������	2003-10-10	17.5
ȫ�泲	2001-09-07	19.6
�̿���	2003-02-25	18.1
���μ�	1995-02-23	26.1
�踻��	1999-08-28	21.6
�����	2000-10-01	20.5
�����	2002-08-28	18.6
�迵��	2000-10-18	20.5
�̳���	2001-09-07	19.6
�踻��	2000-09-08	20.6
������	1999-10-17	21.5
����ȯ	2001-01-21	20.2
�ɽ���	2000-05-05	20.9
��̳�	1998-06-07	22.8
������	2005-09-26	15.5
������	2002-05-16	18.9
���翵	2003-08-10	17.7
�ּ���	1998-10-15	22.5
���μ�	1999-11-15	21.4
������	2003-12-28	17.3
�ڼ���	2000-09-10	20.6
�����	2001-12-10	19.3
ä����	2003-10-17	17.5
��̿�	2003-09-24	17.5
����ȯ	2004-01-21	17.2
ȫ����	2003-03-16	18.1
����	1999-05-04	21.9
�긶��	2001-07-15	19.7
�̱��	2001-06-07	19.8
�̹̼�	2000-04-07	21
�̹���	2003-06-07	17.8
�ǿ���	2000-06-04	20.8
�ǿ���	2000-10-10	20.5
��̽�	1999-12-12	21.3
����ȣ	1999-10-16	21.5
���ѳ�	2004-06-07	16.8
������	2004-08-13	16.7
�̹̰�	1998-02-11	23.2
�����	2003-08-08	17.7
�Ӽ���	2001-10-10	19.5
��ž�	2001-10-10	19.5
*/


------------------------------------------------------------------------------------

--�� ����
-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Manipulation Language)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�

-- 2. CREATE, DROP, ALTER, (TRUNCATE)
--==>> DDL (Data Definition Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transcation Control Language)


-- ���� PL/SQL�� �� DML��, TCL���� ��� �����ϴ�
-- ���� PL/SQL�� �� DML��, DDL��, DCL��, TCL�� ��밡���ϴ�

--�� ���� SQL (����PL/SQL)
--> �⺻������ ����ϴ� SQL ������
-- PL/SQL ���� �ȿ� SQL ������ ���� �����ϴ� ���
--> �ۼ��� ���� ������ ����

--�� ���� SQL (����PL/SQL)   �� EXECUTE, IMMEDIATE
--> �ϼ����� ���� SQL ������ �������
--  ���� �� ���� ������ ���ڿ� ���� �Ǵ� ���ڿ� ����� ����
--  SQL ������ �������� �ϼ��Ͽ� �����ϴ� ���
--> ������ ���ǵ��� ���� SQL �� ������ �� �ϼ�/Ȯ���Ͽ� ������ �� �ִ�.
--  DML, TCL �ܿ��� DDL, DCL, TCL ����� �����ϴ�


------------------------------------------------------------------------------------


--���� PROCEDURE(���ν���) ����--

-- 1. PL/SQL ���� ���� ��ǥ���� ������ ������ ���ν�����
--    �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--    �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
--    �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó�����ִ� �����̴�.

-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[( �Ű����� IN ������Ÿ��
    , �Ű����� OUT ������Ÿ��
    , �Ű����� INOUT ������Ÿ��
)]
IS
    [-- �ֿ亯�� ����;]
BEGIN
    -- ���� ����;
    ...
    [EXCEPTION
        -- ���� ó�� ����;]
END;
*/


--�� FUNCTION �� ������ ��...
--   ��RETURN ��ȯ�ڷ����� �κ��� �������� ������,
--   ��RETURN���� ��ü�� �������� ������,
--   ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������ 
--   IN, OUT, INOUT ���� ���еȴ�.


-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2)];
*/


--�� INSERT ���� ������ ���ν����� �ۼ� (INSERT ���ν���)

-- �ǽ� ���̺� ���� (TBL_STUDENTS) �� 20210408_04_scott.sql ����
-- �ǽ� ���̺� ����(TBL_IDPW) �� 20210408_04_scott.sql ����

-- ���ν��� ����
-- ���ν����� : PRC_STUDENTS_INSERT(���̵�, �н�����, �̸�, ��ȭ��ȣ, �ּ�)

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID      IN TBL_STUDENTS.ID%TYPE         --IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE    
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
    -- �ֿ� ���� ���� -> �ʿ� X
BEGIN
    -- TBL_IDPW ���̺��� ������ �Է�
    INSERT INTO TBL_IDPW(ID,PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS ���̺��� ������ �Է�
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_STUDENTS_INSERT��(��) �����ϵǾ����ϴ�.




-- �ǽ� ���̺� ����(TBL_SUNGJUK) �� 20210408_04_scott.sql ����
--�� ������ �Է� ��
--   Ư�� �׸��� ������ (�й�, �̸�, ��������, ��������, ��������) �� �Է��ϸ�
--   ���������� ����, ���, ��� �׸��� �Բ� �Է� ó�� �� �� �ֵ��� �ϴ�
--   ���ν����� �ۼ��Ѵ�. (�����Ѵ�)
--   ���ν����� : PRC_SUNJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1,'������',90,80,70);

���ν��� ȣ��� ó���� ��� )
�й�  �̸�  ��������    ��������    ��������    ����  ���  ���
 1    ������   90          80          70      240    80   B
*/


CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
(
    V_HAKBUN    IN  TBL_SUNGJUK.HAKBUN%TYPE
    , V_NAME    IN  TBL_SUNGJUK.NAME%TYPE
    , V_KOR     IN  TBL_SUNGJUK.KOR%TYPE
    , V_ENG     IN  TBL_SUNGJUK.ENG%TYPE
    , V_MAT     IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    -- INSERT �������� �����ϴµ� �ʿ��� �ֿ� ���� ����
    V_TOT      TBL_SUNGJUK.TOT%TYPE;
    V_AVG      TBL_SUNGJUK.AVG%TYPE;
    V_GRADE    TBL_SUNGJUK.GRADE%TYPE;

BEGIN
    -- �Ʒ��� �������� �����ϱ� ���ؼ���
    -- ������ �����鿡 ���� ��Ƴ��� �Ѵ� (V_TOT, V_AVG, V_GRADE)
    V_TOT := V_KOR+V_ENG+V_MAT;
    V_AVG := V_TOT/3;
    
    IF V_AVG >= 90
        THEN V_GRADE := 'A';
    ELSIF V_AVG >= 80
        THEN V_GRADE := 'B';
    ELSIF V_AVG >= 70 
        THEN V_GRADE := 'C';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- ���� ����
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    
    --Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.




--�� TBL_SUNGJUK ���̺�����
--   Ư�� �л��� ���� (�й�, ��������, ��������, ��������)
--   ������ ���� �� ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�
--   ���ν����� : PRC_SUNGJUK_UPDATE
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(1,50,50,50);

���ν��� ȣ��� ó���� ���)
�й�  �̸�  ��������    ��������    ��������    ����  ���  ���
 1    ������   50          50          50      150    50   F
*/

CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
(
    V_HAKBUN    IN TBL_SUNGJUK.HAKBUN%TYPE
    , V_KOR       IN TBL_SUNGJUK.KOR%TYPE
    , V_ENG       IN TBL_SUNGJUK.ENG%TYPE
    , V_MAT       IN TBL_SUNGJUK.MAT%TYPE
)
IS
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
    
BEGIN
    -- ����
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT/3 ;
    
    IF V_AVG >= 90
        THEN V_GRADE := 'A';
    ELSIF V_AVG >= 80
        THEN V_GRADE := 'B';
    ELSIF V_AVG >= 70 
        THEN V_GRADE := 'C';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    --UPDATE��
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR
        ,ENG = V_ENG
        , MAT = V_MAT
        , TOT = V_TOT
        , AVG = V_AVG
        , GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
    
    -- Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.



--�� TBL_STUDENT ���̺�����
--   ��ȭ��ȣ�� �ּ� �����͸� �����ϴ� (�����ϴ�) ���ν����� �ۼ��Ѵ�.
--   ��, ID �� PW �� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �ۼ��Ѵ�.
--   ���ν��� �� : PRC_STUDENTS_UPDATE
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '��� �ϻ�');

���ν��� ȣ��� ó���� ��� )
superman	������	010-9999-9999	��� �ϻ�
*/
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID      IN TBL_STUDENTS.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
    
BEGIN
/*
    SELECT *
    FROM TBL_STUDENTS S LEFT JOIN TBL_IDPW I 
    ON S.ID = I.ID;
*/
    
    --UPDATE�� 
    UPDATE TBL_STUDENTS
    SET TEL = V_TEL
      , ADDR = V_ADDR
    WHERE ID = V_ID
        AND (SELECT PW
             FROM TBL_IDPW
             WHERE ID = V_ID) = V_PW;
        
    -- Ŀ��
    COMMIT;

END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.









