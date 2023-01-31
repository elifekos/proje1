public  class DateTimeAssignment {
    public void diffofDate(){
        //tomorrow date
        Date varTomorrowDate=Date.newInstance(2023, 01, 13);
        system.debug('Tomorrow the date is: '+varTomorrowDate);
        //today's date
        Date varTodayDate=Date.newInstance(2023, 01, 12);
        system.debug('Today the date is: '+varTodayDate);
        //days between
        Integer numberofDays=varTodayDate.daysBetween(varTomorrowDate);
        system.debug('There is '+numberofDays+' days between '+varTodayDate+' and '+varTomorrowDate);
    }
    public void Timecheck(){
        DateTime varTomorrowDateTime=DateTime.newInstance(2023, 01, 13,07, 0, 0);
        system.debug('varTomorrowDateTime: '+varTomorrowDateTime);
        DateTime var10DaysDateTime=DateTime.newInstance(2023, 01, 23, 9,0,0);
        system.debug('var10DaysDateTime: '+var10DaysDateTime);
        long varDateTimeLong=1234987352L;
        system.debug('varDateTimeLong is : '+varDateTimeLong);
        DateTime add7Days=varTomorrowDateTime.addDays(7);
        system.debug('The result of adding 7 days to '+varTomorrowDateTime+' is: '+add7Days);
        Datetime add10Days=var10DaysDateTime.addDays(10);
        system.debug('The result of adding 10days to '+var10DaysDateTime+' is: '+add10Days);

    }
   
}