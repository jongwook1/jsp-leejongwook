package util;

public class discount {

	public static void main(String[] args) {		
			int dayCount = 185;
			int monthCount = (int) Math.round(dayCount/30) ;
			int totalPrice = 1000;
			double discountA = 0.15;
			double discountB = 0.25;
			double discountC = 0.35;
			System.out.println("monthCount" + monthCount);
			if(monthCount >= 9){
				totalPrice =  (int) Math.round(totalPrice*(1-discountC));
			}
			else if(monthCount >= 6){
				totalPrice =  (int) Math.round(totalPrice*(1-discountB));
			}
			else if(monthCount >= 3){
				totalPrice =  (int) Math.round(totalPrice*(1-discountA));
			}
			
			
			System.out.println("totalPrice"+totalPrice);
		
	}

}
