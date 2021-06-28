function DialogueResponses(_responseNumber){
	switch (_responseNumber)
	{
		case 0:
			break
		case 1:
			NewTextBox("You gave response A!", 0)
			break
		case 2: 
			NewTextBox("You gave response B! Any further response?", 0, ["3:Yes!", "0:No."])
			break
		case 3:
			NewTextBox("Thanks for your responses!", 0)
			break
		case 4:
			NewTextBox("Thanks!", 0)
			NewTextBox("I think I left it in that scary cave to the north east!", 0)
			global.questStatus[? "TheHatQuest"] = 1
			break
		case 5:
			NewTextBox(":(", 0)
			break
		case 6:
			PurchaseItem(activate.ITEM_TYPE, activate.ITEM_AMOUNT, activate.ITEM_COST)
			break
		default:
			break
	}
}