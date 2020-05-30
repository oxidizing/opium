module App = App

module App_export = struct
  module App = App

  (* selectively export the most useful parts of App *)
  let param = App.param
  let splat = App.splat
  let not_found = App.not_found
  let get = App.get
  let post = App.post
  let put = App.put
  let delete = App.delete
  let all = App.all
  let any = App.any
  let middleware = App.middleware
end

module Middleware = struct
  (** Re-exports simple middleware that doesn't have auxiliary functions *)
  let debug = Debug.debug

  let trace = Debug.trace
  let static = Static_serve.m
end

module Std = struct
  module Rock = Opium_kernel.Rock
  module Response = Rock.Response
  module Request = Rock.Request
  module Router = Opium_kernel.Router
  module Route = Opium_kernel.Route
  module Middleware = Middleware
  include App_export
end

module Hmap = Opium_kernel.Hmap0
