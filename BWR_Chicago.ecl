IMPORT $,STD;

Chicago := $.File_Chicago.File;

// profileResults := STD.DataPatterns.Profile(Chicago);
bestrecord     := STD.DataPatterns.BestRecordStructure(Chicago);

// OUTPUT(profileResults, ALL, NAMED('profileResults'));
OUTPUT(bestrecord, ALL, NAMED('BestRecord'));