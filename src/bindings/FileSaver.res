@module("file-saver")
external saveAs: (
  @unwrap [#Blob(Webapi.Blob.t) | #Url(string) | #File(Webapi.File.t)],
  ~filename: string=?,
  ~options: 'a=?,
  unit
) => unit = "saveAs"