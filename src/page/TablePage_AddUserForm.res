// open Promise

Antd.Modal.importStyle
Antd.Form.importStyle
Antd.Input.importStyle
Antd.Button.importStyle

module Styles = {
}

@react.component
let make = (
  ~onCancel,
  ~onOk,
  ~visible: bool
) => {
  let (form, _) = Antd.Form.useForm()

  let onFieldsChange = (a, b) => {
    Js.log2(a, b)
  }

  let onOk = _ => {
    // TODO
    onOk()
  }

  let onCancel = _ => {
    // TODO
    onCancel()
  }

  <Antd.Modal
    visible={visible}
    title={`新增用户`->React.string}
    centered={true}
    mask={true}
    closable={false}
    okText={`保存`->React.string}
    cancelText={`取消`->React.string}
    onCancel
    onOk
    >
    <Antd.Form
      form={form}
      onFieldsChange={onFieldsChange}
      labelCol={ "span": 5 }
      wrapperCol={ "span": 17 }
    >
      <Antd.Form.Item name="username" label={`用户名`->React.string}>
        <Antd.Input allowClear={true} />
      </Antd.Form.Item>
      <Antd.Form.Item name="nickname" label={`昵称`->React.string}>
        <Antd.Input allowClear={true} />
      </Antd.Form.Item>
      <Antd.Form.Item name="email" label={`email`->React.string}>
        <Antd.Input allowClear={true} />
      </Antd.Form.Item>
      <Antd.Form.Item name="bio" label={`bio`->React.string}>
        <Antd.Input allowClear={true} />
      </Antd.Form.Item>
    </Antd.Form>
  </Antd.Modal>
}
