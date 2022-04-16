module B = PrintBox

let box =
  B.(
    vlist
      [
        line_with_style Style.(set_bold true @@ bg_color Green) "OH!";
        grid_text
          [|
            [| "TimeStamp"; "bbb" |];
            [| "Nonce"; "hello world" |];
            [| "Transactions"; "hello world\nhello world\nhello world" |];
            [| "Code Result"; "hello world\nhello world\nhello world" |];
            [| "Quiries"; "hello world\nhello world\nhello world" |];
            [| "Previous Hash"; "hello world\nhello world\nhello world" |];
            [| "Hash"; "hello world\nhello world\nhello world" |];
          |];
      ])
  |> B.frame
;;

(* PrintBox_text.output stdout box *)
Type.Test.test ()
