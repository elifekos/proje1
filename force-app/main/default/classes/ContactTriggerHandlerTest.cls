@IStEST
public class ContactTriggerHandlerTest {
    @IStEST
    PRIVATE STATIC VOID testUpdate() {
        contact c1 = new contact();
        c1.LastName = 'test contact';
        c1.LeadSource ='Web';
        insert c1;

        try{
            c1.LeadSource ='Phone';
            update c1;
        }catch(Exception ex){
            system.debug(ex.getMessage());
            //assert that error is field custom validation
            assert.isTrue(ex.getMessage().containsAny('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }

    }
}