Map<String,Object> inputs = new Map<String,Object>();
inputs.put('AccountId', '001Dn00000OhtfQIAR' );
inputs.put('AccountName', 'Soft Innovas');
inputs.put('AccountOwnerId', '005Dn000003wloqIAA');
inputs.put('CreatedByName', 'Elife Kos');

Flow.Interview invokeFlow = new Flow.Interview.X17_Account_Auto_Launch_Flow(inputs);
invokeFlow.start();
