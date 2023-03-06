public  class AccountsSchedulable implements Schedulable {
    public static void  execute(SchedulableContext sc) {
        AccountsBatch ab = new AccountsBatch();
        id batchId = Database.executeBatch(ab, 21);

    }
}