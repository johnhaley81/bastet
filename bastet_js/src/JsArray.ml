(** This module provdes [Js.Array]-sepcific implementations for those who want things to compile into
    clean javascript code. You can still use {!Array} on the JS side if this doesn't matter to you. *)

open Bastet

module A = ArrayF.Make (struct
  let length = Js.Array.length

  let make n value =
    let arr = [||] in
    for _ = 1 to n do
      Js.Array.push ~value arr |> ignore
    done;
    arr

  let append a other = Js.Array.concat ~other a

  let map f = Js.Array.map ~f

  let mapi f = Js.Array.mapi ~f

  let fold_left f init = Js.Array.reduce ~f ~init

  let every f = Js.Array.every ~f

  let slice ~start ~end_ = Js.Array.slice ~start ~end_
end)

include A
