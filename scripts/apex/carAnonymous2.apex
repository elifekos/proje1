car bm=new car();
bm.carColor='black';
bm.switchOn();
SYSTEM.DEBUG('bm-->'+bm);
system.debug('bm car color is-> '+bm.carColor);

/*car lm=new car();
lm.carColor='red';
lm.switchOn();
system.debug('lm max speed is '+ lm.maxSpeed);//This will not work bc lm.maxSpeed is private
*/
car vw=new Car();
vw.carColor='white';
vw.carName='polo';
vw.switchOn();
vw.drive();
vw.driveAtMaxSpeed();
