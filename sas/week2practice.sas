DATA score1;
	INFILE "/folders/myfolders/score1.txt";
	INPUT GEN$ KOR MAT ENG SCI;
	
DATA score2;
	INFILE "/folders/myfolders/score2.txt";
	INPUT GEN$ KOR MAT ENG SCI;

DATA scores;
	SET score1 score2;
	
DATA pass;
	length PASS$ 10 ;
	INFILE "/folders/myfolders/pass.txt";
	INPUT GEN$ PASS$;
	IF PASS = "합격" THEN PASS = "T";
	ELSE PASS = "F";
	
DATA score_pass;
	MERGE scores pass;
	TOTAL = KOR + MAT + ENG + SCI;
	AVG = TOTAL/4;
	IF AVG>=80 THEN PRIZE = "YES";
	ELSE PRIZE = "NO";
	
RUN;