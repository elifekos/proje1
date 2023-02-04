list<contact> printCont = DML2_Assign.searchForContacts('Ruffalo');
system.debug(printCont);
DML2_Assign.createBulkContacts();
DML2_Assign.insert_dml();
DML2_Assign.updating_dml();