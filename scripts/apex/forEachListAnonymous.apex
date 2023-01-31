List<String> listStr=new list<string>();
listStr.add('sounds good');
listStr.add('ok');
listStr.add('method');
listStr.add('clear');

String concateStr=' ';
//left side: defining new variable, which we can use inside for loop.
//new variable (eachStr), will automatically get one ....
for(string eachStr : listStr){
    System.debug(eachStr);
    concateStr += '  ||  '+ eachStr;
    //concateStr=concateStr+ '  ||  ' + eachStr;
}
system.debug(concateStr);

