module B = PrintBox
open Block
open Format
open Dt

let layout_transaction { t_from; t_to; t_amount } =
  sprintf "%s sent $%i to %s" t_from t_amount t_to

let layout_contract { c_id; c_value } =
  sprintf "id: %s, result: %s" c_id c_value

let print_box { header; currhash; timestamp } =
  let { index; nonce; transaction_data; code_result; prevhash } = header in
  let s_block = sprintf "block ##%i" index in
  let s_nonce = sprintf "%i" nonce in
  (* let s_time = Core.Time_ns.to_string @@ Core.Time_ns.now () in *)
  let s_transactions =
    List.split_by_endline layout_transaction transaction_data
  in
  let s_code_results = List.split_by_endline layout_contract code_result in
  let s_prevhash = prevhash in
  let box =
    B.frame
      B.(
        vlist
          [
            line_with_style Style.(set_bold true @@ fg_color Green) s_block;
            grid_text
              [|
                [| "TimeStamp"; timestamp |];
                [| "Nonce"; s_nonce |];
                [| "Transactions"; s_transactions |];
                [| "Code Result"; s_code_results |];
                [| "Quiries"; "" |];
                [| "Previous Hash"; s_prevhash |];
                [| "Hash"; currhash |];
              |];
          ])
  in
  PrintBox_text.output stdout box;
  Printf.printf "\n"
