/*
この文書では、日本語の使い方のおかしい部分があるかも知れません。
また、句の代わり、演算子と言う用語が使われており、もし良ければご参考にしてください。
JSL46期　クォン・ヒョクジン
*/

--=======2020-10-29=======
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM SALGRADE;

DESC DEPARTMENT;

--社員番号と社員名を出力
SELECT ENO, ENAME FROM EMPLOYEE;

--算術演算(数字またはDATE形のデータタイプのみ使えるのが可能)
SELECT SALARY FROM EMPLOYEE;
SELECT SALARY + 300 FROM EMPLOYEE;
SELECT SALARY - 300 FROM EMPLOYEE;
SELECT SALARY * 12 FROM EMPLOYEE;
SELECT SALARY / 4 FROM EMPLOYEE;

--年収計算
SELECT ENAME, SALARY, SALARY*12 FROM EMPLOYEE;

--COMMISSIONを加えた年収
SELECT ENAME, SALARY, JOB, DNO, COMMISSION, SALARY*12, SALARY*12+COMMISSION FROM EMPLOYEE;

--nvl関数を使用
SELECT ENAME, SALARY, JOB, DNO, NVL(COMMISSION,0), SALARY*12, SALARY*12+NVL(COMMISSION,0) FROM EMPLOYEE;

--カラム名に別名をつける
SELECT ENAME, SALARY*12+NVL(COMMISSION,0) 年収 FROM EMPLOYEE;

--カラム名にASを追加する
SELECT ENAME, SALARY*12+NVL(COMMISSION,0) AS 年収 FROM EMPLOYEE;

--＊＊で別名をつける;
SELECT ENAME, SALARY*12+NVL(COMMISSION,0) "年　収" FROM　EMPLOYEE;

--DISTINCTで重複されたデータを一回だけ出力,
SELECT DISTINCT DNO FROM EMPLOYEE;


--=======2020-11-01=======
--DUALテーブルの構造
DESC DUAL;
SELECT ＊　FROM DUAL;

--今日の日月を出力
SELECT SYSDATE FROM DEPARTMENT;

--今日の日月を一回出力
SELECT SYSDATE FROM DUAL;


/*
WHERE
    SELECT * [coulmn1, coulmn2, .. , column]
    FROM table name
    WHERE condition;
*/

--給料(SALARY)が1500以上の社員を出力
SELECT * FROM EMPLOYEE WHERE SALARY>=1500;

--10番部署に所属している社員を出力
SELECT * FROM EMPLOYEE WHERE DNO=10;

--SCOTTをカラムと見做してエラーを発生した例(この表現合ってるかな)
--文字とDATEタイプの定数には絶対に'　'を付けること！
SELECT * FROM EMPLOYEE WHERE ENAME=SCOTT;

--名前がSCOTTの社員を出力
SELECT * FROM EMPLOYEE WHERE ENAME='SCOTT';

--入社日が(HIREDATE)'1981/01/01'以前の社員を出力
SELECT * FROM EMPLOYEE WHERE HIREDATE<='1991/01/01';

--部署番号が10で、肩書きが'MANAGER'の社員を出力
SELECT * FROM EMPLOYEE WHERE DNO=10 AND JOB='MANAGER';

--部署番号が10あるいは肩書きが'MANAGER'の社員を出力
SELECT * FROM EMPLOYEE WHERE DNO=10 OR JOB='MANAGER';

--NOTを使用した条件指定
SELECT * FROM EMPLOYEE WHERE NOT DNO=10;

--<>を使用した条件指定
SELECT * FROM EMPLOYEE WHERE DNO <> 10;

--給料が1000から1500の社員を出力
SELECT * FROM EMPLOYEE WHERE SALARY>=1000 AND SALARY<=1500;

--給料が1000未満または1500を超える社員を出力
SELECT * FROM EMPLOYEE WHERE SALARY<1000 OR SALARY>1500;

--COMMISSIONが300若しくは500または1400の社員を出力
SELECT * FROM EMPLOYEE WHERE COMMISSION=300 OR COMMISSION=500 OR COMMISSION=1400;300


/*
BETWEEN
    column_name BETWEEN A AND B
*/

--BETWEEN AND 演算子の使用
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 1000 AND 1500;

--AND論理演算子の使用
SELECT * FROM EMPLOYEE WHERE SALARY>=1000 AND SALARY<=1500;

--NOT BETWEEN AND 演算子の使用
SELECT * FROM EMPLOYEE WHERE SALARY NOT BETWEEN 1000 AND 1500;

--OR論理演算子の使用
SELECT * FROM EMPLOYEE WHERE SALARY<1000 OR SALARY>1500;

--1982年に入社した社員を出力
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';


/*
IN
    column_name IN(A, B, C)
INの中の条件が一つでも一致する値を検索
*/

--IN演算子の使用
SELECT * FROM EMPLOYEE WHERE COMMISSION IN(300,500,1400);

--OR論理演算子の使用
SELECT * FROM EMPLOYEE WHERE COMMISSION=300 OR COMMISSION=500 OR COMMISSION=1400;

--＜＞演算子の使用
SELECT * FROM EMPLOYEE WHERE COMMISSION<>300 OR COMMISSION<>500 OR COMMISSION<>1400;

--NOT IN演算子の使用
SELECT * FROM EMPLOYEE WHERE COMMISSION NOT IN(300,500,1400);
