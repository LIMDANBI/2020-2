DATA CARS;
	SET SASHELP.CARS;

PROC MEANS DATA=FISH MAX MIN;

PROC UNIVARIATE DATA=FISH NOPRINT;
	HISTOGRAM HEIGHT / MIDPOINTS = 2 TO 19 BY 1;

PROC SGPLOT DATA=CARS;
	VBAR MAKE / GROUP=TYPE;
	TITLE "Maker frequency of cars";

PROC SGPLOT DATA=FISH;
	VBAR SPECIES; 
	TITLE "The number of each species of fish";

PROC TEMPLATE;
	DEFINE STATGRAPH pie;
	BEGINGRAPH;
	LAYOUT REGION;
	PIECHART CATEGORY=SPECIES /
		DATALABELLOCATION=OUTSIDE
		CATEGORYDIRECTION=COUNTERCLOCKWISE
		START=180 NAME="pie"; 
		DISCRETELEGEND "pie" / 
		TITLE= "percentage of each species of fish";
	ENDLAYOUT; 
	ENDGRAPH;
END;
PROC SGRENDER DATA=FISH TEMPLATE=pie;
RUN;