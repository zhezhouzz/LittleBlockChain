open Block

let make_transaction a b n = { t_from = a; t_to = b; t_amount = n }

let make_contract id v = { c_id = id; c_value = v }

let make_block () =
  let () = Random.self_init () in
  let timestamp = Core.Time_ns.to_string_utc @@ Core.Time_ns.now () in
  let currhash = string_of_int @@ Core.hash_int @@ Random.int 100 in
  let header =
    {
      index = 0;
      nonce = Random.int 100;
      transaction_data =
        [
          make_transaction "A" "B" 2;
          make_transaction "B" "A" 10;
          make_transaction "A" "B" 1;
        ];
      code_result = [ make_contract "a.txt" "x" ];
      prevhash = string_of_int @@ Core.hash_int @@ Random.int 100;
    }
  in
  { header; currhash; timestamp }

let test () = Layout.print_box (make_block ())
