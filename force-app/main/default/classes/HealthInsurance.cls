public class HealthInsurance {    
    public static void calculatePremium(Integer age, String coverageType, Boolean hasChronicIllness, Date policyStartDate) {
        Decimal basePremium = 1000;
        Decimal finalPremium = basePremium;
        
        if (age > 60) {
            finalPremium += basePremium * 0.25; 
            System.debug('25% surcharge for age above 60 applied.');
        }
        
        if (coverageType == 'Comprehensive') {
            finalPremium += basePremium * 0.20; 
            System.debug('20% surcharge for comprehensive coverage applied.');
        }
        
        if (hasChronicIllness) {
            finalPremium += basePremium * 0.15; 
            System.debug('15% surcharge for chronic illness applied.');
        }

        if (Date.today().daysBetween(policyStartDate) > 30) {
            finalPremium -= basePremium * 0.10; 
            System.debug('10% discount for purchasing more than 30 days in advance applied.');
        }

        System.debug('Base Premium: ' + basePremium);
        System.debug('Final Premium after surcharges and discounts: ' + finalPremium);
    }
}