package controller;

import controller.action.Action;
import controller.action.CheckIdAction;
import controller.action.CommunityFormAction;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.L_SortRentFormAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;
import controller.action.LogoutAction;
import controller.action.M_SortRentFormAction;
import controller.action.MainAction;
import controller.action.RentalAction;
import controller.action.RentalFormAction;
import controller.action.S_SortRentFormAction;

// Factory Method(����)
public class ActionFactory {

	// �̱��� singletone
	private ActionFactory(){}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	// command pattern(����)
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("login")) {
			action = new LoginAction();
		}
		else if(command.equals("loginForm")) {
			action = new LoginFormAction();
		}
		else if(command.equals("checkId")) {
			action = new CheckIdAction();
		}
		else if(command.equals("joinForm")) {
			action = new JoinFormAction();
		}
		else if(command.equals("join")) {
			action = new JoinAction();
		} 
		else if(command.equals("logout")) {
			action = new LogoutAction();
		}
		else if(command.equals("main")) {
			action = new MainAction();
		}
		else if(command.equals("rental")) {
			action = new RentalAction();
		}
		else if(command.equals("rentalForm")) {
			action = new RentalFormAction();
		}
		else if(command.equals("communityForm")) {
			action = new CommunityFormAction();
		}
		else if(command.equals("S_SortRent")) {
			action = new S_SortRentFormAction();
		}
		else if(command.equals("M_SortRent")) {
			action = new M_SortRentFormAction();
		}
		else if(command.equals("L_SortRent")) {
			action = new L_SortRentFormAction();
		}
		// ....
		
		return action;
	}
}
