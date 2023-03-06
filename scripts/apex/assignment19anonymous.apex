Trigger_Map trggrMap= new Trigger_Map();
Id newProjectId = trggrMap.insertSF_Project();
system.debug('Id is: ' +newProjectId);
trggrMap.updateSF_Project('a00Dn0000070cxQIAQ', 'Updated Trigger Project');