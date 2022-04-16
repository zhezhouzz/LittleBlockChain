type transaction = { t_from : string; t_to : string; t_amount : int }

type contract = { c_id : string; c_value : string }

type hash = string

type header = {
  index : int;
  nonce : int;
  transaction_data : transaction list;
  code_result : contract list;
  prevhash : hash;
}

type t = { header : header; currhash : hash; timestamp : string }

type chain = t list
