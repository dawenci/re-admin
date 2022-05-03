@send external focus: React.element => unit = "focus"
@send external blur: React.element => unit = "blur"

module Button = {
  @module("antd/es/button/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~id: string=?,
    ~block: bool=?,
    ~danger: bool=?,
    ~disabled: bool=?,
    ~ghost: bool=?,
    ~href: string=?,
    ~htmlType: [#button | #submit | #submit]=?,
    ~icon: React.element=?,
    ~loading: 'a=?,
    ~shape: [#circle | #round]=?,
    ~size: [#large | #middle | #small]=?,
    ~_type: [#primary | #ghost | #dashed | #link | #text | #default]=?,
    ~target: string=?,
    ~onClick: ReactEvent.Mouse.t => unit=?,
    ~children: React.element=?,
  ) => React.element = "Button"
}

module Breadcrumb = {
  @module("antd/es/breadcrumb/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~itemRender: 'itemRender=?,
    ~params: 'params=?,
    ~routes: 'routes=?,
    ~separator: React.element=?,
    ~children: React.element=?,
  ) => React.element = "Breadcrumb"

  module Item = {
    @module("antd") @scope("Breadcrumb") @react.component
    external make: (
      ~className: string=?,
      ~dropdownProps: 'dropdownProps=?,
      ~href: string=?,
      ~overlay: 'overlay=?,
      ~onClick: ReactEvent.Mouse.t => unit=?,
      ~children: React.element=?,
    ) => React.element = "Item"
  }

  module Separator = {
    @module("antd") @scope("Breadcrumb") @react.component
    external make: (~children: React.element=?) => React.element = "Separator"
  }
}

module Icon = AntdIcon

module Typography = {
  @module("antd/es/typography/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (~children: React.element=?) => React.element = "Typography"

  module Text = {
    @module("antd") @scope("Typography") @react.component
    external make: (
      ~code: bool=?,
      ~copyable: 'copyable=?,
      ~delete: bool=?,
      ~disabled: bool=?,
      ~editable: 'editable=?,
      ~ellipsis: bool=?,
      ~keyboard: bool=?,
      ~mark: bool=?,
      ~onClick: ReactEvent.Mouse.t => unit=?,
      ~strong: bool=?,
      ~italic: bool=?,
      ~_type: [#secondary | #success | #warning | #danger]=?,
      ~underline: bool=?,
      ~children: React.element=?,
    ) => React.element = "Text"
  }

  module Title = {
    @module("antd") @scope("Typography") @react.component
    external make: (
      ~code: bool=?,
      ~copyable: 'copyable=?,
      ~delete: bool=?,
      ~disabled: bool=?,
      ~editable: 'editable=?,
      ~ellipsis: 'ellipsis=?,
      ~level: [#1 | #2 | #3 | #4 | #5]=?,
      ~mark: bool=?,
      ~onClick: ReactEvent.Mouse.t => unit=?,
      ~italic: bool=?,
      ~_type: [#secondary | #success | #warning | #danger]=?,
      ~underline: bool=?,
      ~children: React.element=?,
    ) => React.element = "Title"
  }

  module Paragraph = {
    @module("antd") @scope("Typography") @react.component
    external make: (
      ~code: bool=?,
      ~copyable: 'copyable=?,
      ~delete: bool=?,
      ~disabled: bool=?,
      ~editable: 'editable=?,
      ~ellipsis: 'ellipsis=?,
      ~mark: bool=?,
      ~onClick: ReactEvent.Mouse.t => unit=?,
      ~strong: bool=?,
      ~italic: bool=?,
      ~underline: bool=?,
      ~_type: [#secondary | #success | #warning | #danger]=?,
      ~children: React.element=?,
    ) => React.element = "Paragraph"
  }
}

module Divider = {
  @module("antd/es/divider/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~dashed: bool=?,
    ~orientation: [#left | #right | #center]=?,
    ~plain: bool=?,
    ~style: ReactDOM.Style.t=?,
    ~_type: [#horizontal | #vertical]=?,
    ~children: React.element=?,
  ) => React.element = "Divider"
}

module Row = {
  @module("antd/es/grid/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~children: React.element=?,
    ~style: ReactDOM.Style.t=?,
    ~className: string=?,
    ~align: [#top | #middle | #bottom]=?,
    ~gutter: 'a=?,
    ~justify: [#start | #end | #center | #"space-around" | #"space-between"]=?,
    ~wrap: bool=?,
  ) => React.element = "Row"
}

module Col = {
  @module("antd/es/grid/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~children: React.element=?,
    ~style: ReactDOM.Style.t=?,
    ~className: string=?,
    ~span: int=?,
    ~flex: 'a=?,
    ~offset: int=?,
    ~order: int=?,
    ~pull: int=?,
    ~push: int=?,
    ~xs: 'b=?,
    ~sm: 'b=?,
    ~md: 'b=?,
    ~lg: 'b=?,
    ~xl: 'b=?,
    ~xxl: 'b=?,
  ) => React.element = "Col"
}

module Layout = {
  @module("antd/es/layout/style/index.less")
  external importStyle: unit = "default"

  type props
  @obj
  external makeProps: (
    ~className: string=?,
    ~hasSider: bool=?,
    ~style: ReactDOM.Style.t=?,
    ~children: React.element=?,
    unit,
  ) => props = ""

  @module("antd")
  external make: React.component<props> = "Layout"

  module Header = {
    let makeProps = makeProps
    @module("antd") @scope("Layout")
    external make: React.component<props> = "Header"
  }

  module Content = {
    let makeProps = makeProps
    @module("antd") @scope("Layout")
    external make: React.component<props> = "Content"
  }

  module Footer = {
    let makeProps = makeProps
    @module("antd") @scope("Layout")
    external make: React.component<props> = "Footer"
  }

  module Sider = {
    @module("antd") @scope("Layout") @react.component
    external make: (
      ~className: string=?,
      ~style: ReactDOM.Style.t=?,
      ~breakpoint: [#xs | #sm | #md | #lg | #xl | #xxl]=?,
      ~collapsed: bool=?,
      ~collapsedWidth: float=?,
      ~collapsible: bool=?,
      ~defaultCollapsed: bool=?,
      ~reverseArrow: bool=?,
      ~theme: [#light | #dark]=?,
      ~trigger: React.element=?,
      ~width: 'a=?,
      ~zeroWidthTriggerStyle: Js.t<{..}>=?,
      ~onBreakpoint: 'broken => unit=?,
      ~onCollapse: ('collapsed, 't) => unit=?,
      ~children: React.element=?,
    ) => React.element = "Sider"
  }
}

module Space = {
  @module("antd/es/space/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~style: ReactDOM.Style.t=?,
    ~align: [#start | #end | #center | #baseline]=?,
    ~direction: [#vertical | #horizontal]=?,
    ~size: 'a=?,
    ~split: React.element=?,
    ~wrap: bool=?,
    ~children: React.element=?,
  ) => React.element = "Space"
}

module Affix = {
  @module("antd/es/affix/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~offsetBottom: float=?,
    ~offsetTop: float=?,
    ~target: unit => 'a=?,
    ~onChange: 'b => unit=?,
    ~children: React.element=?,
  ) => React.element = "Affix"
}

module Dropdown = {
  @module("antd/es/dropdown/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~arrow: bool=?,
    ~disabled: bool=?,
    ~destroyPopupOnHide: bool=?,
    // HTMLElement => HTMLElement
    ~getPopupContainer: 'a => 'a=?,
    // Menu | () => Menu
    ~overlay: 'b=?,
    ~overlayClassName: string=?,
    ~overlayStyle: ReactDOM.Style.t=?,
    ~placement: [#bottomLeft | #bottomCenter | #bottomRight | #topLeft | #topCenter | #topRight]=?,
    ~trigger: array<[#click | #hover | #contextMenu]>=?,
    ~visible: bool=?,
    ~onVisibleChange: bool => unit=?,
    ~children: React.element=?,
  ) => React.element = "Dropdown"

  module Button = {
    @module("antd") @scope("Dropdown") @react.component
    external make: (
      ~buttonsRender: array<React.element> => array<React.element>=?,
      ~disabled: bool=?,
      ~icon: React.element=?,
      ~overlay: 'a=?,
      ~placement: [
        | #bottomLeft
        | #bottomCenter
        | #bottomRight
        | #topLeft
        | #topCenter
        | #topRight
      ]=?,
      ~size: string=?,
      ~trigger: array<[#click | #hover | #contextMenu]>=?,
      ~_type: string=?,
      ~visible: bool=?,
      ~onClick: ReactEvent.Mouse.t => unit=?,
      ~onVisibleChange: bool => unit=?,
      ~children: React.element=?,
    ) => React.element = "Button"
  }
}

module Menu = {
  @module("antd/es/menu/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~defaultOpenKeys: array<string>=?,
    ~defaultSelectedKeys: array<string>=?,
    ~expandIcon: 'a=?,
    ~forceSubMenuRender: bool=?,
    ~inlineCollapsed: bool=?,
    ~inlineIndent: float=?,
    ~mode: [#vertical | #horizontal | #inline]=?,
    ~multiple: bool=?,
    ~openKeys: array<string>=?,
    ~overflowedIndicator: React.element=?,
    ~selectable: bool=?,
    ~selectedKeys: array<string>=?,
    ~style: ReactDOM.Style.t=?,
    ~subMenuCloseDelay: float=?,
    ~subMenuOpenDelay: float=?,
    ~theme: [#light | #dark]=?,
    ~triggerSubMenuAction: [#hover | #click]=?,
    ~onClick: {"item": 'a, "key": string, "keyPath": array<string>, "domEvent": string} => unit=?,
    ~onDeselect: {
      "item": 'a,
      "key": string,
      "keyPath": string,
      "selectedKeys": array<string>,
      "domEvent": string,
    } => unit=?,
    ~onOpenChange: array<string> => unit=?,
    ~onSelect: {
      "item": 'a,
      "key": string,
      "keyPath": string,
      "selectedKeys": array<string>,
      "domEvent": string,
    } => unit=?,
    ~children: React.element=?,
  ) => React.element = "Menu"

  module Item = {
    @module("antd") @scope("Menu") @react.component
    external make: (
      ~key: string,
      ~title: string=?,
      ~danger: bool=?,
      ~disabled: bool=?,
      ~icon: React.element=?,
      ~children: React.element=?,
    ) => React.element = "Item"
  }

  module SubMenu = {
    @module("antd") @scope("Menu") @react.component
    external make: (
      ~key: string,
      ~disabled: bool=?,
      ~icon: React.element=?,
      ~popupClassName: string=?,
      ~popupOffset: (float, float)=?,
      ~title: React.element=?,
      ~onTitleClick: {"key": string, "domEvent": string} => unit=?,
      ~children: React.element=?,
    ) => React.element = "SubMenu"
  }

  module ItemGroup = {
    @module("antd") @scope("Menu") @react.component
    external make: (~title: React.element=?, ~children: array<React.element>=?) => React.element =
      "ItemGroup"
  }

  module Divider = {
    @module("antd") @scope("Menu") @react.component
    external make: unit => React.element = "Divider"
  }
}

module PageHeader = {
  @module("antd/es/page-header/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~avatar: 'a=?,
    ~backIcon: 'b=?,
    ~breadcrumb: Js.t<{..}> => React.element=?,
    ~breadcrumbRender: ('c, 'd) => React.element=?,
    ~extra: React.element=?,
    ~footer: React.element=?,
    ~ghost: bool=?,
    ~subTitle: React.element=?,
    ~tags: 'e=?,
    ~title: React.element=?,
    ~onBack: unit => unit=?,
    ~children: React.element=?,
  ) => React.element = "PageHeader"
}

module Pagination = {
  @module("antd/es/pagination/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~current: int=?,
    ~defaultCurrent: int=?,
    ~defaultPageSize: int=?,
    ~disabled: bool=?,
    ~hideOnSinglePage: bool=?,
    ~itemRender: (int, [#page | #prev | #next], 'a) => unit=?,
    ~pageSize: int=?,
    ~pageSizeOptions: array<string>=?,
    ~responsive: bool=?,
    ~showLessItems: bool=?,
    ~showQuickJumper: 'b=?,
    ~showSizeChanger: bool=?,
    ~showTitle: bool=?,
    ~showTotal: (int, (int, int)) => unit=?,
    ~simple: bool=?,
    ~size: [#default | #small]=?,
    ~total: int=?,
    ~onChange: (int, int) => unit=?,
    ~onShowSizeChange: (int, int) => unit=?,
  ) => React.element = "Pagination"
}

module Steps = {
  @module("antd/es/steps/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~current: int=?,
    ~direction: [#horizontal | #vertical]=?,
    ~initial: int=?,
    ~labelPlacement: [#horizontal | #vertical]=?,
    ~percent: float=?,
    ~progressDot: 'a=?,
    ~responsive: bool=?,
    ~size: [#default | #small]=?,
    ~status: [#wait | #process | #finish | #error]=?,
    ~_type: [#default | #navigation]=?,
    ~onChange: int => unit=?,
  ) => React.element = "Steps"

  module Step = {
    @module("antd") @scope("Steps") @react.component
    external make: (
      ~description: React.element=?,
      ~disabled: bool=?,
      ~icon: React.element=?,
      ~status: [#wait | #process | #finish | #error]=?,
      ~subTitle: React.element=?,
      ~title: React.element=?,
    ) => React.element = "Step"
  }
}

module AutoComplete = {
  type t = React.element

  @module("antd/es/auto-complete/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~allowClear: bool=?,
    ~autoFocus: bool=?,
    ~backfill: bool=?,
    ~children: 'a=?,
    ~defaultActiveFirstOption: bool=?,
    ~defaultOpen: bool=?,
    ~defaultValue: string=?,
    ~disabled: bool=?,
    ~dropdownClassName: string=?,
    ~dropdownMatchSelectWidth: 'b=?,
    ~filterOption: 'c=?,
    ~getPopupContainer: 'd => unit=?,
    ~notFoundContent: React.element=?,
    ~_open: bool=?,
    ~options: array<{"label": string, "value": 'e}>=?,
    ~placeholder: string=?,
    ~value: 'value=?,
    ~onBlur: unit => unit=?,
    ~onChange: 'value => unit=?,
    ~onDropdownVisibleChange: 'f => unit=?,
    ~onFocus: unit => unit=?,
    ~onSearch: 'value => unit=?,
    ~onSelect: ('value, 'option) => unit=?,
  ) => t = "AutoComplete"

  @send external blur: t => unit = "blur"
  @send external focus: t => unit = "focus"
}

module Cascader = {}

module Checkbox = {
  @module("antd/es/checkbox/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~autoFocus: bool=?,
    ~checked: bool=?,
    ~defaultChecked: bool=?,
    ~disabled: bool=?,
    ~indeterminate: bool=?,
    ~onChange: ReactEvent.Form.t => unit=?,
    ~value: 'value=?,
    ~children: React.element=?,
  ) => React.element = "Checkbox"

  module Group = {
    @module("antd") @scope("Checkbox") @react.component
    external make: (
      ~defaultValue: array<string>=?,
      ~disabled: bool=?,
      ~name: string=?,
      ~options: 'options=?,
      ~value: array<string>=?,
      ~onChange: 'onChange=?,
      ~children: React.element=?,
    ) => React.element = "Group"
  }
}

module DatePicker = {}

module Form = {
  type t

  @module("antd/es/form/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~colon: bool=?,
    ~component: 'component=?,
    ~fields: 'fields=?,
    ~form: 'form=?,
    ~initialValues: 'initialValues=?,
    ~labelAlign: [#left | #right]=?,
    ~labelCol: 'labelCol=?,
    ~layout: [#horizontal | #vertical | #inline]=?,
    ~name: string=?,
    ~preserve: bool=?,
    ~requiredMark: 'requiredMark=?,
    ~scrollToFirstError: 'scrollToFirstError=?,
    ~size: [#small | #middle | #large]=?,
    ~validateMessages: 'validateMessages=?,
    ~validateTrigger: 'validateTrigger=?,
    ~wrapperCol: 'wrapperCol=?,
    ~onFieldsChange: 'onFieldsChange=?,
    ~onFinish: 'onFinish=?,
    ~onFinishFailed: 'onFinishFailed=?,
    ~onValuesChange: 'onValuesChange=?,
    ~children: React.element=?,
  ) => React.element = "Form"

  @module("antd") @scope("Form")
  external useForm: unit => (t, 'setForm) = "useForm"

  @send external getFieldError: (t, 'namepath) => array<string> = "getFieldError"
  @send external getFieldInstance: (t, 'namepath) => 'any = "getFieldInstance"
  @send external getFieldsError: (t, 'namelist) => 'fielderrors = "getFieldsError"
  @send
  external getFieldsValue: (t, 'namelist, 'meta => bool) => 'any = "getFieldsValue"
  @send external getFieldValue: (t, 'namepath) => 'any = "getFieldValue"
  @send
  external isFieldsTouched: (t, 'namelist, 'alltouched) => bool = "isFieldsTouched"
  @send external isFieldTouched: (t, 'namepath) => bool = "isFieldTouched"
  @send external isFieldValidating: (t, 'namepath) => bool = "isFieldValidating"
  @send external resetFields: (t, 'fielddatas) => unit = "resetFields"
  @send external scrollToField: (t, 'namepath, 'scrolloptions) => unit = "scrollToField"
  @send external setFields: (t, 'fielddatas) => unit = "setFields"
  @send external setFieldsValue: (t, 'values) => unit = "setFieldsValue"
  @send external submit: t => unit = "submit"
  @send external validateFields: (t, 'namelist) => Promise.t<'a> = "validateFields"

  module Item = {
    @module("antd") @scope("Form") @react.component
    external make: (
      ~colon: bool=?,
      ~dependencies: 'dependencies=?,
      ~extra: React.element=?,
      ~getValueFromEvent: 'getValueFromEvent=?,
      ~getValueProps: 'getValueProps=?,
      ~hasFeedback: bool=?,
      ~help: React.element=?,
      ~hidden: bool=?,
      ~htmlFor: string=?,
      ~initialValue: string=?,
      ~label: React.element=?,
      ~labelAlign: [#left | #right]=?,
      ~labelCol: 'labelCol=?,
      ~messageVariables: 'messageVariables=?,
      ~name: 'name=?,
      ~normalize: 'normalize=?,
      ~noStyle: bool=?,
      ~preserve: bool=?,
      ~required: bool=?,
      ~rules: 'rules=?,
      ~shouldUpdate: 'shouldUpdate=?,
      ~tooltip: 'tooltip=?,
      ~trigger: string=?,
      ~validateFirst: 'validateFirst=?,
      ~validateStatus: string=?,
      ~validateTrigger: 'validateTrigger=?,
      ~valuePropName: string=?,
      ~wrapperCol: 'wrapperCol=?,
      ~children: React.element=?,
    ) => React.element = "Item"
  }

  module List = {
    @module("antd") @scope("Form") @react.component
    external make: (
      ~initialValue: 'initialValue=?,
      ~name: 'name=?,
      ~rules: 'rules=?,
      ~children: React.element=?,
    ) => React.element = "List"

    @send external add: (React.element, 'value, int) => unit = "add"
    @send external move: (React.element, int, int) => unit = "move"
    @send external remove: (React.element, 'index) => unit = "remove"
  }

  module ErrorList = {
    @module("antd") @scope("Form") @react.component
    external make: (~errors: array<React.element>=?, ~children: React.element=?) => React.element =
      "ErrorList"
  }

  module Provider = {
    @module("antd") @scope("Form") @react.component
    external make: (
      ~onFormChange: (string, 'info) => unit=?,
      ~onFormFinish: (string, 'info) => unit=?,
      ~children: React.element=?,
    ) => React.element = "Provider"
  }
}

module Input = {
  @module("antd/es/input/style/index.less")
  external importStyle: unit = "default"

  type inputType = [
    | #button
    | #checkbox
    | #color
    | #date
    | #"datetime-local"
    | #email
    | #file
    | #hidden
    | #image
    | #month
    | #number
    | #password
    | #radio
    | #range
    | #reset
    | #search
    | #submit
    | #tel
    | #text
    | #time
    | #url
    | #week
  ]

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~name: string=?,
    ~addonAfter: React.element=?,
    ~addonBefore: React.element=?,
    ~allowClear: bool=?,
    ~bordered: bool=?,
    ~defaultValue: string=?,
    ~disabled: bool=?,
    ~id: string=?,
    ~maxLength: int=?,
    ~prefix: React.element=?,
    ~size: [#large | #middle | #small]=?,
    ~suffix: React.element=?,
    ~_type: inputType=?,
    ~value: string=?,
    ~onChange: 'e => unit=?,
    ~onPressEnter: 'f => unit=?,
    ~readOnly: bool=?,
    ~tabIndex: int=?,
    ~placeholder: string=?,
  ) => React.element = "Input"

  module Textarea = {
    @module("antd") @scope("Input") @react.component
    external make: (
      ~allowClear: bool=?,
      ~autoSize: 'a=?,
      ~bordered: bool=?,
      ~defaultValue: string=?,
      ~maxLength: int=?,
      ~showCount: 'b=?,
      ~value: string=?,
      ~onPressEnter: 'e => unit=?,
      ~onResize: {"width": float, "height": float} => unit=?,
      ~autocomplete: bool=?,
      ~autofocus: bool=?,
      ~cols: int=?,
      ~disabled: bool=?,
      ~maxlength: int=?,
      ~minlength: int=?,
      ~name: string=?,
      ~placeholder: string=?,
      ~readOnly: bool=?,
      ~required: bool=?,
      ~rows: int=?,
      ~cols: int=?,
    ) => React.element = "Textarea"
  }

  module Search = {
    @module("antd") @scope("Input") @react.component
    external make: (
      ~enterButton: 'a=?,
      ~loading: bool=?,
      ~onSearch: (string, 'e) => unit=?,
    ) => React.element = "Search"
  }

  module Group = {
    @module("antd") @scope("Input") @react.component
    external make: (~compact: bool=?, ~size: [#large | #default | #small]=?) => React.element =
      "Group"
  }

  module Password = {
    @module("antd") @scope("Input") @react.component
    external make: (
      ~iconRender: bool => React.element=?,
      ~visibilityToggle: bool=?,
      ~className: string=?,
      ~name: string=?,
      ~addonAfter: React.element=?,
      ~addonBefore: React.element=?,
      ~allowClear: bool=?,
      ~bordered: bool=?,
      ~defaultValue: string=?,
      ~disabled: bool=?,
      ~id: string=?,
      ~maxLength: int=?,
      ~prefix: React.element=?,
      ~size: [#large | #middle | #small]=?,
      ~suffix: React.element=?,
      ~_type: inputType=?,
      ~value: string=?,
      ~onChange: 'e => unit=?,
      ~onPressEnter: 'f => unit=?,
      ~readOnly: bool=?,
      ~tabIndex: int=?,
      ~placeholder: string=?,
    ) => React.element = "Password"
  }

  @send external blur: React.element => unit = "blur"
  @send external focus: React.element => unit = "focus"
}

module InputNumber = {
  @module("antd/es/input-number/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~addonAfter: React.element=?,
    ~addonBefore: React.element=?,
    ~autoFocus: bool=?,
    ~bordered: bool=?,
    ~controls: bool=?,
    ~decimalSeparator: string=?,
    ~defaultValue: float=?,
    ~disabled: bool=?,
    ~formatter: ('value, 'info) => string=?,
    ~keyboard: bool=?,
    ~max: float=?,
    ~min: float=?,
    ~parser: string => float=?,
    ~precision: float=?,
    ~readOnly: bool=?,
    ~size: [#large | #middle | #small]=?,
    ~step: 'step=?,
    ~stringMode: bool=?,
    ~value: float=?,
    ~onChange: 'value => unit=?,
    ~onPressEnter: 'e => unit=?,
    ~onStep: (float, 'info) => unit=?,
    ~children: React.element=?,
  ) => React.element = "InputNumber"

  @send external blur: React.element => unit = "blur"
  @send external focus: React.element => unit = "focus"
}

module Mentions = {}

module Radio = {
  @module("antd/es/radio/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~autoFocus: bool=?,
    ~checked: bool=?,
    ~defaultChecked: bool=?,
    ~disabled: bool=?,
    ~value: 'value=?,
    ~children: React.element=?,
  ) => React.element = "Radio"

  module Button = {
    @module("antd") @scope("Radio") @react.component
    external make: (
      ~autoFocus: bool=?,
      ~checked: bool=?,
      ~defaultChecked: bool=?,
      ~disabled: bool=?,
      ~value: 'value=?,
      ~children: React.element=?,
    ) => React.element = "Button"
  }

  module Group = {
    @module("antd") @scope("Radio") @react.component
    external make: (
      ~buttonStyle: [#outline | #solid]=?,
      ~defaultValue: 'value=?,
      ~disabled: bool=?,
      ~name: string=?,
      ~options: 'options=?,
      ~optionType: [#default | #button]=?,
      ~size: [#large | #middle | #small]=?,
      ~value: 'value=?,
      ~onChange: 'e => unit=?,
      ~children: React.element=?,
    ) => React.element = "Group"
  }
}

module Rate = {
  @module("antd/es/rate/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~allowClear: bool=?,
    ~allowHalf: bool=?,
    ~autoFocus: bool=?,
    ~character: 'character=?,
    ~className: string=?,
    ~count: int=?,
    ~defaultValue: float=?,
    ~disabled: bool=?,
    ~style: ReactDOM.Style.t=?,
    ~tooltips: array<string>=?,
    ~value: float=?,
    ~onBlur: unit => unit=?,
    ~onChange: float => unit=?,
    ~onFocus: (unit, unit, ~onHoverChange: float) => unit=?,
    ~onKeyDown: ReactEvent.Keyboard.t => unit=?,
    ~children: React.element=?,
  ) => React.element = "Rate"

  let blur = blur
  let focus = focus
}

module Select = {
  @module("antd/es/select/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~allowClear: bool=?,
    ~autoClearSearchValue: bool=?,
    ~autoFocus: bool=?,
    ~bordered: bool=?,
    ~clearIcon: React.element=?,
    ~defaultActiveFirstOption: bool=?,
    ~defaultOpen: bool=?,
    ~defaultValue: 'value=?,
    ~disabled: bool=?,
    ~dropdownClassName: string=?,
    ~dropdownMatchSelectWidth: 'dropdownMatchSelectWidth=?,
    ~dropdownRender: React.element => React.element=?,
    ~dropdownStyle: ReactDOM.Style.t=?,
    ~fieldNames: 'fieldNames=?,
    ~filterOption: 'filterOption=?,
    ~filterSort: ('a, 'a) => float=?,
    ~getPopupContainer: 'triggerNode => Dom.element=?,
    ~labelInValue: bool=?,
    ~listHeight: float=?,
    ~loading: bool=?,
    ~maxTagCount: 'maxTagCount=?,
    ~maxTagPlaceholder: 'maxTagPlaceholder=?,
    ~maxTagTextLength: 'int=?,
    ~menuItemSelectedIcon: React.element=?,
    ~mode: [#multiple | #tags]=?,
    ~notFoundContent: React.element=?,
    ~_open: bool=?,
    ~optionFilterProp: string=?,
    ~optionLabelProp: string=?,
    ~options: 'options=?,
    ~placeholder: React.element=?,
    ~removeIcon: React.element=?,
    ~searchValue: string=?,
    ~showArrow: bool=?,
    ~showSearch: bool=?,
    ~size: [#large | #middle | #small]=?,
    ~suffixIcon: React.element=?,
    ~tagRender: 'props => React.element=?,
    ~tokenSeparators: array<string>=?,
    ~value: 'value=?,
    ~virtual: bool=?,
    ~onBlur: unit => unit=?,
    ~onChange: ('value, 'option) => unit=?,
    ~onClear: unit => unit=?,
    ~onDeselect: 'a => unit=?,
    ~onDropdownVisibleChange: 'open_ => unit=?,
    ~onFocus: unit => unit=?,
    ~onInputKeyDown: 'onInputKeyDown=?,
    ~onMouseEnter: 'onMouseEnter=?,
    ~onMouseLeave: 'onMouseLeave=?,
    ~onPopupScroll: 'onPopupScroll=?,
    ~onSearch: string => 'a=?,
    ~onSelect: 'onSelect=?,
    ~children: React.element=?,
  ) => React.element = "Select"

  let blur = blur
  let focus = focus

  module Option = {
    @module("antd") @scope("Select") @react.component
    external make: (
      ~className: string=?,
      ~disabled: bool=?,
      ~title: string=?,
      ~value: 'value=?,
      ~children: React.element=?,
    ) => React.element = "Option"
  }

  module OptGroup = {
    @module("antd") @scope("Select") @react.component
    external make: (~key: string=?, ~label: 'label=?, ~children: React.element=?) => React.element =
      "OptGroup"
  }
}

module Slider = {
  @module("antd/es/slider/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~allowClear: bool=?,
    ~defaultValue: 'value=?,
    ~disabled: bool=?,
    ~dots: bool=?,
    ~getTooltipPopupContainer: 'triggerNode => Dom.element=?,
    ~included: bool=?,
    ~marks: 'marks=?,
    ~max: float=?,
    ~min: float=?,
    ~range: 'range=?,
    ~reverse: bool=?,
    ~step: Js.Nullable.t<float>=?,
    ~tipFormatter: 'value => Js.Nullable.t<React.element>=?,
    ~tooltipPlacement: string=?,
    ~tooltipVisible: bool=?,
    ~value: 'value=?,
    ~vertical: bool=?,
    ~onAfterChange: 'value => unit=?,
    ~onChange: 'value => unit=?,
    ~draggableTrack: bool=?,
  ) => React.element = "Slider"

  let blur = blur
  let focus = focus
}

module Switch = {
  @module("antd/es/switch/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~autoFocus: bool=?,
    ~checked: bool=?,
    ~checkedChildren: React.element=?,
    ~className: string=?,
    ~defaultChecked: bool=?,
    ~disabled: bool=?,
    ~loading: bool=?,
    ~size: string=?,
    ~unCheckedChildren: React.element=?,
    ~onChange: (bool, 'event) => unit=?,
    ~onClick: (bool, 'event) => unit=?,
  ) => React.element = "Switch"
}

module TimePicker = {}

module Transfer = {}

module TreeSelect = {}

module Upload = {
  @module("antd/es/upload/style/index.less")
  external importStyle: unit = "default"

  type file<'response, 'linkProps> = {
    "uid": string, // 文件唯一标识，建议设置为负数，防止和内部产生的 id 冲突
    "name": string, // 文件名
    "status": [#uploading | #done | #error | #removed], // 状态有：uploading done error removed，被 beforeUpload 拦截的文件没有 status 属性
    "response": 'response, // 服务端响应内容
    "linkProps": 'linkProps, // 下载链接额外的 HTML 属性
  }

  type uploadFile = {
    "name": string,
    "percent": float,
    "status": [#error | #success | #done | #uploading | #removed],
    "thumbUrl": string,
    "uid": string,
    "url": string,
  }

  @module("antd") @react.component
  external make: (
    ~accept: string=?,
    ~action: 'action=?,
    ~beforeUpload: ('file, 'fileList) => 'a=?,
    ~customRequest: 'customRequest=?,
    ~data: 'data=?,
    ~defaultFileList: 'defaultFileList=?,
    ~directory: bool=?,
    ~disabled: bool=?,
    ~fileList: array<uploadFile>=?,
    ~headers: 'headers=?,
    ~iconRender: (uploadFile, 'listType) => React.element=?,
    ~isImageUrl: uploadFile => bool=?,
    ~itemRender: 'itemRender=?,
    ~listType: [#text | #picture | #"picture-card"]=?,
    ~maxCount: int=?,
    ~method: string=?,
    ~multiple: bool=?,
    ~name: string=?,
    ~openFileDialogOnClick: bool=?,
    ~previewFile: 'previewFile=?,
    ~progress: 'progress=?,
    ~showUploadList: 'showUploadList=?,
    ~withCredentials: bool=?,
    ~onChange: {
      "file": file<'response, 'linkProps>,
      "fileList": array<file<'response, 'linkProps>>,
      "event": 'event,
    } => unit=?,
    ~onDrop: 'reactDragEvent=?,
    ~onDownload: 'file => unit=?,
    ~onPreview: 'file => unit=?,
    ~onRemove: 'onRemove=?,
    ~children: React.element=?,
  ) => React.element = "Upload"

  module Dragger = {
    @module("antd") @scope("Upload") @react.component
    external make: (
      ~accept: string=?,
      ~action: 'action=?,
      ~beforeUpload: ('file, 'fileList) => 'a=?,
      ~customRequest: 'customRequest=?,
      ~data: 'data=?,
      ~defaultFileList: 'defaultFileList=?,
      ~directory: bool=?,
      ~disabled: bool=?,
      ~fileList: array<uploadFile>=?,
      ~headers: 'headers=?,
      ~iconRender: (uploadFile, 'listType) => React.element=?,
      ~isImageUrl: uploadFile => bool=?,
      ~itemRender: 'itemRender=?,
      ~listType: [#text | #picture | #"picture-card"]=?,
      ~maxCount: int=?,
      ~method: string=?,
      ~multiple: bool=?,
      ~name: string=?,
      ~openFileDialogOnClick: bool=?,
      ~previewFile: 'previewFile=?,
      ~progress: 'progress=?,
      ~showUploadList: 'showUploadList=?,
      ~withCredentials: bool=?,
      ~onChange: {
        "file": file<'response, 'linkProps>,
        "fileList": array<file<'response, 'linkProps>>,
        "event": 'event,
      } => unit=?,
      ~onDrop: 'reactDragEvent=?,
      ~onDownload: 'file => unit=?,
      ~onPreview: 'file => unit=?,
      ~onRemove: 'onRemove=?,
      ~children: React.element=?,
    ) => React.element = "Dragger"
  }
}

module Avatar = {
  @module("antd/es/avatar/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~alt: string=?,
    ~gap: int=?,
    ~icon: React.element=?,
    ~shape: [#circle | #square]=?,
    ~size: 'a=?,
    ~src: 'b=?,
    ~srcSet: string=?,
    ~draggable: 'c=?,
    ~onError: unit => bool=?,
  ) => React.element = "Avatar"

  module Group = {
    @module("antd") @scope("Avatar") @react.component
    external make: (
      ~maxCount: int=?,
      ~maxPopoverPlacement: [#top | #bottom]=?,
      ~maxStyle: ReactDOM.Style.t=?,
      ~size: 'a=?,
    ) => React.element = "Group"
  }
}

module Badge = {
  @module("antd/es/badge/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~color: string=?,
    ~count: React.element=?,
    ~dot: bool=?,
    ~offset: (float, float)=?,
    ~overflowCount: int=?,
    ~showZero: bool=?,
    ~size: [#default | #small]=?,
    ~status: [#success | #processing | #default | #error | #warning]=?,
    ~text: React.element=?,
    ~title: string=?,
  ) => React.element = "Badge"

  module Ribbon = {
    @module("antd") @scope("Badge") @react.component
    external make: (
      ~color: string=?,
      ~placement: [#start | #end]=?,
      ~text: React.element=?,
    ) => React.element = "Ribbon"
  }
}

module Calendar = {
  @module("antd/es/calendar/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~dateCellRender: 'moment => React.element=?,
    ~dateFullCellRender: 'moment => React.element=?,
    ~defaultValue: 'moment=?,
    ~disabledDate: 'moment => bool=?,
    ~fullscreen: bool=?,
    ~headerRender: {
      "value": 'moment,
      "type": string,
      "onChange": unit => unit,
      "onTypeChange": unit => unit,
    } => unit=?,
    ~locale: Js.t<{..}>=?,
    ~mode: [#year | #month]=?,
    ~monthCellRender: 'moment => React.element=?,
    ~monthFullCellRender: 'moment => React.element=?,
    ~validRange: ('moment, 'moment)=?,
    ~value: 'moment=?,
    ~onChange: 'moment => unit=?,
    ~onPanelChange: ('moment, string) => unit=?,
    ~onSelect: 'moment => unit=?,
  ) => React.element = "Calendar"
}

module Card = {
  @module("antd/es/card/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~className: string=?,
    ~style: ReactDOM.Style.t=?,
    ~children: React.element=?,
    ~actions: array<React.element>=?,
    ~activeTabKey: string=?,
    ~bodyStyle: ReactDOM.Style.t=?,
    ~bordered: bool=?,
    ~cover: React.element=?,
    ~defaultActiveTabKey: string=?,
    ~extra: React.element=?,
    ~headStyle: ReactDOM.Style.t=?,
    ~hoverable: bool=?,
    ~loading: bool=?,
    ~size: [#default | #small]=?,
    ~tabBarExtraContent: React.element=?,
    ~tabList: array<{"key": string, "tab": React.element}>=?,
    ~tabProps: 'a=?,
    ~title: React.element=?,
    ~_type: string=?,
    ~onTabChange: string => unit=?,
  ) => React.element = "Card"

  module Grid = {
    @module("antd") @scope("Card") @react.component
    external make: (
      ~className: string=?,
      ~hoverable: bool=?,
      ~style: ReactDOM.Style.t=?,
    ) => React.element = "Grid"
  }

  module Meta = {
    @module("antd") @scope("Card") @react.component
    external make: (
      ~avatar: React.element=?,
      ~className: string=?,
      ~description: React.element=?,
      ~style: ReactDOM.Style.t=?,
      ~title: React.element=?,
    ) => React.element = "Meta"
  }
}

module Carousel = {
  @module("antd/es/carousel/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~autoplay: bool=?,
    ~dotPosition: string=?,
    ~dots: 'a=?,
    ~easing: string=?,
    ~effect: [#scrollx | #fade]=?,
    ~afterChange: 'current => unit=?,
    ~beforeChange: ('from, 'to) => unit=?,
  ) => React.element = "Carousel"

  @send external goTo: (React.element, int, bool) => unit = "goTo"
  @send external next: unit => unit = "next"
  @send external prev: unit => unit = "prev"
}

module Collapse = {
  @module("antd/es/collapse/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~accordion: bool=?,
    ~activeKey: 'key=?,
    ~bordered: bool=?,
    ~collapsible: [#header | #disabled]=?,
    ~defaultActiveKey: 'key=?,
    ~destroyInactivePanel: bool=?,
    ~expandIcon: 'panelProps => React.element=?,
    ~expandIconPosition: [#left | #right]=?,
    ~ghost: bool=?,
    ~onChange: unit => unit=?,
  ) => React.element = "Carousel"

  module Panel = {
    @module("antd") @scope("Carousel") @react.component
    external make: (
      ~collapsible: [#header | #disabled]=?,
      ~extra: React.element=?,
      ~forceRender: bool=?,
      ~header: React.element=?,
      ~key: 'a=?,
      ~showArrow: bool=?,
    ) => React.element = "Panel"
  }
}

module Comment = {
  @module("antd/es/comment/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~actions: array<React.element>=?,
    ~author: React.element=?,
    ~avatar: React.element=?,
    ~children: React.element=?,
    ~content: React.element=?,
    ~datetime: React.element=?,
  ) => React.element = "Comment"
}

module Descriptions = {
  @module("antd/es/descriptions/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~bordered: bool=?,
    ~colon: bool=?,
    ~column: int=?,
    ~contentStyle: ReactDOM.Style.t=?,
    ~extra: React.element=?,
    ~labelStyle: ReactDOM.Style.t=?,
    ~layout: [#horizontal | #vertical]=?,
    ~size: [#default | #middle | #small]=?,
    ~title: React.element,
  ) => React.element = "Descriptions"

  module Item = {
    @module("antd") @scope("Descriptions") @react.component
    external make: (
      ~contentStyle: ReactDOM.Style.t=?,
      ~label: React.element=?,
      ~labelStyle: ReactDOM.Style.t=?,
      ~span: int=?,
    ) => React.element = "Item"
  }
}

module Empty = {
  @module("antd/es/empty/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~description: React.element=?,
    ~image: React.element=?,
    ~imageStyle: ReactDOM.Style.t=?,
  ) => React.element = "Empty"
}

module Image = {
  @module("antd/es/image/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~alt: string=?,
    ~fallback: string=?,
    ~width: 'a=?,
    ~height: 'a=?,
    ~placeholder: React.element=?,
    ~preview: 'b=?,
    ~src: string=?,
    ~onError: 'e => unit=?,
  ) => React.element = "Image"
}

module List = {}

module Popover = {
  @module("antd/es/popover/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (~content: 'a=?, ~title: 'a=?) => React.element = "Popover"
}

module Statistic = {
  @module("antd/es/statistic/style/index.less")
  external importStyle: unit = "default"

  // TODO
  @module("antd") @react.component
  external make: (
    // string | number
    ~value: 'value,
    ~decimalSeparator: string=?,
    ~formatter: 'value => React.element=?,
    ~groupSeparator: string=?,
    ~loading: bool=?,
    ~precision: float=?,
    ~prefix: React.element=?,
    ~suffix: React.element=?,
    ~title: React.element=?,
    ~valueStyle: ReactDOM.Style.t=?,
  ) => React.element = "Statistic"

  module Countdown = {
    @module("antd") @scope("Statistic") @react.component
    external make: (
      ~format: string=?,
      ~prefix: React.element=?,
      ~suffix: React.element=?,
      ~title: React.element=?,
      // number | moment
      ~value: 'value=?,
      ~valueStyle: ReactDOM.Style.t=?,
      ~onFinish: unit => unit=?,
      ~onChange: float => unit=?,
    ) => React.element = "Countdown"
  }
}

module Table = {
  @module("antd/es/table/style/index.less")
  external importStyle: unit = "default"

  module Column = {
    type t

    @obj
    external makeProps: (
      ~align: [#left | #right | #center]=?,
      ~className: string=?,
      ~colSpan: int=?,
      ~dataIndex: 'dataIndex=?,
      ~defaultFilteredValue: array<string>=?,
      ~defaultSortOrder: [#ascend | #descend]=?,
      ~editable: bool=?,
      ~ellipsis: 'ellipsis=?,
      ~filterDropdown: 'filterDropdown=?,
      ~filterDropdownVisible: bool=?,
      ~filtered: bool=?,
      ~filteredValue: array<string>=?,
      ~filterIcon: 'filterIcon=?,
      ~filterMultiple: bool=?,
      ~filters: array<Js.t<{..}>>=?,
      ~fixed: 'fixed=?,
      ~key: string=?,
      ~render: (string, 'record, int) => React.element=?,
      ~responsive: 'responsive=?,
      ~shouldCellUpdate: ('record, 'record) => bool=?,
      ~showSorterTooltip: 'showSorterTooltip=?,
      ~sortDirections: array<[#ascend | #descend]>=?,
      ~sorter: 'sorter=?,
      ~sortOrder: 'sortOrder=?,
      ~title: 'title=?,
      ~width: 'width=?,
      ~onCell: ('record, int) => unit=?,
      ~onFilter: ('fvalue, 'record) => bool=?,
      ~onFilterDropdownVisibleChange: bool => unit=?,
      ~onHeaderCell: 'column => unit=?,
      unit,
    ) => t = ""

    @module("antd") @scope("Table")
    external make: React.component<t> = "Column"
  }

  module ColumnGroup = {
    type t
    @obj external makeProps: (~title: React.element=?) => t = ""

    @module("antd") @scope("Table")
    external make: (~title: React.element=?) => React.element = "ColumnGroup"
  }

  @module("antd") @react.component
  external make: (
    ~bordered: bool=?,
    ~columns: array<Column.t>=?,
    ~components: 'tableComponents=?,
    ~dataSource: array<'data>=?,
    ~expandable: 'expandable=?,
    ~footer: 'currentPageData => unit=?,
    ~getPopupContainer: 'triggerNode => 'htmlElemnet=?,
    ~loading: 'boolOrSpinProps=?,
    ~locale: Js.t<{..}>=?,
    ~pagination: 'pagination=?,
    ~rowClassName: ('record, int) => string=?,
    ~rowKey: 'stringFnWithRecord=?,
    ~rowSelection: Js.t<{..}>=?,
    ~scroll: Js.t<{..}>=?,
    ~showHeader: bool=?,
    ~showSorterTooltip: 'boolOrTooltipProps=?,
    ~size: [#default | #middle | #small]=?,
    ~sortDirections: array<[#ascend | #descend]>=?,
    ~sticky: 'boolOrStickyFn=?,
    ~summary: 'currentData => React.element=?,
    ~tableLayout: [#auto | #fixed]=?,
    ~title: (
      'currentPageData,
      ~onChange: (
        'pagination,
        'filters,
        'sorter,
        {"currentDataSource": array<'a>, "action": [#paginate | #sort | #filter]},
      ),
    ) => unit=?,
    ~onHeaderRow: ('columns, int) => unit=?,
    ~onRow: ('record, int) => unit=?,
  ) => React.element = "Table"
}

module Tabs = {
  @module("antd/es/tabs/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~children: React.element=?,
    ~activeKey: string=?,
    ~addIcon: React.element=?,
    ~animated: 'animated=?,
    ~centered: bool=?,
    ~defaultActiveKey: string=?,
    ~hideAdd: bool=?,
    ~moreIcon: React.element=?,
    ~renderTabBar: ('props, 'defaultTabBar) => React.element=?,
    ~size: [#large | #default | #small]=?,
    ~tabBarExtraContent: 'tabBarExtraContent=?,
    ~tabBarGutter: int=?,
    ~tabBarStyle: Js.t<{..}>=?,
    ~tabPosition: [#top | #right | #bottom | #left]=?,
    ~destroyInactiveTabPane: bool=?,
    ~_type: [#line | #card | #"editable-card"]=?,
    ~onChange: string => unit=?,
    ~onEdit: (string, 'action) => unit=?,
    ~onTabClick: (string, ReactEvent.Mouse.t) => unit=?,
    ~onTabScroll: {"direction": [#top | #right | #bottom | #left]} => unit=?,
  ) => React.element = "Tabs"

  module TabPane = {
    @module("antd") @scope("Tabs") @react.component
    external make: (
      ~children: React.element=?,
      ~closeIcon: React.element=?,
      ~forceRender: bool=?,
      ~key: string=?,
      ~tab: React.element=?,
    ) => React.element = "TabPane"
  }
}

module Tag = {
  @module("antd/es/tag/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~closable: bool=?,
    ~closeIcon: React.element=?,
    ~color: string=?,
    ~icon: React.element=?,
    ~visible: bool=?,
    ~onClose: 'e => unit=?,
  ) => React.element = "Tag"

  module CheckableTag = {
    @module("antd") @scope("Tag") @react.component
    external make: (~checked: bool=?, ~onChange: bool => unit=?) => React.element = "CheckableTag"
  }
}

module Timeline = {
  @module("antd/es/timeline/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~mode: [#left | #alternate | #right]=?,
    ~pending: 'pending=?,
    ~pendingDot: React.element=?,
    ~reverse: bool=?,
  ) => React.element = "Timeline"

  module Item = {
    @module("antd") @scope("Timeline") @react.component
    external make: (
      ~color: string=?,
      ~dot: React.element=?,
      ~label: React.element=?,
      ~position: [#left | #right]=?,
    ) => React.element = "Item"
  }
}

module Tooltip = {
  @module("antd/es/tooltip/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~title: 'title=?,
    ~align: Js.t<{..}>=?,
    ~arrowPointAtCenter: bool=?,
    ~autoAdjustOverflow: bool=?,
    ~color: string=?,
    ~defaultVisible: bool=?,
    ~destroyTooltipOnHide: 'destroyTooltipOnHide=?,
    ~getPopupContainer: 'triggerNode => 'element=?,
    ~mouseEnterDelay: float=?,
    ~mouseLeaveDelay: float=?,
    ~overlayClassName: string=?,
    ~overlayStyle: ReactDOM.Style.t=?,
    ~overlayInnerStyle: ReactDOM.Style.t=?,
    ~placement: [
      | #top
      | #left
      | #right
      | #bottom
      | #topLeft
      | #topRight
      | #bottomLeft
      | #bottomRight
      | #leftTop
      | #leftBottom
      | #rightTop
      | #rightBottom
    ]=?,
    ~trigger: 'trigger=?,
    ~visible: bool=?,
    ~zIndex: int=?,
    ~onVisibleChange: bool => unit=?,
  ) => React.element = "Tooltip"
}

module Tree = {

}

module Alert = {}

module Drawer = {}

module Message = {
  @module("antd/es/message/style/index.less")
  external importStyle: unit = "default"

  type t

  @deriving(abstract)
  type config = {
    @optional className: string,
    @optional content: React.element,
    @optional duration: float,
    @optional icon: React.element,
    @optional key: string,
    @optional style: ReactDOM.Style.t,
    @optional onClick: ReactEvent.Mouse.t => unit,
    @optional onClose: ReactEvent.Mouse.t => unit,
  }

  @module("antd")
  external message: t = "message"

  @send external success: (t, 'content, float, 'onClose) => unit = "success"
  @send external error: (t, 'content, float, 'onClose) => unit = "error"
  @send external info: (t, 'content, float, 'onClose) => unit = "info"
  @send external warn: (t, 'content, float, 'onClose) => unit = "warn"
  @send external warning: (t, 'content, float, 'onClose) => unit = "warning"
  @send external loading: (t, 'content, float, 'onClose) => unit = "loading"
}

module Modal = {
  @module("antd/es/modal/style/index.less")
  external importStyle: unit = "default"

  type t

  type props
  @obj
  external makeProps: (
    ~children: React.element=?,
    ~afterClose: 'afterClose=?,
    ~bodyStyle: ReactDOM.Style.t=?,
    ~cancelButtonProps: 'buttonProps=?,
    ~cancelText: React.element=?,
    ~centered: bool=?,
    ~closable: bool=?,
    ~closeIcon: React.element=?,
    ~confirmLoading: bool=?,
    ~destroyOnClose: bool=?,
    ~focusTriggerAfterClose: bool=?,
    ~footer: React.element=?,
    ~forceRender: bool=?,
    ~getContainer: 'getContainer=?,
    ~keyboard: bool=?,
    ~mask: bool=?,
    ~maskClosable: bool=?,
    ~maskStyle: ReactDOM.Style.t=?,
    ~modalRender: React.element => React.element=?,
    ~okButtonProps: 'buttonProps=?,
    ~okText: React.element=?,
    ~okType: string=?,
    ~style: ReactDOM.Style.t=?,
    ~title: React.element=?,
    ~visible: bool=?,
    ~width: 'width=?,
    ~wrapClassName: string=?,
    ~zIndex: int=?,
    ~onCancel: ReactEvent.Mouse.t => unit=?,
    ~onOk: ReactEvent.Mouse.t => unit=?,
    unit,
  ) => props = ""
  @module("antd")
  external make: React.component<props> = "Modal"

  type settings
  @obj
  external makeSettings: (
    ~afterClose: 'afterClose=?,
    ~autoFocusButton: 'autoFocusButton=?,
    ~bodyStyle: ReactDOM.Style.t=?,
    ~cancelButtonProps: 'buttonProps=?,
    ~cancelText: React.element=?,
    ~centered: bool=?,
    ~className: string=?,
    ~closable: bool=?,
    ~closeIcon: React.element=?,
    ~content: React.element=?,
    ~getContainer: 'getContainer=?,
    ~icon: React.element=?,
    ~keyboard: bool=?,
    ~mask: bool=?,
    ~maskClosable: bool=?,
    ~maskStyle: ReactDOM.Style.t=?,
    ~modalRender: React.element => React.element=?,
    ~okButtonProps: 'buttonProps=?,
    ~okText: React.element=?,
    ~okType: string=?,
    ~style: ReactDOM.Style.t=?,
    ~title: React.element=?,
    ~width: 'width=?,
    ~zIndex: int=?,
    ~onCancel: 'e => unit=?,
    ~onOk: 'e => unit=?,
    unit,
  ) => settings = ""

  @module("antd") @scope("Modal") external useModal: unit => (t, React.element) = "useModal"
  @module("antd") @scope("Modal") external info: settings => t = "info"
  @module("antd") @scope("Modal") external success: settings => t = "success"
  @module("antd") @scope("Modal") external error: settings => t = "error"
  @module("antd") @scope("Modal") external warning: settings => t = "warning"
  @module("antd") @scope("Modal") external confirm: settings => t = "confirm"
  @module("antd") @scope("Modal") external destroyAll: unit => unit = "destroyAll"

  @send external update: (t, settings) => unit = "update"
  @send external updateBy: (t, settings => settings) => unit = "update"
  @send external destroy: t => unit = "destroy"
}

module Notification = {
  @module("antd/es/notification/style/index.less")
  external importStyle: unit = "default"

  type t

  @module("antd")
  external notification: t = "notification"

  @deriving(abstract)
  type config = {
    @optional bottom: int,
    @optional btn: React.element,
    @optional className: string,
    @optional closeIcon: React.element,
    @optional description: React.element,
    @optional duration: float,
    @optional getContainer: unit => Dom.element,
    @optional icon: React.element,
    @optional key: string,
    @optional message: React.element,
    @optional placement: [#topLeft | #topRight | #bottomLeft | #bottomRight | #string | #topRight],
    @optional style: ReactDOM.Style.t,
    @optional top: int,
    @optional onClick: ReactEvent.Mouse.t => unit,
    @optional onClose: ReactEvent.Mouse.t => unit,
  }

  @send external success: (t, config) => unit = "success"
  @send external error: (t, config) => unit = "error"
  @send external info: (t, config) => unit = "info"
  @send external warning: (t, config) => unit = "warning"
  @send external warn: (t, config) => unit = "warn"
  @send external open_: (t, config) => unit = "open"
  @send external close: (t, string) => unit = "close"
  @send external destroy: t => unit = "destroy"

  @deriving(abstract)
  type options = {
    @optional bottom: int,
    @optional closeIcon: React.element,
    @optional duration: float,
    @optional getContainer: unit => Dom.element,
    @optional placement: [#topLeft | #topRight | #bottomLeft | #bottomRight | #string | #topRight],
    @optional rtl: bool,
    @optional top: int,
    @optional maxCount: int,
  }

  @send external config: (t, options) => unit = "success"
}

module Popconfirm = {}

module Progress = {}

module Result = {}

module Skeleton = {}

module Spin = {
  @module("antd/es/spin/style/index.less")
  external importStyle: unit = "default"

  @module("antd") @react.component
  external make: (
    ~delay: int=?,
    ~indicator: React.element=?,
    ~size: [#small | #default | #large]=?,
    ~spinning: bool=?,
    ~tip: string=?,
    ~wrapperClassName: string=?,
  ) => React.element = "Spin"
}

module Anchor = {}

module BackTop = {}

module ConfigProvider = {}
