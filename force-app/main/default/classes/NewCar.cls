public class NewCar {
    integer currentSpeed=0;
    string carType;
    string carName;
    public void startCar(string carType ,string carName){
        system.debug('Car properties:Type is '+carType+', and Car name is  '+carName);

    }
    public void accelerate(integer x){
      currentSpeed=x+1;
       system.debug('Speed is : '+ currentSpeed);
    }
    public void brake(integer y){
        currentSpeed=y-1;
        system.debug('Speed is : '+ currentSpeed);

    }
    public void stopCar(){
        currentSpeed=0;
        system.debug('Speed is: '+ currentSpeed);

    }
    public void checkSpeed(){
        if( currentSpeed >=0 &&  currentSpeed<=30){
            system.debug(currentSpeed+' :City Mode ');
        } else if (currentSpeed>=31 && currentSpeed<=60) {
            system.debug(currentSpeed+' :Economy Mode ');
        } else if(currentSpeed>=60){
            system.debug(currentSpeed+ ' :SportsMode');
        }
    }



}