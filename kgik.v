
(* First, let us define human. *)
Inductive Sex := male | female.

Definition other (s: Sex) :=
  match s with
    | male => female
    | female => male
  end.

(* No two humans are born at the same time, therefore we can
 * identify a human by the last one born before him/her. *)
Inductive Human : Set := 
  | Adam : Human (* According to the Bible. *)
  | S : Human -> Human.

(* Under most circumstances, the sex of a human never changes.
 * TODO: The sex might change. *)
Axiom sexOfHuman: Human -> Sex.

(* Define 女の子. 
 * TODO: take 男の娘 and sexual minority into account.
 * TODO: take 非実在少女 (fictional characters) into account. *)
Definition isHumanGirl (h: Human) :=
  sexOfHuman h = female : Prop.

(* Define 可愛い by the subject and the observer. *)
Axiom isHumanKawaii: Human -> Human -> Prop.

(* Now let's prove KGiK. *)
Theorem KGiK: 
  forall (Observer: Human) (Subject: Human),
    isHumanGirl Subject
    -> isHumanKawaii Observer Subject
    -> isHumanKawaii Observer Subject.

Proof.
  intros.
  apply H0.
Qed.

