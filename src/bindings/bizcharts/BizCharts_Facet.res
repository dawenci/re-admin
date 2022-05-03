@module("bizcharts") @react.component
external make: (
~_type: [#rect|#list|#circle|#tree|#mirror|#matrix]=?,
~fields: array<string>=?,
~eachView: ('view, 'facet)=>unit=?,
~padding: 'padding=?,
~showTitle: bool=?,
~columnTitle: 'columnTitle=?,
~rowTitle: 'rowTitle=?,
~cols: int=?,
~title: 'title=?,
~line: 'line=?,
~transpose: bool=?,
) => React.element = "Facet"
