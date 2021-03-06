SELECT USER
FROM DUAL;
--==>> SCOTT


--�� TBL_JUMUNBACKUP ���̺��� TBL_JUMUN ���̺�����
--   ��ǰ�ڵ�� �ֹ����� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ�Ѵ�.

-- ���1.

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>> 
/*
����Ĩ	30
��Ŭ	    10
ĭ��	    20
��īĨ	40
Ȩ����	50
*/

SELECT JECODE, JUSU, JUNO, JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU, JUNO, JUDAY
FROM TBL_JUMUN;
--==>> ��ȸ ��� ����
-->> 4 �׸��� ��� ���� �ֵ��� ���� (�װ��� ã����� ������ �ƴ�)

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT T2.JUNO "�ֹ���ȣ", T1.JECODE "��ǰ�ڵ�", T1.JUSU "�ֹ�����", T2.JUDAY "�ֹ�����"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN 
(
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE 
AND T1.JUSU = T2.JUSU;
--==>>
/*
2	    ��Ŭ  	10	2001-11-01 09:23:37
3	    ����Ĩ	30	2001-11-01 11:41:00
5	    Ȩ����	50	2001-11-03 15:50:00
8	    ��īĨ	40	2001-11-13 09:41:14
10	    ĭ��  	20	2001-11-20 14:17:00
938767	��Ŭ  	10	2021-04-01 14:31:09
938768	Ȩ����	50	2021-04-01 14:31:11
938769	����Ĩ	30	2021-04-01 14:31:13
938772	��īĨ	40	2021-04-01 14:31:20
938774	ĭ��	    20	2021-04-01 14:31:24
*/
-->> �������Ͽ� ã�� �ʿ��� ������ �ֵ�� ����


-- ���2.
SELECT *
FROM
(
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUN
) T
WHERE JECODE IN ('��Ŭ', '����Ĩ', 'Ȩ����', '��īĨ', 'ĭ��')
  AND JUSU IN (10, 30, 50, 40, 20);
-->> OR�̶� () �ȿ��ִ�

SELECT *
FROM
(
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUN
) T
-- WHERE JECODE||JUSU IN ('��Ŭ10', '����Ĩ30', 'Ȩ����50', '��īĨ40', 'ĭ��20');
-- WHERE CONCAT(JECODE,JUSU) IN ('��Ŭ10', '����Ĩ30', 'Ȩ����50', '��īĨ40', 'ĭ��20');
WHERE CONCAT(JECODE,JUSU) =ANY ('��Ŭ10', '����Ĩ30', 'Ȩ����50', '��īĨ40', 'ĭ��20');

SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;

SELECT *
FROM
(
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU, JUNO, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(JECODE,JUSU) =ANY (SELECT CONCAT(JECODE, JUSU)
                                FROM TBL_JUMUNBACKUP
                                INTERSECT
                                SELECT CONCAT(JECODE, JUSU)
                                FROM TBL_JUMUN
                                );
--==>>
/*
��Ŭ  	10	2	    2001-11-01 09:23:37
����Ĩ	30	3	    2001-11-01 11:41:00
Ȩ����	50	5	    2001-11-03 15:50:00
��īĨ	40	8	    2001-11-13 09:41:14
ĭ��  	20	10	    2001-11-20 14:17:00
��Ŭ  	10	938767	2021-04-01 14:31:09
Ȩ����	50	938768	2021-04-01 14:31:11
����Ĩ	30	938769	2021-04-01 14:31:13
��īĨ	40	938772	2021-04-01 14:31:20
ĭ��	    20	938774	2021-04-01 14:31:24
*/


-- MINUS : ������
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;
--==>>
/*
�˵�����Ĩ	20
��Ŭ	        10 V
����Ĩ	    30 V
Ģ��      	12
Ȩ����	    50 V
�ٳ���ű    	40
��������	    10
��īĨ	    40 V
����Ĩ	    20
ĭ��	        20 V 
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
����Ĩ	30
��Ŭ	    10
ĭ��  	20
��īĨ	40
Ȩ����	50
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
����Ĩ	    20
��������	    10
�ٳ���ű	    40
�˵�����Ĩ	20
Ģ��      	12
*/


/*
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A-B = {40,50}
*/


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- CHECK~!!!
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/
-->> �ڿ������� ���� = ����Ŭ�� �ϰ� �˾Ƽ����� (��õ�� ����)

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING(DEPTNO);
-->> DEPTNO�� ����ؼ� ��׸� �����ֶ�� �ǹ� 
--==>>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/




