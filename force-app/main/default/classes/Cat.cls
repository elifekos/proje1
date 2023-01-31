public  class Cat {
    public string name;
    public string color;
    //CONSTRUCTOR NAME IS SAME AS CLASS NAME
    //it does not return anything
        //we use constructor if we want to execute
        //some apex code as soon as new instance is created
    public Cat() {
       system.debug('cat constructor called.');
    }
    //we can have multiple constructors
    //provide number of parametre, or datatype of parameter are different
    public Cat(string n, string clr){
        name=n;
        color=clr;
        sleeping();
    }
   

    public void sleeping(){
        system.debug(name+' is sleeping. dnd.');
    }
}