@module("@ant-design/icons") @react.component
external make: (
  ~component: unit => React.element,
  ~rotate: float=?,
  ~spin: bool=?,
  ~style: ReactDOM.Style.t=?,
) => React.element = "Icon"

module BaseIcon = {
  type props = {
    "className": option<string>,
    "rotate": option<float>,
    "spin": option<bool>,
    "style": option<ReactDOM.Style.t>,
    "twoToneColor": option<string>
  }

  @obj external makeProps: (
    ~className: string=?,
    ~rotate: float=?,
    ~spin: bool=?,
    ~style: ReactDOM.Style.t=?,
    ~twoToneColor: string=?,
    ~key: string=?,
    unit,
  ) => props = ""
}

// Directional Icons
module StepBackwardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StepBackwardOutlined"
}
module StepForwardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StepForwardOutlined"
}
module FastBackwardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FastBackwardOutlined"
}
module FastForwardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FastForwardOutlined"
}
module ShrinkOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShrinkOutlined"
}
module ArrowsAltOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ArrowsAltOutlined"
}
module DownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownOutlined"
}
module UpOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpOutlined"
}
module LeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftOutlined"
}
module RightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightOutlined"
}
module CaretUpOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretUpOutlined"
}
module CaretDownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretDownOutlined"
}
module CaretLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretLeftOutlined"
}
module CaretRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretRightOutlined"
}
module UpCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpCircleOutlined"
}
module DownCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownCircleOutlined"
}
module LeftCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftCircleOutlined"
}
module RightCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightCircleOutlined"
}
module DoubleRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DoubleRightOutlined"
}
module DoubleLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DoubleLeftOutlined"
}
module VerticalLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VerticalLeftOutlined"
}
module VerticalRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VerticalRightOutlined"
}
module VerticalAlignTopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VerticalAlignTopOutlined"
}
module VerticalAlignMiddleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VerticalAlignMiddleOutlined"
}
module VerticalAlignBottomOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VerticalAlignBottomOutlined"
}
module ForwardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ForwardOutlined"
}
module BackwardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BackwardOutlined"
}
module RollbackOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RollbackOutlined"
}
module EnterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EnterOutlined"
}
module RetweetOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RetweetOutlined"
}
module SwapOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SwapOutlined"
}
module SwapLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SwapLeftOutlined"
}
module SwapRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SwapRightOutlined"
}
module ArrowUpOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ArrowUpOutlined"
}
module ArrowDownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ArrowDownOutlined"
}
module ArrowLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ArrowLeftOutlined"
}
module ArrowRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ArrowRightOutlined"
}
module PlayCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlayCircleOutlined"
}
module UpSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpSquareOutlined"
}
module DownSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownSquareOutlined"
}
module LeftSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftSquareOutlined"
}
module RightSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightSquareOutlined"
}
module LoginOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LoginOutlined"
}
module LogoutOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LogoutOutlined"
}
module MenuFoldOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MenuFoldOutlined"
}
module MenuUnfoldOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MenuUnfoldOutlined"
}
module BorderBottomOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderBottomOutlined"
}
module BorderHorizontalOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderHorizontalOutlined"
}
module BorderInnerOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderInnerOutlined"
}
module BorderOuterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderOuterOutlined"
}
module BorderLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderLeftOutlined"
}
module BorderRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderRightOutlined"
}
module BorderTopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderTopOutlined"
}
module BorderVerticleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderVerticleOutlined"
}
module PicCenterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PicCenterOutlined"
}
module PicLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PicLeftOutlined"
}
module PicRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PicRightOutlined"
}
module RadiusBottomleftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RadiusBottomleftOutlined"
}
module RadiusBottomrightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RadiusBottomrightOutlined"
}
module RadiusUpleftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RadiusUpleftOutlined"
}
module RadiusUprightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RadiusUprightOutlined"
}
module FullscreenOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FullscreenOutlined"
}
module FullscreenExitOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FullscreenExitOutlined"
}
module StepBackwardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StepBackwardFilled"
}
module StepForwardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StepForwardFilled"
}
module FastBackwardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FastBackwardFilled"
}
module FastForwardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FastForwardFilled"
}
module CaretUpFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretUpFilled"
}
module CaretDownFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretDownFilled"
}
module CaretLeftFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretLeftFilled"
}
module CaretRightFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CaretRightFilled"
}
module UpCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpCircleFilled"
}
module DownCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownCircleFilled"
}
module LeftCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftCircleFilled"
}
module RightCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightCircleFilled"
}
module ForwardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ForwardFilled"
}
module BackwardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BackwardFilled"
}
module PlayCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlayCircleFilled"
}
module UpSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpSquareFilled"
}
module DownSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownSquareFilled"
}
module LeftSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftSquareFilled"
}
module RightSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightSquareFilled"
}
module UpCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpCircleTwoTone"
}
module DownCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownCircleTwoTone"
}
module LeftCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftCircleTwoTone"
}
module RightCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightCircleTwoTone"
}
module PlayCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlayCircleTwoTone"
}
module UpSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UpSquareTwoTone"
}
module DownSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownSquareTwoTone"
}
module LeftSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LeftSquareTwoTone"
}
module RightSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RightSquareTwoTone"
}
// Suggested Icons
module QuestionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QuestionOutlined"
}
module QuestionCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QuestionCircleOutlined"
}
module PlusOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusOutlined"
}
module PlusCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusCircleOutlined"
}
module PauseOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PauseOutlined"
}
module PauseCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PauseCircleOutlined"
}
module MinusOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusOutlined"
}
module MinusCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusCircleOutlined"
}
module PlusSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusSquareOutlined"
}
module MinusSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusSquareOutlined"
}
module InfoOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InfoOutlined"
}
module InfoCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InfoCircleOutlined"
}
module ExclamationOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExclamationOutlined"
}
module ExclamationCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExclamationCircleOutlined"
}
module CloseOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseOutlined"
}
module CloseCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseCircleOutlined"
}
module CloseSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseSquareOutlined"
}
module CheckOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckOutlined"
}
module CheckCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckCircleOutlined"
}
module CheckSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckSquareOutlined"
}
module ClockCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ClockCircleOutlined"
}
module WarningOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WarningOutlined"
}
module IssuesCloseOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IssuesCloseOutlined"
}
module StopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StopOutlined"
}
module QuestionCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QuestionCircleFilled"
}
module PlusCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusCircleFilled"
}
module PauseCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PauseCircleFilled"
}
module MinusCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusCircleFilled"
}
module PlusSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusSquareFilled"
}
module MinusSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusSquareFilled"
}
module InfoCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InfoCircleFilled"
}
module ExclamationCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExclamationCircleFilled"
}
module CloseCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseCircleFilled"
}
module CloseSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseSquareFilled"
}
module CheckCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckCircleFilled"
}
module CheckSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckSquareFilled"
}
module ClockCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ClockCircleFilled"
}
module WarningFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WarningFilled"
}
module StopFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StopFilled"
}
module QuestionCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QuestionCircleTwoTone"
}
module PlusCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusCircleTwoTone"
}
module PauseCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PauseCircleTwoTone"
}
module MinusCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusCircleTwoTone"
}
module PlusSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlusSquareTwoTone"
}
module MinusSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MinusSquareTwoTone"
}
module InfoCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InfoCircleTwoTone"
}
module ExclamationCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExclamationCircleTwoTone"
}
module CloseCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseCircleTwoTone"
}
module CloseSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloseSquareTwoTone"
}
module CheckCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckCircleTwoTone"
}
module CheckSquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CheckSquareTwoTone"
}
module ClockCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ClockCircleTwoTone"
}
module WarningTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WarningTwoTone"
}
module StopTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StopTwoTone"
}
// Editor Icons
module EditOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EditOutlined"
}
module FormOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FormOutlined"
}
module CopyOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CopyOutlined"
}
module ScissorOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ScissorOutlined"
}
module DeleteOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeleteOutlined"
}
module SnippetsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SnippetsOutlined"
}
module DiffOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DiffOutlined"
}
module HighlightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HighlightOutlined"
}
module AlignCenterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlignCenterOutlined"
}
module AlignLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlignLeftOutlined"
}
module AlignRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlignRightOutlined"
}
module BgColorsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BgColorsOutlined"
}
module BoldOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BoldOutlined"
}
module ItalicOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ItalicOutlined"
}
module UnderlineOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UnderlineOutlined"
}
module StrikethroughOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StrikethroughOutlined"
}
module RedoOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedoOutlined"
}
module UndoOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UndoOutlined"
}
module ZoomInOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ZoomInOutlined"
}
module ZoomOutOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ZoomOutOutlined"
}
module FontColorsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FontColorsOutlined"
}
module FontSizeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FontSizeOutlined"
}
module LineHeightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LineHeightOutlined"
}
module DashOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DashOutlined"
}
module SmallDashOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SmallDashOutlined"
}
module SortAscendingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SortAscendingOutlined"
}
module SortDescendingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SortDescendingOutlined"
}
module DragOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DragOutlined"
}
module OrderedListOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "OrderedListOutlined"
}
module UnorderedListOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UnorderedListOutlined"
}
module RadiusSettingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RadiusSettingOutlined"
}
module ColumnWidthOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ColumnWidthOutlined"
}
module ColumnHeightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ColumnHeightOutlined"
}
module EditFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EditFilled"
}
module CopyFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CopyFilled"
}
module DeleteFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeleteFilled"
}
module SnippetsFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SnippetsFilled"
}
module DiffFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DiffFilled"
}
module HighlightFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HighlightFilled"
}
module EditTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EditTwoTone"
}
module CopyTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CopyTwoTone"
}
module DeleteTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeleteTwoTone"
}
module SnippetsTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SnippetsTwoTone"
}
module DiffTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DiffTwoTone"
}
module HighlightTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HighlightTwoTone"
}
// Data Icons
module AreaChartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AreaChartOutlined"
}
module PieChartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PieChartOutlined"
}
module BarChartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BarChartOutlined"
}
module DotChartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DotChartOutlined"
}
module LineChartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LineChartOutlined"
}
module RadarChartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RadarChartOutlined"
}
module HeatMapOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HeatMapOutlined"
}
module FallOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FallOutlined"
}
module RiseOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RiseOutlined"
}
module StockOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StockOutlined"
}
module BoxPlotOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BoxPlotOutlined"
}
module FundOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FundOutlined"
}
module SlidersOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlidersOutlined"
}
module PieChartFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PieChartFilled"
}
module BoxPlotFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BoxPlotFilled"
}
module FundFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FundFilled"
}
module SlidersFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlidersFilled"
}
module PieChartTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PieChartTwoTone"
}
module BoxPlotTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BoxPlotTwoTone"
}
module FundTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FundTwoTone"
}
module SlidersTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlidersTwoTone"
}
// Brand and Logos
module AndroidOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AndroidOutlined"
}
module AppleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AppleOutlined"
}
module WindowsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WindowsOutlined"
}
module IeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IeOutlined"
}
module ChromeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ChromeOutlined"
}
module GithubOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GithubOutlined"
}
module AliwangwangOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AliwangwangOutlined"
}
module DingdingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DingdingOutlined"
}
module WeiboSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WeiboSquareOutlined"
}
module WeiboCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WeiboCircleOutlined"
}
module TaobaoCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TaobaoCircleOutlined"
}
module Html5Outlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "Html5Outlined"
}
module WeiboOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WeiboOutlined"
}
module TwitterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TwitterOutlined"
}
module WechatOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WechatOutlined"
}
module YoutubeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "YoutubeOutlined"
}
module AlipayCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlipayCircleOutlined"
}
module TaobaoOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TaobaoOutlined"
}
module SkypeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SkypeOutlined"
}
module QqOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QqOutlined"
}
module MediumWorkmarkOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MediumWorkmarkOutlined"
}
module GitlabOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GitlabOutlined"
}
module MediumOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MediumOutlined"
}
module LinkedinOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LinkedinOutlined"
}
module GooglePlusOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GooglePlusOutlined"
}
module DropboxOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DropboxOutlined"
}
module FacebookOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FacebookOutlined"
}
module CodepenOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodepenOutlined"
}
module CodeSandboxOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodeSandboxOutlined"
}
module AmazonOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AmazonOutlined"
}
module GoogleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoogleOutlined"
}
module CodepenCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodepenCircleOutlined"
}
module AlipayOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlipayOutlined"
}
module AntDesignOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AntDesignOutlined"
}
module AntCloudOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AntCloudOutlined"
}
module AliyunOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AliyunOutlined"
}
module ZhihuOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ZhihuOutlined"
}
module SlackOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlackOutlined"
}
module SlackSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlackSquareOutlined"
}
module BehanceOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BehanceOutlined"
}
module BehanceSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BehanceSquareOutlined"
}
module DribbbleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DribbbleOutlined"
}
module DribbbleSquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DribbbleSquareOutlined"
}
module InstagramOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InstagramOutlined"
}
module YuqueOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "YuqueOutlined"
}
module AlibabaOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlibabaOutlined"
}
module YahooOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "YahooOutlined"
}
module RedditOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedditOutlined"
}
module SketchOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SketchOutlined"
}
module AndroidFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AndroidFilled"
}
module AppleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AppleFilled"
}
module WindowsFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WindowsFilled"
}
module ChromeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ChromeFilled"
}
module GithubFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GithubFilled"
}
module AliwangwangFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AliwangwangFilled"
}
module WeiboSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WeiboSquareFilled"
}
module WeiboCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WeiboCircleFilled"
}
module TaobaoCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TaobaoCircleFilled"
}
module Html5Filled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "Html5Filled"
}
module WechatFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WechatFilled"
}
module YoutubeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "YoutubeFilled"
}
module AlipayCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlipayCircleFilled"
}
module SkypeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SkypeFilled"
}
module GitlabFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GitlabFilled"
}
module LinkedinFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LinkedinFilled"
}
module FacebookFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FacebookFilled"
}
module CodeSandboxCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodeSandboxCircleFilled"
}
module CodepenCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodepenCircleFilled"
}
module SlackSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlackSquareFilled"
}
module BehanceSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BehanceSquareFilled"
}
module DribbbleSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DribbbleSquareFilled"
}
module InstagramFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InstagramFilled"
}
module YuqueFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "YuqueFilled"
}
module YahooFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "YahooFilled"
}
module Html5TwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "Html5TwoTone"
}
// Application Icons
module AccountBookFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AccountBookFilled"
}
module AlertFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlertFilled"
}
module AlipaySquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlipaySquareFilled"
}
module AmazonCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AmazonCircleFilled"
}
module AmazonSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AmazonSquareFilled"
}
module ApiFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ApiFilled"
}
module AppstoreFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AppstoreFilled"
}
module AudioFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AudioFilled"
}
module BankFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BankFilled"
}
module BehanceCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BehanceCircleFilled"
}
module BellFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BellFilled"
}
module BookFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BookFilled"
}
module BugFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BugFilled"
}
module BuildFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BuildFilled"
}
module BulbFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BulbFilled"
}
module CalculatorFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CalculatorFilled"
}
module CalendarFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CalendarFilled"
}
module CameraFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CameraFilled"
}
module CarFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CarFilled"
}
module CarryOutFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CarryOutFilled"
}
module CiCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CiCircleFilled"
}
module CloudFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudFilled"
}
module CodeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodeFilled"
}
module CodeSandboxSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodeSandboxSquareFilled"
}
module CodepenSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodepenSquareFilled"
}
module CompassFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CompassFilled"
}
module ContactsFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ContactsFilled"
}
module ContainerFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ContainerFilled"
}
module ControlFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ControlFilled"
}
module CreditCardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CreditCardFilled"
}
module CrownFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CrownFilled"
}
module CustomerServiceFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CustomerServiceFilled"
}
module DashboardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DashboardFilled"
}
module DatabaseFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DatabaseFilled"
}
module DingtalkCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DingtalkCircleFilled"
}
module DingtalkSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DingtalkSquareFilled"
}
module DislikeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DislikeFilled"
}
module DollarCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DollarCircleFilled"
}
module DribbbleCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DribbbleCircleFilled"
}
module DropboxCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DropboxCircleFilled"
}
module DropboxSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DropboxSquareFilled"
}
module EnvironmentFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EnvironmentFilled"
}
module EuroCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EuroCircleFilled"
}
module ExperimentFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExperimentFilled"
}
module EyeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EyeFilled"
}
module EyeInvisibleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EyeInvisibleFilled"
}
module FileAddFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileAddFilled"
}
module FileExcelFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileExcelFilled"
}
module FileExclamationFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileExclamationFilled"
}
module FileFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileFilled"
}
module FileImageFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileImageFilled"
}
module FileMarkdownFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileMarkdownFilled"
}
module FilePdfFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilePdfFilled"
}
module FilePptFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilePptFilled"
}
module FileTextFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileTextFilled"
}
module FileUnknownFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileUnknownFilled"
}
module FileWordFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileWordFilled"
}
module FileZipFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileZipFilled"
}
module FilterFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilterFilled"
}
module FireFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FireFilled"
}
module FlagFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FlagFilled"
}
module FolderAddFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderAddFilled"
}
module FolderFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderFilled"
}
module FolderOpenFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderOpenFilled"
}
module FormatPainterFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FormatPainterFilled"
}
module FrownFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FrownFilled"
}
module FunnelPlotFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FunnelPlotFilled"
}
module GiftFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GiftFilled"
}
module GoldFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoldFilled"
}
module GoldenFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoldenFilled"
}
module GoogleCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoogleCircleFilled"
}
module GooglePlusCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GooglePlusCircleFilled"
}
module GooglePlusSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GooglePlusSquareFilled"
}
module GoogleSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoogleSquareFilled"
}
module HddFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HddFilled"
}
module HeartFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HeartFilled"
}
module HomeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HomeFilled"
}
module HourglassFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HourglassFilled"
}
module IdcardFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IdcardFilled"
}
module IeCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IeCircleFilled"
}
module IeSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IeSquareFilled"
}
module InsuranceFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsuranceFilled"
}
module InteractionFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InteractionFilled"
}
module LayoutFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LayoutFilled"
}
module LikeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LikeFilled"
}
module LockFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LockFilled"
}
module MacCommandFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MacCommandFilled"
}
module MailFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MailFilled"
}
module MedicineBoxFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MedicineBoxFilled"
}
module MediumCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MediumCircleFilled"
}
module MediumSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MediumSquareFilled"
}
module MehFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MehFilled"
}
module MessageFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MessageFilled"
}
module MobileFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MobileFilled"
}
module MoneyCollectFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MoneyCollectFilled"
}
module NotificationFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NotificationFilled"
}
module PayCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PayCircleFilled"
}
module PhoneFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PhoneFilled"
}
module PictureFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PictureFilled"
}
module PlaySquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlaySquareFilled"
}
module PoundCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PoundCircleFilled"
}
module PrinterFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PrinterFilled"
}
module ProfileFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ProfileFilled"
}
module ProjectFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ProjectFilled"
}
module PropertySafetyFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PropertySafetyFilled"
}
module PushpinFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PushpinFilled"
}
module QqCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QqCircleFilled"
}
module QqSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QqSquareFilled"
}
module ReadFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ReadFilled"
}
module ReconciliationFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ReconciliationFilled"
}
module RedEnvelopeFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedEnvelopeFilled"
}
module RedditCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedditCircleFilled"
}
module RedditSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedditSquareFilled"
}
module RestFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RestFilled"
}
module RobotFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RobotFilled"
}
module RocketFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RocketFilled"
}
module SafetyCertificateFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SafetyCertificateFilled"
}
module SaveFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SaveFilled"
}
module ScheduleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ScheduleFilled"
}
module SecurityScanFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SecurityScanFilled"
}
module SettingFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SettingFilled"
}
module ShopFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShopFilled"
}
module ShoppingFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShoppingFilled"
}
module SignalFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SignalFilled"
}
module SketchCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SketchCircleFilled"
}
module SketchSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SketchSquareFilled"
}
module SkinFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SkinFilled"
}
module SlackCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SlackCircleFilled"
}
module SmileFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SmileFilled"
}
module SoundFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SoundFilled"
}
module StarFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StarFilled"
}
module SwitcherFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SwitcherFilled"
}
module TabletFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TabletFilled"
}
module TagFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TagFilled"
}
module TagsFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TagsFilled"
}
module TaobaoSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TaobaoSquareFilled"
}
module ThunderboltFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ThunderboltFilled"
}
module ToolFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ToolFilled"
}
module TrademarkCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrademarkCircleFilled"
}
module TrophyFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrophyFilled"
}
module TwitterCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TwitterCircleFilled"
}
module TwitterSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TwitterSquareFilled"
}
module UnlockFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UnlockFilled"
}
module UsbFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UsbFilled"
}
module VideoCameraFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VideoCameraFilled"
}
module WalletFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WalletFilled"
}
module ZhihuCircleFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ZhihuCircleFilled"
}
module ZhihuSquareFilled = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ZhihuSquareFilled"
}
module AccountBookTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AccountBookTwoTone"
}
module AlertTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlertTwoTone"
}
module ApiTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ApiTwoTone"
}
module AppstoreTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AppstoreTwoTone"
}
module AudioTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AudioTwoTone"
}
module BankTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BankTwoTone"
}
module BellTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BellTwoTone"
}
module BookTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BookTwoTone"
}
module BugTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BugTwoTone"
}
module BuildTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BuildTwoTone"
}
module BulbTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BulbTwoTone"
}
module CalculatorTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CalculatorTwoTone"
}
module CalendarTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CalendarTwoTone"
}
module CameraTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CameraTwoTone"
}
module CarTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CarTwoTone"
}
module CarryOutTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CarryOutTwoTone"
}
module CiCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CiCircleTwoTone"
}
module CiTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CiTwoTone"
}
module CloudTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudTwoTone"
}
module CodeTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodeTwoTone"
}
module CompassTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CompassTwoTone"
}
module ContactsTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ContactsTwoTone"
}
module ContainerTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ContainerTwoTone"
}
module ControlTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ControlTwoTone"
}
module CopyrightTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CopyrightTwoTone"
}
module CreditCardTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CreditCardTwoTone"
}
module CrownTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CrownTwoTone"
}
module CustomerServiceTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CustomerServiceTwoTone"
}
module DashboardTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DashboardTwoTone"
}
module DatabaseTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DatabaseTwoTone"
}
module DislikeTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DislikeTwoTone"
}
module DollarCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DollarCircleTwoTone"
}
module DollarTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DollarTwoTone"
}
module EnvironmentTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EnvironmentTwoTone"
}
module EuroCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EuroCircleTwoTone"
}
module EuroTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EuroTwoTone"
}
module ExperimentTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExperimentTwoTone"
}
module EyeTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EyeTwoTone"
}
module EyeInvisibleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EyeInvisibleTwoTone"
}
module FileAddTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileAddTwoTone"
}
module FileExcelTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileExcelTwoTone"
}
module FileExclamationTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileExclamationTwoTone"
}
module FileTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileTwoTone"
}
module FileImageTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileImageTwoTone"
}
module FileMarkdownTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileMarkdownTwoTone"
}
module FilePdfTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilePdfTwoTone"
}
module FilePptTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilePptTwoTone"
}
module FileTextTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileTextTwoTone"
}
module FileUnknownTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileUnknownTwoTone"
}
module FileWordTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileWordTwoTone"
}
module FileZipTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileZipTwoTone"
}
module FilterTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilterTwoTone"
}
module FireTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FireTwoTone"
}
module FlagTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FlagTwoTone"
}
module FolderAddTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderAddTwoTone"
}
module FolderTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderTwoTone"
}
module FolderOpenTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderOpenTwoTone"
}
module FrownTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FrownTwoTone"
}
module FunnelPlotTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FunnelPlotTwoTone"
}
module GiftTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GiftTwoTone"
}
module GoldTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoldTwoTone"
}
module HddTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HddTwoTone"
}
module HeartTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HeartTwoTone"
}
module HomeTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HomeTwoTone"
}
module HourglassTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HourglassTwoTone"
}
module IdcardTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IdcardTwoTone"
}
module InsuranceTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsuranceTwoTone"
}
module InteractionTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InteractionTwoTone"
}
module LayoutTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LayoutTwoTone"
}
module LikeTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LikeTwoTone"
}
module LockTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LockTwoTone"
}
module MailTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MailTwoTone"
}
module MedicineBoxTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MedicineBoxTwoTone"
}
module MehTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MehTwoTone"
}
module MessageTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MessageTwoTone"
}
module MobileTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MobileTwoTone"
}
module MoneyCollectTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MoneyCollectTwoTone"
}
module NotificationTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NotificationTwoTone"
}
module PhoneTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PhoneTwoTone"
}
module PictureTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PictureTwoTone"
}
module PlaySquareTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlaySquareTwoTone"
}
module PoundCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PoundCircleTwoTone"
}
module PrinterTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PrinterTwoTone"
}
module ProfileTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ProfileTwoTone"
}
module ProjectTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ProjectTwoTone"
}
module PropertySafetyTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PropertySafetyTwoTone"
}
module PushpinTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PushpinTwoTone"
}
module ReconciliationTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ReconciliationTwoTone"
}
module RedEnvelopeTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedEnvelopeTwoTone"
}
module RestTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RestTwoTone"
}
module RocketTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RocketTwoTone"
}
module SafetyCertificateTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SafetyCertificateTwoTone"
}
module SaveTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SaveTwoTone"
}
module ScheduleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ScheduleTwoTone"
}
module SecurityScanTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SecurityScanTwoTone"
}
module SettingTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SettingTwoTone"
}
module ShopTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShopTwoTone"
}
module ShoppingTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShoppingTwoTone"
}
module SkinTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SkinTwoTone"
}
module SmileTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SmileTwoTone"
}
module SoundTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SoundTwoTone"
}
module StarTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StarTwoTone"
}
module SwitcherTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SwitcherTwoTone"
}
module TabletTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TabletTwoTone"
}
module TagTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TagTwoTone"
}
module TagsTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TagsTwoTone"
}
module ThunderboltTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ThunderboltTwoTone"
}
module ToolTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ToolTwoTone"
}
module TrademarkCircleTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrademarkCircleTwoTone"
}
module TrophyTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrophyTwoTone"
}
module UnlockTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UnlockTwoTone"
}
module UsbTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UsbTwoTone"
}
module VideoCameraTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VideoCameraTwoTone"
}
module WalletTwoTone = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WalletTwoTone"
}

module AccountBookOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AccountBookOutlined"
}
module AimOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AimOutlined"
}
module AlertOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AlertOutlined"
}
module ApartmentOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ApartmentOutlined"
}
module ApiOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ApiOutlined"
}
module AppstoreAddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AppstoreAddOutlined"
}
module AppstoreOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AppstoreOutlined"
}
module AudioOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AudioOutlined"
}
module AudioMutedOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AudioMutedOutlined"
}
module AuditOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "AuditOutlined"
}
module BankOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BankOutlined"
}
module BarcodeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BarcodeOutlined"
}
module BarsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BarsOutlined"
}
module BellOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BellOutlined"
}
module BlockOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BlockOutlined"
}
module BookOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BookOutlined"
}
module BorderOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderOutlined"
}
module BorderlessTableOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BorderlessTableOutlined"
}
module BranchesOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BranchesOutlined"
}
module BugOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BugOutlined"
}
module BuildOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BuildOutlined"
}
module BulbOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "BulbOutlined"
}
module CalculatorOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CalculatorOutlined"
}
module CalendarOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CalendarOutlined"
}
module CameraOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CameraOutlined"
}
module CarOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CarOutlined"
}
module CarryOutOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CarryOutOutlined"
}
module CiCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CiCircleOutlined"
}
module CiOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CiOutlined"
}
module ClearOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ClearOutlined"
}
module CloudDownloadOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudDownloadOutlined"
}
module CloudOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudOutlined"
}
module CloudServerOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudServerOutlined"
}
module CloudSyncOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudSyncOutlined"
}
module CloudUploadOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CloudUploadOutlined"
}
module ClusterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ClusterOutlined"
}
module CodeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CodeOutlined"
}
module CoffeeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CoffeeOutlined"
}
module CommentOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CommentOutlined"
}
module CompassOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CompassOutlined"
}
module CompressOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CompressOutlined"
}
module ConsoleSqlOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ConsoleSqlOutlined"
}
module ContactsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ContactsOutlined"
}
module ContainerOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ContainerOutlined"
}
module ControlOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ControlOutlined"
}
module CopyrightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CopyrightOutlined"
}
module CreditCardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CreditCardOutlined"
}
module CrownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CrownOutlined"
}
module CustomerServiceOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "CustomerServiceOutlined"
}
module DashboardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DashboardOutlined"
}
module DatabaseOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DatabaseOutlined"
}
module DeleteColumnOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeleteColumnOutlined"
}
module DeleteRowOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeleteRowOutlined"
}
module DeliveredProcedureOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeliveredProcedureOutlined"
}
module DeploymentUnitOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DeploymentUnitOutlined"
}
module DesktopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DesktopOutlined"
}
module DingtalkOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DingtalkOutlined"
}
module DisconnectOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DisconnectOutlined"
}
module DislikeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DislikeOutlined"
}
module DollarCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DollarCircleOutlined"
}
module DollarOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DollarOutlined"
}
module DownloadOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "DownloadOutlined"
}
module EllipsisOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EllipsisOutlined"
}
module EnvironmentOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EnvironmentOutlined"
}
module EuroCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EuroCircleOutlined"
}
module EuroOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EuroOutlined"
}
module ExceptionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExceptionOutlined"
}
module ExpandAltOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExpandAltOutlined"
}
module ExpandOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExpandOutlined"
}
module ExperimentOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExperimentOutlined"
}
module ExportOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ExportOutlined"
}
module EyeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EyeOutlined"
}
module EyeInvisibleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "EyeInvisibleOutlined"
}
module FieldBinaryOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FieldBinaryOutlined"
}
module FieldNumberOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FieldNumberOutlined"
}
module FieldStringOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FieldStringOutlined"
}
module FieldTimeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FieldTimeOutlined"
}
module FileAddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileAddOutlined"
}
module FileDoneOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileDoneOutlined"
}
module FileExcelOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileExcelOutlined"
}
module FileExclamationOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileExclamationOutlined"
}
module FileOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileOutlined"
}
module FileGifOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileGifOutlined"
}
module FileImageOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileImageOutlined"
}
module FileJpgOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileJpgOutlined"
}
module FileMarkdownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileMarkdownOutlined"
}
module FilePdfOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilePdfOutlined"
}
module FilePptOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilePptOutlined"
}
module FileProtectOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileProtectOutlined"
}
module FileSearchOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileSearchOutlined"
}
module FileSyncOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileSyncOutlined"
}
module FileTextOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileTextOutlined"
}
module FileUnknownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileUnknownOutlined"
}
module FileWordOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileWordOutlined"
}
module FileZipOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FileZipOutlined"
}
module FilterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FilterOutlined"
}
module FireOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FireOutlined"
}
module FlagOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FlagOutlined"
}
module FolderAddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderAddOutlined"
}
module FolderOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderOutlined"
}
module FolderOpenOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderOpenOutlined"
}
module FolderViewOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FolderViewOutlined"
}
module ForkOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ForkOutlined"
}
module FormatPainterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FormatPainterOutlined"
}
module FrownOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FrownOutlined"
}
module FunctionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FunctionOutlined"
}
module FundProjectionScreenOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FundProjectionScreenOutlined"
}
module FundViewOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FundViewOutlined"
}
module FunnelPlotOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "FunnelPlotOutlined"
}
module GatewayOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GatewayOutlined"
}
module GifOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GifOutlined"
}
module GiftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GiftOutlined"
}
module GlobalOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GlobalOutlined"
}
module GoldOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GoldOutlined"
}
module GroupOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "GroupOutlined"
}
module HddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HddOutlined"
}
module HeartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HeartOutlined"
}
module HistoryOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HistoryOutlined"
}
module HomeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HomeOutlined"
}
module HourglassOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "HourglassOutlined"
}
module IdcardOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "IdcardOutlined"
}
module ImportOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ImportOutlined"
}
module InboxOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InboxOutlined"
}
module InsertRowAboveOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsertRowAboveOutlined"
}
module InsertRowBelowOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsertRowBelowOutlined"
}
module InsertRowLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsertRowLeftOutlined"
}
module InsertRowRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsertRowRightOutlined"
}
module InsuranceOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InsuranceOutlined"
}
module InteractionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "InteractionOutlined"
}
module KeyOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "KeyOutlined"
}
module LaptopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LaptopOutlined"
}
module LayoutOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LayoutOutlined"
}
module LikeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LikeOutlined"
}
module LineOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LineOutlined"
}
module LinkOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LinkOutlined"
}
module Loading3QuartersOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "Loading3QuartersOutlined"
}
module LoadingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LoadingOutlined"
}
module LockOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "LockOutlined"
}
module MacCommandOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MacCommandOutlined"
}
module MailOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MailOutlined"
}
module ManOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ManOutlined"
}
module MedicineBoxOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MedicineBoxOutlined"
}
module MehOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MehOutlined"
}
module MenuOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MenuOutlined"
}
module MergeCellsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MergeCellsOutlined"
}
module MessageOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MessageOutlined"
}
module MobileOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MobileOutlined"
}
module MoneyCollectOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MoneyCollectOutlined"
}
module MonitorOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MonitorOutlined"
}
module MoreOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "MoreOutlined"
}
module NodeCollapseOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NodeCollapseOutlined"
}
module NodeExpandOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NodeExpandOutlined"
}
module NodeIndexOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NodeIndexOutlined"
}
module NotificationOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NotificationOutlined"
}
module NumberOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "NumberOutlined"
}
module OneToOneOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "OneToOneOutlined"
}
module PaperClipOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PaperClipOutlined"
}
module PartitionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PartitionOutlined"
}
module PayCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PayCircleOutlined"
}
module PercentageOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PercentageOutlined"
}
module PhoneOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PhoneOutlined"
}
module PictureOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PictureOutlined"
}
module PlaySquareOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PlaySquareOutlined"
}
module PoundCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PoundCircleOutlined"
}
module PoundOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PoundOutlined"
}
module PoweroffOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PoweroffOutlined"
}
module PrinterOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PrinterOutlined"
}
module ProfileOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ProfileOutlined"
}
module ProjectOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ProjectOutlined"
}
module PropertySafetyOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PropertySafetyOutlined"
}
module PullRequestOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PullRequestOutlined"
}
module PushpinOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "PushpinOutlined"
}
module QrcodeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "QrcodeOutlined"
}
module ReadOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ReadOutlined"
}
module ReconciliationOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ReconciliationOutlined"
}
module RedEnvelopeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RedEnvelopeOutlined"
}
module ReloadOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ReloadOutlined"
}
module RestOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RestOutlined"
}
module RobotOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RobotOutlined"
}
module RocketOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RocketOutlined"
}
module RotateLeftOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RotateLeftOutlined"
}
module RotateRightOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "RotateRightOutlined"
}
module SafetyCertificateOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SafetyCertificateOutlined"
}
module SafetyOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SafetyOutlined"
}
module SaveOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SaveOutlined"
}
module ScanOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ScanOutlined"
}
module ScheduleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ScheduleOutlined"
}
module SearchOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SearchOutlined"
}
module SecurityScanOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SecurityScanOutlined"
}
module SelectOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SelectOutlined"
}
module SendOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SendOutlined"
}
module SettingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SettingOutlined"
}
module ShakeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShakeOutlined"
}
module ShareAltOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShareAltOutlined"
}
module ShopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShopOutlined"
}
module ShoppingCartOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShoppingCartOutlined"
}
module ShoppingOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ShoppingOutlined"
}
module SisternodeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SisternodeOutlined"
}
module SkinOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SkinOutlined"
}
module SmileOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SmileOutlined"
}
module SolutionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SolutionOutlined"
}
module SoundOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SoundOutlined"
}
module SplitCellsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SplitCellsOutlined"
}
module StarOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "StarOutlined"
}
module SubnodeOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SubnodeOutlined"
}
module SwitcherOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SwitcherOutlined"
}
module SyncOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "SyncOutlined"
}
module TableOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TableOutlined"
}
module TabletOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TabletOutlined"
}
module TagOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TagOutlined"
}
module TagsOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TagsOutlined"
}
module TeamOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TeamOutlined"
}
module ThunderboltOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ThunderboltOutlined"
}
module ToTopOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ToTopOutlined"
}
module ToolOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "ToolOutlined"
}
module TrademarkCircleOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrademarkCircleOutlined"
}
module TrademarkOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrademarkOutlined"
}
module TransactionOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TransactionOutlined"
}
module TranslationOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TranslationOutlined"
}
module TrophyOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "TrophyOutlined"
}
module UngroupOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UngroupOutlined"
}
module UnlockOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UnlockOutlined"
}
module UploadOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UploadOutlined"
}
module UsbOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UsbOutlined"
}
module UserAddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UserAddOutlined"
}
module UserDeleteOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UserDeleteOutlined"
}
module UserOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UserOutlined"
}
module UserSwitchOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UserSwitchOutlined"
}
module UsergroupAddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UsergroupAddOutlined"
}
module UsergroupDeleteOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "UsergroupDeleteOutlined"
}
module VerifiedOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VerifiedOutlined"
}
module VideoCameraAddOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VideoCameraAddOutlined"
}
module VideoCameraOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "VideoCameraOutlined"
}
module WalletOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WalletOutlined"
}
module WhatsAppOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WhatsAppOutlined"
}
module WifiOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WifiOutlined"
}
module WomanOutlined = {
  include BaseIcon
  @module("@ant-design/icons")
  external make: React.componentLike<props, React.element> = "WomanOutlined"
}
