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
import controller.action.boardUpdateAction;
import controller.action.boardUpdateFormAction;
import controller.action.boardViewFormAction;
import controller.action.boardWriteAction;
import controller.action.boardWriteFormAction;
import controller.action.carAllListAction;
import controller.action.carCategoryListAction;
import controller.action.carReserveInfoAction;


// Factory Method(积己)
public class ActionFactory {

	// 教臂沛 singletone
	private ActionFactory(){}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	// command pattern(青困)
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
		else if(command.equals("boardView")) {
			action = new boardViewFormAction();
		}
		else if(command.equals("boardUpdate")) {
			action = new boardUpdateAction();
		}
		else if(command.equals("boardUpdateForm")) {
			action = new boardUpdateFormAction();
		}
		else if(command.equals("boardWriteForm")) {
			action = new boardWriteFormAction();
		}
		else if(command.equals("boardWrite")) {
			action = new boardWriteAction();
		}
		else if(command.equals("carCategoryList")) {
			action = new carCategoryListAction();
		}
		else if(command.equals("carAllList")) {
			action = new carAllListAction();
		}
		else if(command.equals("carReserveInfo")) {
			action = new carReserveInfoAction();
		}
		
		
		
		// ....
		return action;
	}
}
