(* creazione di un ambiente vuoto *)
let env0 = emptyenv Unbound;;

(* creazione di un dizionario vuoto *)
let emptyExpr = Dictionary(Empty);;
eval emptyExpr env0;;

(* creazione di un dizionario con valori *)
let dictExpr = Let("my_dict", Dictionary(Item("name", EString("Giovanni"), Item("matricola", Eint(123456), Empty))), Den("my_dict"));;
eval dictExpr env0;;

(* accedere a un elemento di un dizionario *)
let selectName = Let("my_dict", Dictionary(Item("name", EString("Giovanni"), Item("matricola", Eint(123456), Empty))), Select("name", Den("my_dict")));;
eval selectName env0;;

let selectMatr = Let("my_dict", Dictionary(Item("name", EString("Giovanni"), Item("matricola", Eint(123456), Empty))), Select("matricola", Den("my_dict")));;
eval selectMatr env0;;

(* inserimento *)
let insertExpr = Insert("eta", Eint(22), dictExpr);;
eval insertExpr env0;;

(* inserimento di un campo già presente *)
let insert2Expr = Insert("matricola", Eint(228800), dictExpr);;
eval insert2Expr env0;;

(* rimozione *)
let removeExpr = Remove(insertExpr, "name");;
eval removeExpr env0;;

(* clear *)
let clearExpr = Clear(removeExpr);;
eval clearExpr env0;;

(* Incremento di tutti i valori presenti in un dizionario *)
let applyExpr = ApplyOver(Fun("x", Sum(Den("x"), Eint(1))), Dictionary(Item("Primo", Eint(10), Item("Secondo", Eint(30), Empty))));;
eval applyExpr env0;;
