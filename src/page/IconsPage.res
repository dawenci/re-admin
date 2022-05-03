// %%raw(`import 'antd/es/button/style/index.less'`)
Antd.Row.importStyle
Antd.Col.importStyle
Antd.Card.importStyle

module Styles = {
  let iconsPage = Emotion.css({
    "boxSizing": "border-box",
    "width": "100%",
    "padding": "16px",
  })
 
  let iconCard = Emotion.css({
    "textAlign": "center",
    "fontSize": "24px !important",
  })
}

@react.component
let make = () => {
  <div className={Styles.iconsPage}>
    <Antd.Row gutter={(8, 8)}>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.StepBackwardOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.StepForwardOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.FastBackwardOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.FastForwardOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.ShrinkOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.ArrowsAltOutlined />
        </Antd.Card>
      </Antd.Col>


      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.QuestionOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.QuestionCircleOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.PlusOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.PlusCircleOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.PauseOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.PauseCircleOutlined />
        </Antd.Card>
      </Antd.Col>


      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.EditOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.FormOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.CopyOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.ScissorOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.DeleteOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.SnippetsOutlined />
        </Antd.Card>
      </Antd.Col>


      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AreaChartOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.PieChartOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.BarChartOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.DotChartOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.LineChartOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.RadarChartOutlined />
        </Antd.Card>
      </Antd.Col>


      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AndroidOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AppleOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.WindowsOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.IeOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.ChromeOutlined />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.GithubOutlined />
        </Antd.Card>
      </Antd.Col>


      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AccountBookFilled />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AlertFilled />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AlipaySquareFilled />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AmazonCircleFilled />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.AmazonSquareFilled />
        </Antd.Card>
      </Antd.Col>
      <Antd.Col span={4}>
        <Antd.Card className={Styles.iconCard}>
          <AntdIcon.ApiFilled />
        </Antd.Card>
      </Antd.Col>

    </Antd.Row>
  </div>
}

let default = make
