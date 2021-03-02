proc import out = work.insurance
			datafile= "/home/u50388224/Insurance/df_model.csv"
			DBMS = csv replace;
run;

/* 0.572 p> 0.05*/
proc logistic data = insurance;
	class insured_sex(param = REF REF = 'FEMALE') 
		 agegrp(param = REF REF ='(25.0, 30.0]');
	model fraud_reported (event = 'Y') = policy_number insured_sex agegrp;
run;

/*0.587 P<0.05*/
proc logistic data = insurance;
	class incident_severity(param = REF REF = 'Trivial Dama')
		  Car_model(param = REF REF = 'Truck')
		  auto_make_country(param = REF REF ='Jan');
	model fraud_reported (event = 'Y') = auto_make_country Car_model;
run;

/* 0.807 p <0.05 */
proc logistic data = insurance;
	class incident_severity(param = REF REF = 'Trivial Dama')
		  Car_model(param = REF REF = 'Truck')
		  auto_make_country(param = REF REF ='Jan');
	model fraud_reported (event = 'Y') = auto_make_country Car_model incident_severity;
run;

/* 0.903 P < 0.05*/
proc logistic data = insurance;
	class incident_severity(param = REF REF = 'Trivial Dama')
		  insured_hobbies(param = REF REF = 'sleeping');
	model fraud_reported (event = 'Y') = incident_severity insured_hobbies;
run;

/* 0.793 P >0.05 for all claims*/
proc logistic data = insurance;
	class incident_severity(param = REF REF = 'Trivial Dama');
	model fraud_reported (event = 'Y') =injury_claim property_claim vehicle_claim incident_severity;
run;

/* 0.91  car_model p > 0.05*/
proc logistic data = insurance;
	class incident_severity(param = REF REF = 'Trivial Dama')
		  Car_model(param = REF REF = 'Truck')
		  auto_make_country(param = REF REF ='Jan')
		  insured_hobbies(param = REF REF = 'sleeping');
	model fraud_reported (event = 'Y') = auto_make_country Car_model incident_severity insured_hobbies;
run;

/* 0.91 */
/* proc logistic data = insurance; */
/* 	class incident_severity(param = REF REF = 'Trivial Dama') */
/* 		  Car_model(param = REF REF = 'Truck') */
/* 		  auto_make_country(param = REF REF ='Jan') */
/* 		  insured_hobbies(param = REF REF = 'sleeping'); */
/* 	model fraud_reported (event = 'Y') = auto_make_country  incident_severity insured_hobbies; */
/* run; */