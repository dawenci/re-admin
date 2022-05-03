type t

@new external make: unit => t = "FileReader"
@set external setOnload: (t, ('e) => unit) => unit = "onload"
@send external readAsArrayBuffer: (t, Webapi.File.t) => unit = "readAsArrayBuffer"
