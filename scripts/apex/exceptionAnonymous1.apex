TRY{
  ACCOUNT a = NEW ACCOUNT();
  a.Name ='try catch acc';
INSERT a;  
}catch(DmlException dmlex){
    system.debug('dml went wrong buddy.:( ');
}catch(Exception ex){
    system.debug('Something went wrong buddy');
}finally {
    //this will run if catches or not so; it will run if it catches an error or 
    system.debug('this will always run. ');
}


system.debug('Apex is SIMPLE');
