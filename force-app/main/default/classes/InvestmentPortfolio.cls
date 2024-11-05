// Assign-332

public class InvestmentPortfolio {
    public static void cal(Double initialInvestment, Date invStartDate, String marCondition, String riskTolerance){
        Double portfolio = initialInvestment;
        if(marCondition.equals('Bull') && riskTolerance.equals('High')){
            portfolio = portfolio + (portfolio * 15/100);
        }
        if(marCondition.equals('Bear') && riskTolerance.equals('Low')){
            portfolio = portfolio - (portfolio * 10/100);
        }
        Date currentDate = Date.today();
        if(invStartDate.addYears(5) < currentDate){
        	portfolio = portfolio + (portfolio * 5/100);
        }
        System.debug('Initial Investment: ' + initialInvestment);
        System.debug('Risk Tolerance: ' + riskTolerance);
        System.debug('Market Condition: ' + marCondition);
        System.debug('Final Portfolio Value: ' + portfolio);
    }
}