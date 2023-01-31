Map<String, Integer> marksObtainInMath= new Map<String, Integer>();
marksObtainInMath.put('0111CE112', 40);
marksObtainInMath.put('0111CE102', 19);
marksObtainInMath.put('0111CE100', 33);
marksObtainInMath.put('0111CE098', 40);

system.debug('Students Roll Number and Marks Obtain '+marksObtainInMath);

//add multiple mappings
marksObtainInMath.put('0111CE115', 38);
system.debug('updated students roll number and marks obtain: '+marksObtainInMath);

//print all student roll number
Set<string> allStudentRollNum = marksObtainInMath.keySet();
system.debug('All students roll number: '+allStudentRollNum);

//print all students marks obtain
List<Integer> allStudentMarks = marksObtainInMath.values();
system.debug(' All students marks obtain: '+allStudentMarks);

//set uniqueRollNumberSet---Roll Numbers from marksObtainInmATHS
Set<string> uniqueRollNumberSet = marksObtainInMath.keySet();
system.debug('uniqueRollNumberSet: '+uniqueRollNumberSet);

//create a list numbers----from marksobtain
List<Integer> studentsMarksList = marksObtainInMath.values();
system.debug(' Students marks obtain: '+studentsMarksList);

//optional: mark obtain<20; print the mgs(rollNumber+ ' is not qualified for next class')
for(string eachKey: uniqueRollNumberSet)
if(marksObtainInMath.get(eachKey)<20){
    system.debug(eachKey+ ' is not qualified for next class');
}

