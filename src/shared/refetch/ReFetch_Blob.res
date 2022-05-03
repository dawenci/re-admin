type t = Fetch.blob
@new
external makeFromStrings: (array<string>, @as(json`{type: "application/json"}`) _) => t = "Blob"

external asBlob: 'a => t = "%identity"
