open Antd

Antd.Row.importStyle
Antd.Col.importStyle
Antd.Card.importStyle
Antd.Form.importStyle
Antd.Checkbox.importStyle
Antd.Input.importStyle
Antd.Select.importStyle
Antd.InputNumber.importStyle
Antd.Switch.importStyle
Antd.Slider.importStyle
Antd.Tooltip.importStyle
Antd.Radio.importStyle
Antd.Checkbox.importStyle
Antd.Rate.importStyle
Antd.Upload.importStyle
Antd.Button.importStyle

let formPage = Emotion.css({
  "boxSizing": "border-box",
  "width": "100%",
  "padding": "16px",
})

@react.component
let make = () => {
  <div className={formPage}>
    <Antd.Card>
      <Antd.Form
        labelCol={ "span": 5 }
        wrapperCol={ "span": 8 }
        initialValues={{
          "input-number": 3,
        }}>
        <Antd.Form.Item label={`Plain text`->React.string}>
          <span className="ant-form-text"> {`China`->React.string} </span>
        </Antd.Form.Item>
        <Antd.Form.Item
          hasFeedback=true
          name="select"
          label={`select`->React.string}
          rules=[{"required": true, "message": `请选择国家`}]>
          <Antd.Select placeholder={"Please select a country"->React.string}>
            <Antd.Select.Option value="china"> {`China`->React.string} </Antd.Select.Option>
            <Antd.Select.Option value="usa"> {`U.S.A`->React.string} </Antd.Select.Option>
          </Antd.Select>
        </Antd.Form.Item>
        <Antd.Form.Item
          hasFeedback=true
          name="select-multiple"
          label={`select (multiple)`->React.string}
          rules=[{"required": true, "message": `请选择国家`, "type": "array"}]>
          <Antd.Select mode={#tags} placeholder={"Please select a country"->React.string}>
            <Antd.Select.Option value="red">{`Red`->React.string}</Antd.Select.Option>
            <Antd.Select.Option value="green">{`Green`->React.string}</Antd.Select.Option>
            <Antd.Select.Option value="blue">{`Blue`->React.string}</Antd.Select.Option>
          </Antd.Select>
        </Antd.Form.Item>

        <Antd.Form.Item
          name="input-number"
          label={`InputNumber`->React.string}>
          <Antd.InputNumber min={0.} max={10.} />
        </Antd.Form.Item>

        <Antd.Form.Item
          valuePropName="checked"
          name="switch"
          label={`Switch`->React.string}>
          <Antd.Switch />
        </Antd.Form.Item>

        <Antd.Form.Item
          name="slider"
          label={`Slider`->React.string}>
          <Antd.Slider marks={{ "0": "A", "20": "B", "40": "C", "60": "D", "80": "E", "100": "F" }} />
        </Antd.Form.Item>

        <Antd.Form.Item
          name="radio-group"
          label={`Radio.Group`->React.string}>
          <Antd.Radio.Group>
            <Antd.Radio value="a">{`Item 1`->React.string}</Antd.Radio>
            <Antd.Radio value="b">{`Item 2`->React.string}</Antd.Radio>
            <Antd.Radio value="c">{`Item 3`->React.string}</Antd.Radio>
          </Antd.Radio.Group>
        </Antd.Form.Item>

        <Antd.Form.Item
          name="radio-button"
          label={`Radio.Button`->React.string}>
          <Antd.Radio.Group>
            <Antd.Radio.Button value="a">{`Item 1`->React.string}</Antd.Radio.Button>
            <Antd.Radio.Button value="b">{`Item 2`->React.string}</Antd.Radio.Button>
            <Antd.Radio.Button value="c">{`Item 3`->React.string}</Antd.Radio.Button>
          </Antd.Radio.Group>
        </Antd.Form.Item>

        // checkbox-group
        <Antd.Form.Item
          name="checkbox-group"
          label={`Checkbox.Group`->React.string}>
          <Antd.Checkbox.Group>
            <Antd.Row>
              <Antd.Col span={8}>
                <Antd.Checkbox value="A">
                  {`A`->React.string}
                </Antd.Checkbox>
              </Antd.Col>
              <Antd.Col span={8}>
                <Antd.Checkbox value="B" disabled=true>
                  {`B`->React.string}
                </Antd.Checkbox>
              </Antd.Col>
              <Antd.Col span={8}>
                <Antd.Checkbox value="C">
                  {`C`->React.string}
                </Antd.Checkbox>
              </Antd.Col>
              <Antd.Col span={8}>
                <Antd.Checkbox value="D">
                  {`D`->React.string}
                </Antd.Checkbox>
              </Antd.Col>
              <Antd.Col span={8}>
                <Antd.Checkbox value="E">
                  {`E`->React.string}
                </Antd.Checkbox>
              </Antd.Col>
              <Antd.Col span={8}>
                <Antd.Checkbox value="F">
                  {`F`->React.string}
                </Antd.Checkbox>
              </Antd.Col>
            </Antd.Row>
          </Antd.Checkbox.Group>
        </Antd.Form.Item>

        <Form.Item
          name="rate"
          label={`Rate`->React.string}>
          <Rate />
        </Form.Item>

        <Form.Item
          name="upload"
          label={`Upload`->React.string}
          valuePropName="fileList"
          extra={`extra info`->React.string}
        >
          <Upload name="logo" action="/upload.do" listType={#picture}>
            <Antd.Button icon={<AntdIcon.UploadOutlined />}>
              {`Click to upload`->React.string}
            </Antd.Button>
          </Upload>
        </Form.Item>

        <Form.Item label={`Dragger`->React.string}>
          <Form.Item
            name="dragger"
            valuePropName="fileList"
            noStyle=true>
            <Upload.Dragger name="files" action="/upload.do">
              <p className="ant-upload-drag-icon">
                <AntdIcon.InboxOutlined />
              </p>
              <p className="ant-upload-text">{`Click or drag file to this area to upload`->React.string}</p>
              <p className="ant-upload-hint">{`Support for a single or bulk upload.`->React.string}</p>
            </Upload.Dragger>
          </Form.Item>
        </Form.Item>

        <Form.Item wrapperCol={{ "span": 12, "offset": 6 }}>
          <Antd.Button _type={#primary} htmlType={#submit}>
            {`Submit`->React.string}
          </Antd.Button>
        </Form.Item>

      </Antd.Form>
    </Antd.Card>
  </div>
}
