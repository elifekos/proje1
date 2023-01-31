Calculator c=new Calculator();
date ddt=date.today();
boolean lpy=c.leapYearCheck(ddt);
system.debug('today date is leap year?? '+lpy);

integer sum11=c.add(10,15,25);
system.debug('sum11 is '+sum11);

integer sum1=c.add(10,15);
system.debug('sum1 is '+sum1);
integer x=15;
integer y=45;
c.add(x,y);//we are not storing return value in a variable.
integer sum2=c.add(x,y);//we are storingikv the return value in a variable.
/*string a='1';
string b='2';
c.add(a,b);  not work bc result store da integer.
*/

string parameter1='printing this for Batch13';
string msg=c.printAndReturnMessage(parameter1);
system.debug('return message: '+msg);