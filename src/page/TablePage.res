open Promise

Antd.Space.importStyle
Antd.Card.importStyle
Antd.Table.importStyle
Antd.Pagination.importStyle
Antd.Button.importStyle
Antd.Input.importStyle

module Styles = {
  let excelPage = Emotion.css({
    "boxSizing": "border-box",
    "display": "flex",
    "flexFlow": "column nowrap",
    "position": "relative",
    "margin": "24px",
  })
}

@react.component
let make = () => {
  let (isBusy, setBusy) = React.useState(() => false)
  let (users, setUsers) = React.useState(() => [])
  let (addUserFormVisible, setAddUserFormVisible) = React.useState(() => false)

  let loadUsers = React.useRef(Throttle.make(query => {
      setBusy(_ => true)
      let _ = UserApi.getUsers(query)->thenResolve(res => {
        switch res {
        | Result.Ok(users) => setUsers(_ => users)
        | _ => ()
        }
        setBusy(_ => false)
      })
    }, ~wait=500, ()))

  React.useEffect0(() => {
    loadUsers.current.schedule(Js.Dict.empty())
    Some(loadUsers.current.cancel)
  })

  let doSearch = query => {
    loadUsers.current.schedule(query)
  }

  let onFieldsChange = (_, fields) => {
    let query = Js.Dict.empty()
    Js.Array2.forEach(fields, field => {
      let key = field["name"]["0"]
      let value = field["value"]
      if !Js.Nullable.isNullable(value) {
        Js.Dict.set(query, key, value->Js.Nullable.toOption->Option.getExn)
      }
    })
    doSearch(query)
  }

  let onAddUserOk = () => {
    setAddUserFormVisible(prev => !prev)
  }

  let onAddUserCancel = () => {
    setAddUserFormVisible(prev => !prev)
  }

  let columns = [
    Antd.Table.Column.makeProps(~title="id", ~dataIndex="id", ()),
    Antd.Table.Column.makeProps(~title="username", ~dataIndex="username", ()),
    Antd.Table.Column.makeProps(~title="nickname", ~dataIndex="nickname", ()),
    Antd.Table.Column.makeProps(~title="email", ~dataIndex="email", ()),
    Antd.Table.Column.makeProps(~title="bio", ~dataIndex="bio", ()),
    Antd.Table.Column.makeProps(
      ~title="updatedAt",
      ~dataIndex="updatedAt",
      ~render=(text, _, _) => {
        DayJs.fromString(text)->DayJs.format("YYYY-MM-DD")->React.string
      },
      (),
    ),
    Antd.Table.Column.makeProps(~title="image", ~dataIndex="image", ()),
    Antd.Table.Column.makeProps(~title="roles", ~dataIndex="roles", ()),
  ]

  <div className={Styles.excelPage}>
    <Antd.Card style={ReactDOM.Style.make(~marginBottom="16px", ())}>
      <Antd.Space size={#middle}>
        <Antd.Form layout={#inline} onFieldsChange={onFieldsChange}>
          <Antd.Form.Item name="username" label={`用户名`->React.string}>
            <Antd.Input allowClear={true} />
          </Antd.Form.Item>
          <Antd.Form.Item name="nickname" label={`昵称`->React.string}>
            <Antd.Input allowClear={true} />
          </Antd.Form.Item>
          <Antd.Button _type={#primary} htmlType={#submit} icon={<AntdIcon.SearchOutlined />}>
            {`查询`->React.string}
          </Antd.Button>
        </Antd.Form>
      </Antd.Space>
    </Antd.Card>
    <Antd.Card>
      <div style={ReactDOM.Style.make(~marginBottom="16px", ())}>
        <Antd.Button _type={#primary} onClick={_ => setAddUserFormVisible(_ => true)}>
          {`新增用户`->React.string}
        </Antd.Button>
      </div>
      <Antd.Table
        loading={isBusy}
        columns={columns}
        dataSource={users}
        pagination={{"pageSize": 20}}
        rowKey={data => {
          data["id"]
        }}
      />
    </Antd.Card>
    <TablePage_AddUserForm
      visible={addUserFormVisible} onOk={onAddUserOk} onCancel={onAddUserCancel}
    />
  </div>
}
