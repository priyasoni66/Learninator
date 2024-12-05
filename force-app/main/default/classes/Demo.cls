/*List:
Definition
An ordered collection of elements that allows duplicates is a data structure designed to maintain a sequence of elements in a specific order, where each element can appear multiple times. This structure is particularly useful when the sequence or frequency of elements is significant.
*/
public class Demo {
    public static void ex1() {
        List<String> userActions = new List<String>();
        userActions.add('login');
		userActions.add('viewProfile');
		userActions.add('logout');			
        userActions.add('login');
		System.debug(userActions.get(0)); 
		userActions.remove(2); 
        System.debug(userActions.size()); 
		userActions.sort();
		System.debug(userActions);
        System.debug('-----------------------');
    }

    public static void ex2(){
        List<String> list1 = new List<String>();
        list1.add('naman');
        list1.add('aman');
        for(string l : list1){
                System.debug(l);
        }
        System.debug('-----------------------');

    }

    public static void ex3() {
        List<List<String>> nestedList = new List<List<String>>();

        List<String> list1 = new List<String>{'naman', 'aman'};
        List<String> list2 = new List<String>{'john', 'denial'};
        nestedList.add(list1);
        nestedList.add(list2);

        for (List<String> innerList : nestedList) {
            for (String element : innerList) {
                System.debug(element);
            }
        }
        System.debug('-----------------------');

    }
    public static void main(){
        ex1();
        ex2();
        ex3();
    }
}