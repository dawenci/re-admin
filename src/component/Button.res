type type_ = [#default | #primary | #success | #danger | #warning]
type size = [#default | #large | #small]

@react.component
let make = (
  ~style: option<ReactDOM.Style.t>=?,
  ~onBlur: option<ReactEvent.Focus.t => unit>=?,
  ~onClick: option<ReactEvent.Mouse.t => unit>=?,
  ~onDragLeave: option<ReactEvent.Mouse.t => unit>=?,
  ~onFocus: option<ReactEvent.Focus.t => unit>=?,
  ~onKeyDown: option<ReactEvent.Keyboard.t => unit>=?,
  ~onKeyUp: option<ReactEvent.Keyboard.t => unit>=?,
  ~onMouseDown: option<ReactEvent.Mouse.t => unit>=?,
  ~onMouseLeave: option<ReactEvent.Mouse.t => unit>=?,
  ~onMouseUp: option<ReactEvent.Mouse.t => unit>=?,
  ~onTouchEnd: option<ReactEvent.Touch.t => unit>=?,
  ~onTouchMove: option<ReactEvent.Touch.t => unit>=?,
  ~onTouchStart: option<ReactEvent.Touch.t => unit>=?,
  ~tabIndex: option<int>=?,
  ~id: option<string>=?,
  ~className="",
  ~disabled: option<bool>=?,
  ~hidden: option<bool>=?,
  ~size: size=#default,
  ~block=false,
  ~loading=false,
  ~outline=false,
  ~round=false,
  ~type_: type_=#default,
  ~children=React.null,
) => {
  let classes = ["re-button"]
  if round { classes->Js.Array2.push("re-button--round")->ignore }
  if className != "" { classes->Js.Array2.push(className)->ignore }
  if block { classes->Js.Array2.push("re-button--block")->ignore }
  if loading { classes->Js.Array2.push("re-button--loading")->ignore }
  if outline { classes->Js.Array2.push("re-button--outline")->ignore }
  switch type_ {
  | #default => ()
  | _ => classes->Js.Array2.push(`re-button--${(type_ :> string)}`)->ignore
  }
  if (size :> string) != "default" { classes->Js.Array2.push(`re-button--${(size :> string)}`)->ignore }

  <button
    className={classes->Js.Array2.joinWith(" ")}
    ?hidden
    ?disabled
    ?style
    ?onBlur
    ?onClick
    ?onDragLeave
    ?onFocus
    ?onKeyDown
    ?onKeyUp
    ?onMouseDown
    ?onMouseLeave
    ?onMouseUp
    ?onTouchEnd
    ?onTouchMove
    ?onTouchStart
    ?tabIndex
    ?id>
    <div className="re-button__layout"> <div className="re-button__label"> {children} </div> </div>
  </button>
}
module Css = {
  open CssVariable
  Emotion.injectGlobal(
    `
@keyframes rotate360 {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
.re-button {
  display: inline-block;
  vertical-align: middle;
  box-sizing: border-box;
  border-width: 1px;
  border-style: solid;
  border-radius: var(--radius-base, ${__radius_base});
  font-family: var(--font-family, ${__font_family});
  cursor: pointer;
  text-align: center;
  transition: color var(--transition-duration, ${__transition_duration}), border-color var(--transition-duration, ${__transition_duration});
  user-select: none;
}
.re-button--block {
  display: block;
  width: 100%;
}
.re-button:focus {
  outline: 0 none;
}
.re-button[disabled],
.re-button--loading {
  outline: 0 none;
  cursor: not-allowed;
}
.re-button[hidden] {
  display: none;
}

.re-button__layout {
  box-sizing: border-box;
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
}

.re-button__icon {
  flex: 0 0 auto;
  display: block;
  position: relative;
  box-sizing: border-box;
  width: 16px;
  height: 16px;
  transition: transform var(--transition-duration, ${__transition_duration});
}

.re-button__icon__svg {
  display: block;
  width: 100%;
  height: 100%;
}

.re-button__loading__svg {
  position: relative;
  animation: 1s linear infinite rotate360;
}

.re-button__label {
  flex: 0 0 auto;
  display: block;
  height: 16px;
  line-height: 16px;
  box-sizing: border-box;
  white-space: nowrap;
}

.re-button,
.re-button:hover,
.re-button:active { background-color: #fff; }

.re-button--primary { background-color: var(--color-primary, ${__color_primary}); }
.re-button--primary:hover,
.re-button--primary:focus { background-color: var(--color-primary-light, ${__color_primary_light}); }
.re-button--primary:active { background-color: var(--color-primary-dark, ${__color_primary_dark}); }
.re-button--danger { background-color: var(--color-danger, ${__color_danger}); }
.re-button--danger:hover,
.re-button--danger:focus { background-color: var(--color-danger-light, ${__color_danger_light}); }
.re-button--danger:active { background-color: ${__color_danger_dark}; }
.re-button--success { background-color: var(--color-success, ${__color_success}); }
.re-button--success:hover,
.re-button--success:focus { background-color: var(--color-success-light, ${__color_success_light}); }
.re-button--success:active { background-color: var(--color-success-dark, ${__color_success_dark}); }
.re-button--warning { background-color: var(--color-warning, ${__color_warning}); }
.re-button--warning:hover,
.re-button--warning:focus { background-color: var(--color-warning-light, ${__color_warning_light}); }
.re-button--warning:active { background-color: var(--color-danger-dark, var(--color-warning-dark, ${__color_warning_dark})); }

.re-button[disabled],
.re-button[disabled]:hover,
.re-button[disabled]:focus,
.re-button[disabled]:active { background-color: var(--bg-disabled, ${__bg_disabled}); }

.re-button--loading,
.re-button--loading:hover,
.re-button--loading:focus,
.re-button--loading:active {}

.re-button--outline,
.re-button--outline:hover,
.re-button--outline:focus,
.re-button--outline:active { background-color: transparent; }

.re-button--link,
.re-button--link:hover,
.re-button--link:focus,
.re-button--link:active { background-color: transparent; }

.re-button { border-color: var(--border-color-base, ${__border_color_base}); }
.re-button:hover,
.re-button:focus { border-color: var(--color-primary-light, ${__color_primary_light}); }
.re-button:active { border-color: var(--color-primary-dark, ${__color_primary_dark}); }
.re-button--primary { border-color: var(--color-primary, ${__color_primary}); }
.re-button--primary:hover,
.re-button--primary:focus { border-color: var(--color-primary-light, ${__color_primary_light}); }
.re-button--primary:active {border-color: var(--color-primary-dark, ${__color_primary_dark}); }
.re-button--danger { border-color: var(--color-danger, ${__color_danger}); }
.re-button--danger:hover,
.re-button--danger:focus { border-color: var(--color-danger-light, ${__color_danger_light}); }
.re-button--danger:active { border-color: ${__color_danger_dark}; }
.re-button--warning { border-color: var(--color-warning, ${__color_warning}); }
.re-button--warning:hover,
.re-button--warning:focus { border-color: var(--color-warning-light, ${__color_warning_light}); }
.re-button--warning:active { border-color: var(--color-danger-dark, var(--color-warning-dark, ${__color_warning_dark})); }
.re-button--success { border-color: var(--color-success, ${__color_success}); }
.re-button--success:hover,
.re-button--success:focus { border-color: var(--color-success-light, ${__color_success_light}); }
.re-button--success:active { border-color: var(--color-success-dark, ${__color_success_dark}); }

.re-button[disabled],
.re-button[disabled]:hover,
.re-button[disabled]:focus,
.re-button[disabled]:active { border-color: var(--border-color-disabled, ${__border_color_disabled}); }

.re-button--link,
.re-button--link:hover,
.re-button--link:focus,
.re-button--link:active { border-color: transparent; }

.re-button { fill: var(--fg-base, ${__fg_base}); color: var(--fg-base, ${__fg_base}); }
.re-button:hover,
.re-button:focus { fill: var(--color-primary-light, ${__color_primary_light}); color: var(--color-primary-light, ${__color_primary_light}); }
.re-button:active { fill: var(--color-primary-dark, ${__color_primary_dark}); color: var(--color-primary-dark, ${__color_primary_dark}); }

.re-button--primary,
.re-button--primary:hover,
.re-button--primary:focus,
.re-button--primary:active,
.re-button--danger,
.re-button--danger:hover,
.re-button--danger:focus,
.re-button--danger:active,
.re-button--warning,
.re-button--warning:hover,
.re-button--warning:focus,
.re-button--warning:active,
.re-button--success,
.re-button--success:hover,
.re-button--success:focus,
.re-button--success:active { fill: #fff; color: #fff; }

.re-button--primary.re-button--outline { fill: var(--color-primary, ${__color_primary}); color: var(--color-primary, ${__color_primary}); }
.re-button--primary.re-button--outline:hover,
.re-button--primary.re-button--outline:focus { fill: var(--color-primary-light, ${__color_primary_light}); color: var(--color-primary-light, ${__color_primary_light}); }
.re-button--primary.re-button--outline:active { fill: var(--color-primary-dark, ${__color_primary_dark}); color: var(--color-primary-dark, ${__color_primary_dark}); }

.re-button--danger.re-button--outline { fill: var(--color-danger, ${__color_danger}); color: var(--color-danger, ${__color_danger}); }
.re-button--danger.re-button--outline:hover,
.re-button--danger.re-button--outline:focus { fill: var(--color-danger-light, ${__color_danger_light}); color: var(--color-danger-light, ${__color_danger_light}); }
.re-button--danger.re-button--outline:active { fill: ${__color_danger_dark}; color: ${__color_danger_dark}; }

.re-button--warning.re-button--outline { fill: var(--color-warning, ${__color_warning}); color: var(--color-warning, ${__color_warning}); }
.re-button--warning.re-button--outline:hover,
.re-button--warning.re-button--outline:focus { fill: var(--color-warning-light, ${__color_warning_light}); color: var(--color-warning-light, ${__color_warning_light}); }
.re-button--warning.re-button--outline:active { fill: var(--color-danger-dark, var(--color-warning-dark, ${__color_warning_dark})); color: var(--color-danger-dark, var(--color-warning-dark, ${__color_warning_dark})); }

.re-button--success.re-button--outline { fill: var(--color-success, ${__color_success}); color: var(--color-success, ${__color_success}); }
.re-button--success.re-button--outline:hover,
.re-button--success.re-button--outline:focus { fill: var(--color-success-light, ${__color_success_light}); color: var(--color-success-light, ${__color_success_light}); }
.re-button--success.re-button--outline:active { fill: var(--color-success-dark, ${__color_success_dark}); color: var(--color-success-dark, ${__color_success_dark}); }

.re-button--link { fill: var(--color-primary, ${__color_primary}); color: var(--color-primary, ${__color_primary}); }
.re-button--link:hover,
.re-button--link:focus { fill: var(--color-primary-light, ${__color_primary_light}); color: var(--color-primary-light, ${__color_primary_light}); }
.re-button--link:active { fill: var(--color-primary-dark, ${__color_primary_dark}); color: var(--color-primary-dark, ${__color_primary_dark}); }

.re-button[disabled],
.re-button[disabled]:hover,
.re-button[disabled]:focus,
.re-button[disabled]:active,
.re-button--outline[disabled],
.re-button--outline[disabled]:hover,
.re-button--outline[disabled]:focus,
.re-button--outline[disabled]:active { fill: var(--color-disabled, ${__fg_disabled}); color: var(--color-disabled, ${__fg_disabled}); }
.re-button {
  height: var(--height-base, ${__height_base});
  padding: 0 calc(var(--height-base, ${__height_base}) / 4);
  font-size: 14px;
}

.re-button__layout:not(.empty) .re-button__label {
  margin: 0 4px;
}

.re-button--round {
  border-radius: calc(var(--height-base, ${__height_base}) / 2);
}
.re-button--small {
  height: var(--height-small, ${__height_small});
  padding: 0 calc(var(--height-base, ${__height_small}) / 4 - 2px);
  font-size: 14px;
}
.re-button--round.re-button--small {
  border-radius: calc(var(--height-base, ${__height_small}) / 2);
}
.re-button--large {
  height: var(--height-large, ${__height_large});
  padding: 0 calc(var(--height-base, ${__height_large}) / 4 + 1px);
  font-size: 16px;
}
.re-button--round.re-button--large {
  border-radius: calc(var(--height-base, ${__height_large}) / 2);
}

.re-button-group .re-button {
  position: relative;
  vertical-align: top;
}
.re-button-group .re-button:hover,
.re-button-group .re-button:focus-within {
  z-index: 1;
}
.re-button-group .re-button:not(:first-of-type) {
  margin-left: -1px;
}
.re-button-group .re-button {
  border-radius: 0;
}
.re-button-group .re-button:first-of-type {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
.re-button-group .re-button:last-of-type {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}
  `,
  )
}
