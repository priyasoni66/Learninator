// Assign-308

public class TempConverter {
    public static void cal(Double fahrenheit) {
        Double celsius = (fahrenheit - 32) * 5 / 9;
        System.debug('Fahrenheit: ' + fahrenheit);
        System.debug('Celsius: ' + celsius);
    }
}