string[]parks = SoapCallouts.parksCallout('United States');
system.debug(parks);

string[]parks = SoapCallouts.parksCallout('Canada');
system.debug(parks);

string[]parks = SoapCallouts.parksCallout('Sweden');
system.debug(parks);

Double result = SoapCallouts.doAddCallout(20.5D, 30.4D);

SoapCallouts.doDivideCallout(34.5D, 21.6D);