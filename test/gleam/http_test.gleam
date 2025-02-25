import gleam/dynamic.{DecodeError}
import gleam/string_builder
import gleam/string
import gleam/uri.{Uri}
import gleam/http.{Http, Https}
import gleam/option.{None, Some}
import gleam/result

fn should_equal(a: t, b: t) {
  assert True = a == b
}

pub fn parse_method_test() {
  "Connect"
  |> http.parse_method
  |> should_equal(Ok(http.Connect))

  "CONNECT"
  |> http.parse_method
  |> should_equal(Ok(http.Connect))

  "connect"
  |> http.parse_method
  |> should_equal(Ok(http.Connect))

  "Delete"
  |> http.parse_method
  |> should_equal(Ok(http.Delete))

  "DELETE"
  |> http.parse_method
  |> should_equal(Ok(http.Delete))

  "delete"
  |> http.parse_method
  |> should_equal(Ok(http.Delete))

  "Get"
  |> http.parse_method
  |> should_equal(Ok(http.Get))

  "GET"
  |> http.parse_method
  |> should_equal(Ok(http.Get))

  "get"
  |> http.parse_method
  |> should_equal(Ok(http.Get))

  "Head"
  |> http.parse_method
  |> should_equal(Ok(http.Head))

  "HEAD"
  |> http.parse_method
  |> should_equal(Ok(http.Head))

  "head"
  |> http.parse_method
  |> should_equal(Ok(http.Head))

  "Options"
  |> http.parse_method
  |> should_equal(Ok(http.Options))

  "OPTIONS"
  |> http.parse_method
  |> should_equal(Ok(http.Options))

  "options"
  |> http.parse_method
  |> should_equal(Ok(http.Options))

  "Patch"
  |> http.parse_method
  |> should_equal(Ok(http.Patch))

  "PATCH"
  |> http.parse_method
  |> should_equal(Ok(http.Patch))

  "patch"
  |> http.parse_method
  |> should_equal(Ok(http.Patch))

  "Post"
  |> http.parse_method
  |> should_equal(Ok(http.Post))

  "POST"
  |> http.parse_method
  |> should_equal(Ok(http.Post))

  "post"
  |> http.parse_method
  |> should_equal(Ok(http.Post))

  "Put"
  |> http.parse_method
  |> should_equal(Ok(http.Put))

  "PUT"
  |> http.parse_method
  |> should_equal(Ok(http.Put))

  "put"
  |> http.parse_method
  |> should_equal(Ok(http.Put))

  "Trace"
  |> http.parse_method
  |> should_equal(Ok(http.Trace))

  "TRACE"
  |> http.parse_method
  |> should_equal(Ok(http.Trace))

  "trace"
  |> http.parse_method
  |> should_equal(Ok(http.Trace))

  "thingy"
  |> http.parse_method
  |> should_equal(Error(Nil))
}

if erlang {
  external fn to_charlist(String) -> List(Int) =
    "unicode" "characters_to_list"

  external fn make_atom(String) -> dynamic.Dynamic =
    "gleam_http_test_helper" "atom"

  pub fn method_from_dynamic_atom_test() {
    "Connect"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Connect))

    "CONNECT"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Connect))

    "connect"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Connect))

    "Delete"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Delete))

    "DELETE"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Delete))

    "delete"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Delete))

    "Get"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Get))

    "GET"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Get))

    "get"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Get))

    "Head"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Head))

    "HEAD"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Head))

    "head"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Head))

    "Options"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Options))

    "OPTIONS"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Options))

    "options"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Options))

    "Patch"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Patch))

    "PATCH"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Patch))

    "patch"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Patch))

    "Post"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Post))

    "POST"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Post))

    "post"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Post))

    "Put"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Put))

    "PUT"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Put))

    "put"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Put))

    "Trace"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Trace))

    "TRACE"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Trace))

    "trace"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Trace))

    "thingy"
    |> make_atom
    |> http.method_from_dynamic
    |> should_equal(Error(DecodeError("HTTP method", "Atom")))
  }

  pub fn charlist_to_method_test() {
    "Connect"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Connect))

    "CONNECT"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Connect))

    "connect"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Connect))

    "Delete"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Delete))

    "DELETE"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Delete))

    "delete"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Delete))

    "Get"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Get))

    "GET"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Get))

    "get"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Get))

    "Head"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Head))

    "HEAD"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Head))

    "head"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Head))

    "Options"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Options))

    "OPTIONS"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Options))

    "options"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Options))

    "Patch"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Patch))

    "PATCH"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Patch))

    "patch"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Patch))

    "Post"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Post))

    "POST"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Post))

    "post"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Post))

    "Put"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Put))

    "PUT"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Put))

    "put"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Put))

    "Trace"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Trace))

    "TRACE"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Trace))

    "trace"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Ok(http.Trace))

    "thingy"
    |> to_charlist
    |> dynamic.from
    |> http.method_from_dynamic
    |> should_equal(Error(DecodeError("HTTP method", "List")))
  }
}

pub fn method_from_dynamic_test() {
  "Connect"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Connect))

  "CONNECT"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Connect))

  "connect"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Connect))

  "Delete"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Delete))

  "DELETE"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Delete))

  "delete"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Delete))

  "Get"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Get))

  "GET"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Get))

  "get"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Get))

  "Head"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Head))

  "HEAD"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Head))

  "head"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Head))

  "Options"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Options))

  "OPTIONS"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Options))

  "options"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Options))

  "Patch"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Patch))

  "PATCH"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Patch))

  "patch"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Patch))

  "Post"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Post))

  "POST"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Post))

  "post"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Post))

  "Put"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Put))

  "PUT"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Put))

  "put"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Put))

  "Trace"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Trace))

  "TRACE"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Trace))

  "trace"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Ok(http.Trace))

  "thingy"
  |> dynamic.from
  |> http.method_from_dynamic
  |> should_equal(Error(DecodeError("HTTP method", "String")))
}

pub fn method_to_string_test() {
  http.Connect
  |> http.method_to_string
  |> should_equal("connect")

  http.Delete
  |> http.method_to_string
  |> should_equal("delete")

  http.Get
  |> http.method_to_string
  |> should_equal("get")

  http.Head
  |> http.method_to_string
  |> should_equal("head")

  http.Options
  |> http.method_to_string
  |> should_equal("options")

  http.Patch
  |> http.method_to_string
  |> should_equal("patch")

  http.Post
  |> http.method_to_string
  |> should_equal("post")

  http.Put
  |> http.method_to_string
  |> should_equal("put")

  http.Trace
  |> http.method_to_string
  |> should_equal("trace")

  http.Other("ok")
  |> http.method_to_string
  |> should_equal("ok")

  http.Other("nope")
  |> http.method_to_string
  |> should_equal("nope")
}

pub fn req_to_uri_test() {
  let make_request = fn(scheme) -> http.Request(Nil) {
    http.Request(
      method: http.Get,
      headers: [],
      body: Nil,
      scheme: scheme,
      host: "sky.net",
      port: None,
      path: "/sarah/connor",
      query: None,
    )
  }

  http.Https
  |> make_request
  |> http.req_to_uri
  |> should_equal(Uri(
    Some("https"),
    None,
    Some("sky.net"),
    None,
    "/sarah/connor",
    None,
    None,
  ))

  http.Http
  |> make_request
  |> http.req_to_uri
  |> should_equal(Uri(
    Some("http"),
    None,
    Some("sky.net"),
    None,
    "/sarah/connor",
    None,
    None,
  ))
}

pub fn req_from_uri_test() {
  let uri =
    Uri(Some("https"), None, Some("sky.net"), None, "/sarah/connor", None, None)
  uri
  |> http.req_from_uri
  |> should_equal(Ok(http.Request(
    method: http.Get,
    headers: [],
    body: "",
    scheme: http.Https,
    host: "sky.net",
    port: None,
    path: "/sarah/connor",
    query: None,
  )))
}

pub fn redirect_test() {
  let response = http.redirect("/other")

  should_equal(303, response.status)
  should_equal(Ok("/other"), http.get_resp_header(response, "location"))
}

pub fn path_segments_test() {
  let request =
    http.Request(
      method: http.Get,
      headers: [],
      body: Nil,
      scheme: http.Https,
      host: "nostromo.ship",
      port: None,
      path: "/ellen/ripley",
      query: None,
    )

  should_equal(["ellen", "ripley"], http.path_segments(request))
}

pub fn get_query_test() {
  let make_request = fn(query) {
    http.Request(
      method: http.Get,
      headers: [],
      body: Nil,
      scheme: http.Https,
      host: "example.com",
      port: None,
      path: "/",
      query: query,
    )
  }

  let request = make_request(Some("foo=x%20y"))
  should_equal(Ok([#("foo", "x y")]), http.get_query(request))

  let request = make_request(None)
  should_equal(Ok([]), http.get_query(request))

  let request = make_request(Some("foo=%!2"))
  should_equal(Error(Nil), http.get_query(request))
}

pub fn set_query_test() {
  let request =
    http.Request(
      method: http.Get,
      headers: [],
      body: Nil,
      scheme: http.Https,
      host: "example.com",
      port: None,
      path: "/",
      query: None,
    )

  let query = [#("answer", "42"), #("test", "123")]
  let updated_request = http.set_query(request, query)
  updated_request.query
  |> should_equal(Some("answer=42&test=123"))

  let empty_query = []
  let updated_request = http.set_query(request, empty_query)
  updated_request.query
  |> should_equal(Some(""))
}

pub fn get_req_header_test() {
  let make_request = fn(headers) {
    http.Request(
      method: http.Get,
      headers: headers,
      body: Nil,
      scheme: http.Https,
      host: "example.com",
      port: None,
      path: "/",
      query: None,
    )
  }

  let header_key = "GLEAM"
  let request = make_request([#("answer", "42"), #("gleam", "awesome")])
  request
  |> http.get_req_header(header_key)
  |> should_equal(Ok("awesome"))

  let request = make_request([#("answer", "42")])
  request
  |> http.get_req_header(header_key)
  |> should_equal(Error(Nil))
}

pub fn set_req_body_test() {
  let body =
    "<html>
      <body>
        <title>Gleam is the best!</title>
      </body>
    </html>"

  let request =
    http.Request(
      method: http.Get,
      headers: [],
      body: Nil,
      scheme: http.Https,
      host: "example.com",
      port: None,
      path: "/",
      query: None,
    )

  let updated_request =
    request
    |> http.set_req_body(body)

  updated_request.body
  |> should_equal(body)
}

pub fn set_method_test() {
  let request =
    http.Request(
      method: http.Get,
      headers: [],
      body: "",
      scheme: http.Https,
      host: "example.com",
      port: None,
      path: "/",
      query: None,
    )

  let updated_request_method = http.Post
  let updated_request =
    request
    |> http.set_method(updated_request_method)

  updated_request.method
  |> should_equal(http.Post)
}

pub fn map_resp_body_test() {
  let response = http.Response(status: 200, headers: [], body: "abcd")
  let expected_updated_body = "dcba"
  let updated_response =
    response
    |> http.map_resp_body(string.reverse)

  updated_response.body
  |> should_equal(expected_updated_body)
}

pub fn map_req_body_test() {
  let request =
    http.default_req()
    |> http.set_req_body("abcd")

  let expected_updated_body = "dcba"
  let updated_request =
    request
    |> http.map_req_body(string.reverse)

  updated_request.body
  |> should_equal(expected_updated_body)
}

pub fn try_map_resp_body_test() {
  let transform = fn(_old_body) { Ok("new body") }

  let response = http.response(200)
  http.try_map_resp_body(response, transform)
  |> should_equal(Ok(http.Response(200, [], "new body")))

  // transform function which fails should propogate error
  let transform_failure = fn(_old_body) { Error("transform failure") }

  http.try_map_resp_body(response, transform_failure)
  |> should_equal(Error("transform failure"))
}

pub fn default_request_test() {
  http.default_req()
  |> should_equal(http.Request(
    method: http.Get,
    headers: [],
    body: "",
    scheme: http.Https,
    host: "localhost",
    port: None,
    path: "",
    query: None,
  ))
}

pub fn set_scheme_test() {
  let original_request = http.default_req()

  original_request.scheme
  |> should_equal(Https)

  let updated_request =
    original_request
    |> http.set_scheme(http.Http)

  // scheme should be updated
  updated_request.scheme
  |> should_equal(http.Http)
}

pub fn set_host_test() {
  let new_host = "github"
  let original_request = http.default_req()
  original_request.host
  |> should_equal("localhost")

  let updated_request =
    original_request
    |> http.set_host(new_host)

  // host should be updated
  updated_request.host
  |> should_equal(new_host)
}

pub fn set_port_test() {
  let original_request = http.default_req()

  original_request.port
  |> should_equal(None)

  let updated_request =
    original_request
    |> http.set_port(4000)

  // port should be updated
  updated_request.port
  |> should_equal(Some(4000))
}

pub fn set_path_test() {
  let new_path = "/gleam-lang"
  let original_request = http.default_req()
  original_request.path
  |> should_equal("")

  let updated_request =
    original_request
    |> http.set_path(new_path)

  // path should be updated
  updated_request.path
  |> should_equal("/gleam-lang")
}

pub fn get_resp_header_test() {
  let response =
    http.response(200)
    |> http.prepend_resp_header("x-foo", "x")
    |> http.prepend_resp_header("x-BAR", "y")

  http.get_resp_header(response, "x-foo")
  |> should_equal(Ok("x"))

  http.get_resp_header(response, "X-Foo")
  |> should_equal(Ok("x"))

  http.get_resp_header(response, "x-baz")
  |> should_equal(Error(Nil))

  response.headers
  |> should_equal([#("x-bar", "y"), #("x-foo", "x")])
}

pub fn resp_body_test() {
  let response =
    http.response(200)
    |> http.set_resp_body("Hello, World!")

  response.body
  |> should_equal("Hello, World!")
}

pub fn scheme_to_string_test() {
  http.Http
  |> http.scheme_to_string
  |> should_equal("http")

  http.Https
  |> http.scheme_to_string
  |> should_equal("https")
}

pub fn scheme_from_string_test() {
  "http"
  |> http.scheme_from_string
  |> should_equal(Ok(http.Http))

  "https"
  |> http.scheme_from_string
  |> should_equal(Ok(http.Https))

  "ftp"
  |> http.scheme_from_string
  |> should_equal(Error(Nil))
}

pub fn prepend_req_header_test() {
  let headers = []
  let request =
    http.Request(
      method: http.Get,
      headers: headers,
      body: Nil,
      scheme: http.Https,
      host: "example.com",
      port: None,
      path: "/",
      query: None,
    )
    |> http.prepend_req_header("answer", "42")

  request.headers
  |> should_equal([#("answer", "42")])

  let request =
    request
    |> http.prepend_req_header("gleam", "awesome")

  // request should have two headers now
  request.headers
  |> should_equal([#("gleam", "awesome"), #("answer", "42")])
}

pub fn get_req_cookies_test() {
  http.default_req()
  |> http.prepend_req_header("cookie", "k1=v1; k2=v2")
  |> http.get_req_cookies()
  |> should_equal([#("k1", "v1"), #("k2", "v2")])

  // Standard Header list syntax
  http.default_req()
  |> http.prepend_req_header("cookie", "k1=v1, k2=v2")
  |> http.get_req_cookies()
  |> should_equal([#("k1", "v1"), #("k2", "v2")])

  // Spread over multiple headers
  http.default_req()
  |> http.prepend_req_header("cookie", "k2=v2")
  |> http.prepend_req_header("cookie", "k1=v1")
  |> http.get_req_cookies()
  |> should_equal([#("k1", "v1"), #("k2", "v2")])

  http.default_req()
  |> http.prepend_req_header("cookie", " k1  =  v1 ; k2=v2 ")
  |> http.get_req_cookies()
  |> should_equal([#("k1", "v1"), #("k2", "v2")])

  http.default_req()
  |> http.prepend_req_header("cookie", "k1; =; =123")
  |> http.get_req_cookies()
  |> should_equal([])

  http.default_req()
  |> http.prepend_req_header("cookie", "k\r1=v2; k1=v\r2")
  |> http.get_req_cookies()
  |> should_equal([])
}

pub fn set_req_cookies_test() {
  let request =
    http.default_req()
    |> http.set_req_cookie("k1", "v1")

  request
  |> http.get_req_header("cookie")
  |> should_equal(Ok("k1=v1"))

  request
  |> http.set_req_cookie("k2", "v2")
  |> http.get_req_header("cookie")
  |> should_equal(Ok("k1=v1; k2=v2"))
}

pub fn get_resp_cookies_test() {
  let empty =
    http.CookieAttributes(
      max_age: None,
      domain: None,
      path: None,
      secure: False,
      http_only: False,
      same_site: None,
    )

  http.response(200)
  |> http.set_resp_cookie("k1", "v1", empty)
  |> http.get_resp_cookies
  |> should_equal([#("k1", "v1")])

  let secure_with_attributes =
    http.CookieAttributes(
      max_age: Some(100),
      domain: Some("domain.test"),
      path: Some("/foo"),
      secure: True,
      http_only: True,
      same_site: None,
    )

  http.response(200)
  |> http.set_resp_cookie("k1", "v1", secure_with_attributes)
  |> http.get_resp_cookies
  |> should_equal([
    #("k1", "v1"),
    #("Max-Age", "100"),
    #("Domain", "domain.test"),
    #("Path", "/foo"),
  ])

  // no response cookie
  http.response(200)
  |> http.prepend_resp_header("k1", "v1")
  |> http.get_resp_cookies
  |> should_equal([])
}

pub fn set_resp_cookie_test() {
  let empty =
    http.CookieAttributes(
      max_age: None,
      domain: None,
      path: None,
      secure: False,
      http_only: False,
      same_site: None,
    )
  http.response(200)
  |> http.set_resp_cookie("k1", "v1", empty)
  |> http.get_resp_header("set-cookie")
  |> should_equal(Ok("k1=v1"))

  http.response(200)
  |> http.set_resp_cookie("k1", "v1", http.cookie_defaults(Http))
  |> http.get_resp_header("set-cookie")
  |> should_equal(Ok("k1=v1; Path=/; HttpOnly"))

  let secure =
    http.CookieAttributes(
      max_age: Some(100),
      domain: Some("domain.test"),
      path: Some("/foo"),
      secure: True,
      http_only: True,
      same_site: Some(http.Strict),
    )
  http.response(200)
  |> http.set_resp_cookie("k1", "v1", secure)
  |> http.get_resp_header("set-cookie")
  |> should_equal(Ok(
    "k1=v1; Max-Age=100; Domain=domain.test; Path=/foo; Secure; HttpOnly; SameSite=Strict",
  ))
}

pub fn expire_resp_cookie_test() {
  http.response(200)
  |> http.expire_resp_cookie("k1", http.cookie_defaults(Http))
  |> http.get_resp_header("set-cookie")
  |> should_equal(Ok(
    "k1=; Expires=Thu, 01 Jan 1970 00:00:00 GMT; Max-Age=0; Path=/; HttpOnly",
  ))
}

pub fn get_req_origin_test() {
  let origin = "http://example.com/"
  let referer = "http://example.com/elixir"

  // with 'origin' header
  http.default_req()
  |> http.prepend_req_header("origin", origin)
  |> http.prepend_req_header("referer", referer)
  |> http.get_req_origin
  |> should_equal(Ok("http://example.com/"))

  // without 'origin' header
  http.default_req()
  |> http.prepend_req_header("referer", referer)
  |> http.get_req_origin
  |> should_equal(Ok("http://example.com/"))

  // with neither 'origin' nor 'referer' headers
  http.default_req()
  |> http.get_req_origin
  |> should_equal(Error(Nil))

  // with bad 'referer' header - no scheme
  http.default_req()
  |> http.prepend_req_header("referer", "example.com")
  |> http.get_req_origin
  |> should_equal(Error(Nil))

  // with bad 'referer' header - no host
  http.default_req()
  |> http.prepend_req_header("referer", "ftp://")
  |> http.get_req_origin
  |> should_equal(Error(Nil))
}
