module List = struct
  include List
  open Format

  let split_by sp f l =
    match
      List.fold_left
        (fun r x ->
          match r with
          | None -> Some (sprintf "%s" (f x))
          | Some r -> Some (sprintf "%s%s%s" r sp (f x)))
        None l
    with
    | None -> ""
    | Some r -> r

  let split_by_comma f l = split_by "," f l

  let split_by_endline f l = split_by "\n" f l
end
