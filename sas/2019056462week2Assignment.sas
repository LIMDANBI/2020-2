DATA score1;
	INFILE "/folders/myfolders/score1.txt";
	INPUT GEN$ KOR MAT ENG SCI;

DATA score2;
	INFILE "/folders/myfolders/score2.txt";
	INPUT GEN$ KOR MAT ENG SCI;

DATA scores;
	SET score1 score2;
	TOTAL = KOR*2 + MAT*4 + ENG*2 + SCI*2;
	IF TOTAL >= 800 THEN NOTE = "GREAT";
	ELSE IF TOTAL >= 600 THEN NOTE = "GOOD";
	ELSE IF TOTAL >= 400 THEN NOTE = "OK";
	ELSE NOTE = "FAIL";

DATA M_T_N;
	SET scores;
	KEEP MAT TOTAL NOTE;
	
	
