public  class PrimitiveDataTypeDemo {
    public void printBasicDataType(){
        String batchName='Batch 13';
        integer totalCandidates=50;
        boolean isAdminCompleted=true;
        String batchDescription=batchName+ '  are the best, yess?';
        System.debug(batchDescription);
        System.debug('total candidates '+totalCandidates);
        Decimal dec=55.49;
        System.debug('decimal value=> '+dec);

        Long lng=15498464L;
        System.debug('long value=> '+lng);
        Object obj1='this is string';
        Object obbj2=true;
        System.debug('obj1 value=> '+obj1);

        Id conId='001Dn00000B9PKIIA3';
        System.debug('id is '+conId);
    }
}
