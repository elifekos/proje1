public with sharing class SoapCallouts {
    public static string[] parksCallout(string country) {
        ParksServices.ParksImplPort parkService = new ParksServices.ParksImplPort();
        string[] parks = parkService.byCountry(country);
        return parks;

    }
    public static Double doAddCallout(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort calcService = new  CalculatorServices.CalculatorImplPort();
        Double result = calcService.doAdd(num1, num2);
        system.debug(result);
        return result;

    }
    PUBLIC STATIC Double doDivideCallout(Double num1, Double num2){
        CalculatorServices.CalculatorImplPort calcService = new  CalculatorServices.CalculatorImplPort();
        Double result = calcService.doDivide(num1, num2);
        system.debug(result);
        return result;


    }
}