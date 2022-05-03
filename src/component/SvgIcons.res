module User = {
  @react.component
  let make = (
    ~className: option<string>=?,
    ~fill="#000",
    ~viewBox="0 0 1024 1024",
    ~width="200",
    ~height="200",
    ~style: option<ReactDOM.Style.t>=?,
    (),
  ) => {
    <SvgIcon fill viewBox width height ?style ?className>
      <path
        d="M512 32c-265.101 0-480 214.899-480 480s214.899 480 480 480c265.101 0 480-214.899 480-480 0.134-265.101-214.765-480-480-480v0 0zM222.201 831.732c45.1-116.51 157.315-199.732 289.799-199.732s244.698 83.087 289.933 199.597c-76.778 69.665-178.255 112.349-289.933 112.349-111.678 0.134-213.155-42.684-289.799-112.215v0 0zM367.973 440.053c0-79.597 64.43-144.027 144.027-144.027s144.027 64.43 144.027 144.027c0 79.597-64.43 144.027-144.027 144.027s-144.027-64.564-144.027-144.027v0 0zM838.174 794.818c-42.416-92.618-122.014-164.295-220.537-194.631 51.946-34.228 86.443-93.155 86.443-160.134 0-106.041-86.040-192.081-192.081-192.081-106.041 0-192.081 86.040-192.081 192.081 0 66.98 34.362 125.906 86.443 160.268-98.524 30.336-178.121 102.013-220.537 194.631-65.906-75.839-105.906-174.497-105.906-282.818 0-238.657 193.423-432.081 432.081-432.081 238.658 0 432.081 193.423 432.081 432.081 0 108.188-40.134 206.845-105.906 282.684v0 0zM838.174 794.818z"
      />
    </SvgIcon>
  }
}

module Language = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path
        d="M512 0a512 512 0 1 0 512 512A512.581818 512.581818 0 0 0 512 0z m442.181818 488.727273h-162.909091c-6.981818-152.901818-71.936-309.294545-180.596363-407.505455A443.112727 443.112727 0 0 1 954.181818 488.727273zM465.454545 93.090909v395.636364h-162.90909c6.656-145.92 64.162909-314.181818 162.90909-395.636364z m0 465.454546v372.363636c-91.857455-80.989091-149.666909-242.036364-162.90909-372.363636h162.90909z m69.818182 372.363636V558.545455h185.739637c-15.243636 132.421818-83.525818 291.141818-185.739637 372.363636z m0-442.181818V93.090909c109.917091 81.221818 178.501818 247.854545 186.181818 395.636364h-186.181818zM399.173818 84.945455C297.146182 181.527273 239.104 333.963636 232.750545 488.727273H70.981818A441.506909 441.506909 0 0 1 399.173818 84.945455zM72.308364 558.545455h160.139636c12.962909 142.429091 64.465455 277.410909 163.188364 372.363636A420.072727 420.072727 0 0 1 72.308364 558.545455z m532.945454 385.62909A615.214545 615.214545 0 0 0 791.272727 558.545455h162.909091a445.184 445.184 0 0 1-348.928 385.62909z"
      />
    </SvgIcon>
  }
}

module Notification = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path
        d="M858.44195555 888.73642667H165.55576889c-35.13799111 0-63.58812445-27.43182222-63.58812444-61.23747556V760.16071111c0-16.37489778 6.12124445-31.99089778 16.46478222-43.01596444l79.79690666-106.54833778V411.51715555c0-90.87089778 30.78826667-175.18136889 86.73735112-237.24942222 26.27697778-29.22837333 56.99128889-52.03399111 91.30666666-68.68081778 9.61422222-4.66375111 17.42961778-12.42339555 21.02840889-22.48704 16.83342222-47.11082667 61.73013333-80.85390222 114.60380445-80.85390222 0.03413333 0 0.06144 0.00455111 0.09557333 0.00910222a0.60074667 0.60074667 0 0 1 0.09102222-0.00910222c52.87480889 0 97.77265778 33.74307555 114.60835555 80.85390222 3.59537778 10.06364445 11.41191111 17.82328889 21.02613334 22.48704 34.31537778 16.64568889 65.03082667 39.45244445 91.30666666 68.68081778 55.94794667 62.06919111 86.73393778 146.37852445 86.73393778 237.24942222v199.07925334l79.79690667 106.54833778c10.34808889 11.02506667 16.46478222 26.64106667 16.46478222 43.01596444v67.34051556c0 33.80451555-28.44785778 61.2352-63.58926222 61.2352z m-0.69404444-128.57685334l-79.85834666-106.48348444c-10.34581333-10.83619555-16.46592-26.57621333-16.46592-43.08081778V411.51715555c0-74.62001778-24.78876445-143.31904-69.89596445-193.53144888-22.26403555-24.72504889-48.57287111-44.03882667-78.21880889-57.41909334a217.56928 217.56928 0 0 0-10.59271111-4.43278222c-18.01216-6.98595555-32.75662222-22.16504889-36.03342222-41.20689778a58.14499555 58.14499555 0 0 0-2.30286223-8.95089778c-6.07800889-17.72999111-21.39591111-31.81454222-39.68682666-35.84796444-0.54727111-0.12060445-1.06723555-0.06826667-1.61223111-0.17066666v0.11036444c-3.584-0.73955555-7.29315555-1.12412445-11.07854223-1.17987556-3.7888 0.05688889-7.50136889 0.44145778-11.0842311 1.17987556v-0.11150222c-0.54613333 0.1024-1.06268445 0.0512-1.60995556 0.17066666-18.29319111 4.03569778-33.61223111 18.12024889-39.68910222 35.84910222a57.86737778 57.86737778 0 0 0-2.30058667 8.95089778c-3.28021333 19.04298667-18.0224 34.22208-36.03342222 41.20689778a216.71025778 216.71025778 0 0 0-10.59043556 4.43278222c-29.65048889 13.38026667-55.95591111 32.69404445-78.22336 57.41909334-45.10264889 50.21240889-69.89368889 118.91256889-69.89368889 193.53144888v199.07925334c0 16.50460445-6.12124445 32.24462222-16.46592 43.08081778l-79.86062222 106.48348444-0.63260444 66.67036444 346.38279111 0.33450667 346.38165333-0.33450667-0.63488-66.67150222zM454.89265778 939.04554667c13.32451555 11.73504 30.36728889 18.16803555 47.92888889 19.85649778 3.04924445 0.29582222 6.11214222 0.19342222 9.18072888 0.19569777 3.06289778-0.00227555 6.12465778 0.1024 9.17504-0.19569777 17.56273778-1.6896 34.60437333-8.12145778 47.93116445-19.85649778 9.05784889-7.97582222 15.88224-17.57184 20.59605333-28.19072l66.32106667 0.06371555c-6.76408889 28.12700445-21.96138667 53.73724445-44.2368 73.41169778-24.42353778 21.67125333-55.67146667 34.02979555-88.70684445 36.42709333v0.00682667c-3.69777778 0.26510222-7.31136 0.99100445-11.05237333 0.99100445-0.00910222 0-0.01706667-0.00455111-0.02616889-0.00455112s-0.02275555 0.00455111-0.03185778 0.00455112c-3.74101333 0-7.35345778-0.72476445-11.05237333-0.98986667v-0.00796445c-33.03310222-2.39843555-64.28216889-14.75697778-88.70684444-36.42709333-22.27427555-19.67445333-37.46929778-45.28355555-44.2368-73.41169778l66.32106667-0.06371555c4.71608889 10.61774222 11.53706667 20.21489778 20.59605333 28.19072z"
      />
    </SvgIcon>
  }
}

module Help = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path
        d="M512 1021.724C230.514 1021.724 2.276 793.486 2.276 512S230.514 2.276 512 2.276 1021.724 230.514 1021.724 512 793.486 1021.724 512 1021.724z m0-67.925c243.94 0 441.8-197.746 441.8-441.799S755.94 70.2 512 70.2 70.2 268.06 70.2 512 268.06 953.8 512 953.8z"
      />
      <path
        d="M525.198 262.827c46.422 0 84.082 12.288 113.095 38.457 29.014 25.372 43.463 60.188 43.463 103.651 0 35.499-9.443 65.195-27.534 88.405-6.485 7.965-26.851 26.852-60.87 56.548-13.768 11.605-23.894 24.69-30.493 37.66-7.965 14.45-11.606 30.493-11.606 47.9v12.289h-77.596v-12.288c0-26.852 4.323-50.062 14.45-68.836 9.443-20.252 36.977-50.062 81.92-89.884l12.288-13.767c13.084-16.726 20.252-34.02 20.252-52.907 0-25.372-7.282-44.942-21.049-59.392-14.45-14.45-35.498-21.731-61.667-21.731-32.655 0-56.548 10.126-70.998 31.175-13.084 17.408-19.57 42.097-19.57 73.955h-76.117c0-52.906 15.246-94.208 45.625-124.7 30.72-31.29 72.818-46.535 126.407-46.535z m-12.97 424.05c15.246 0 28.216 4.323 38.456 14.45 10.127 9.443 15.247 21.73 15.247 36.977 0 15.246-5.803 27.534-15.93 37.66-10.125 9.444-23.21 14.45-37.66 14.45-14.45 0-27.534-5.12-37.66-15.246-10.126-10.126-15.246-22.528-15.246-36.978 0-15.246 5.12-27.534 15.246-36.978 9.899-10.012 22.983-14.336 37.547-14.336z"
      />
    </SvgIcon>
  }
}

module Happy = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path
        d="M512.22645533 1019.22281131c-279.69161443 0-507.21815325-227.52653881-507.21815325-507.2251392 0-279.69045049 227.5603035-507.21815325 507.21815325-507.21815325 279.66367175 0 507.22397525 227.52770389 507.22397525 507.21815325C1019.45043058 791.69627136 791.92389177 1019.22281131 512.22645533 1019.22281131L512.22645533 1019.22281131zM512.22645533 77.23825607c-239.73300793 0-434.75941603 195.02524302-434.75941604 434.75825095 0 239.73999389 195.02524302 434.76640085 434.75941604 434.76640085 239.73882994 0 434.76523691-195.02640697 434.7652369-434.76640085C946.99052829 272.26349909 751.96412131 77.23825607 512.22645533 77.23825607L512.22645533 77.23825607zM513.42567879 807.89394432c-100.9746523 0-194.62821774-45.65317291-256.90985358-125.24787598-12.31707705-15.76106211-9.56351943-38.51604423 6.19754268-50.83312242 15.7226405-12.35433472 38.51022336-9.60194105 50.86572203 6.19754269 48.43933127 61.91721131 121.29625885 97.41889536 199.84658887 97.41889536 79.38047203 0 152.70661006-36.11643221 201.14594134-99.12225906 12.21112605-15.87167005 34.92768768-18.87904427 50.79353571-6.66675314 15.87167005 12.21112605 18.87904427 34.96028729 6.66791822 50.79353572C709.75609629 761.44439296 615.4831269 807.89394432 513.42567879 807.89394432L513.42567879 807.89394432zM350.38595072 515.62445027c-30.02949746 0-54.34230784-24.31397319-54.34230784-54.34929265l0-72.45990229c0-30.03299043 24.31280925-54.34230784 54.34230784-54.34230784 30.03531947 0 54.34812871 24.30815232 54.34812871 54.34230784l0 72.45990229C404.73407943 491.27787634 380.38750549 515.62445027 350.38595072 515.62445027L350.38595072 515.62445027zM676.45958713 515.62445027c-30.00155477 0-54.34812871-24.31397319-54.34812871-54.34929265l0-72.45990229c0-30.03299043 24.34657394-54.34230784 54.34812871-54.34230784 29.99689785 0 54.34347179 24.30815232 54.34347178 54.34230784l0 72.45990229C730.80305891 491.27787634 706.45531989 515.62445027 676.45958713 515.62445027L676.45958713 515.62445027zM676.45958713 515.62445027"
      />
    </SvgIcon>
  }
}

module Sad = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path
        d="M979.27850667 312.88206222c-25.53969778-60.38186667-62.09308445-114.60266667-108.64753778-161.15598222-46.55331555-46.55331555-100.77297778-83.10784-161.15598222-108.64753778-62.53340445-26.44878222-128.93866667-39.85976889-197.37258667-39.85976889S377.26435555 16.62976 314.73095111 43.07854222c-60.38186667 25.53969778-114.60266667 62.09422222-161.15598222 108.64753778-46.55445333 46.55331555-83.10784 100.77411555-108.64753778 161.15598222-26.44992 62.53340445-39.86090667 128.93866667-39.86090666 197.37258667 0 68.43392 13.41098667 134.83918222 39.86090666 197.37258666 25.53969778 60.38186667 62.09308445 114.60266667 108.6464 161.15598223 46.55445333 46.55445333 100.77411555 83.10784 161.15712 108.64753777 62.53340445 26.44878222 128.93866667 39.85976889 197.37258667 39.8597689s134.83918222-13.41098667 197.37258667-39.8597689c60.38186667-25.53969778 114.60266667-62.09308445 161.15598222-108.64753777 46.55445333-46.55331555 83.10784-100.77411555 108.64753778-161.15598223 26.44878222-62.53340445 39.85976889-128.93866667 39.85976888-197.37258666 0-68.43392-13.41212445-134.83918222-39.86090666-197.37258667zM512.10353778 944.47274667c-239.42940445 0-434.21809778-194.78983111-434.21809778-434.21809778s194.78983111-434.21809778 434.21809778-434.21809778S946.32163555 270.82524445 946.32163555 510.25351111 751.53180445 944.47274667 512.10353778 944.47274667z"
      />
      <path
        d="M302.93560889 405.67011555m-87.15264 0a87.15264 87.15264 0 1 0 174.30528 0 87.15264 87.15264 0 1 0-174.30528 0Z"
      />
      <path
        d="M721.27146667 405.67011555m-87.15264 0a87.15264 87.15264 0 1 0 174.30528 0 87.15264 87.15264 0 1 0-174.30528 0Z"
      />
      <path
        d="M762.84131555 822.67249778c-18.52188445 7.82677333-39.88252445-0.84309333-47.70929777-19.36611556-34.55886222-81.78915555-114.25223111-134.63779555-203.02848-134.63779555-88.77624889 0-168.46961778 52.84864-203.02961778 134.63779555-7.82677333 18.52302222-29.18741333 27.19175111-47.70929778 19.36611556-18.52302222-7.82677333-27.19288889-29.18627555-19.36611555-47.70929778 45.97532445-108.80682667 151.99800889-179.11352889 270.10503111-179.11352889 118.10816 0 224.12970667 70.30670222 270.10389333 179.11352889 7.82677333 18.52302222-0.84423111 39.88252445-19.36611556 47.70929778z"
      />
    </SvgIcon>
  }
}

module MenuFold = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path
        d="M385.21904747 426.66666667h585.1428576c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808H385.21904747c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808z m-9.7523808 248.68571413c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808h585.1428576c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808H385.21904747c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667z m614.4-592.4571424H34.13333333c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808h955.73333334c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808z m0 770.43809493H34.13333333c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808h955.73333334c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808zM28.52571413 520.41142827L219.0628576 670.47619093c7.07047573 5.6076192 17.55428587 0.60952427 17.5542848-8.41142933V361.9352384c0-9.02095253-10.36190507-14.01904747-17.5542848-8.41142933L28.52571413 503.58857173a10.65447573 10.65447573 0 0 0 0 16.82285654z"
      />
    </SvgIcon>
  }
}

module MenuUnfold = {
  @react.component
  let make = (~fill="#000", ~viewBox="0 0 1024 1024", ~width="200", ~height="200", ()) => {
    <SvgIcon fill viewBox width height>
      <path d="M385.21904747 426.66666667h585.1428576c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808H385.21904747c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808z m-9.7523808 248.68571413c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808h585.1428576c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808H385.21904747c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667z m614.4-592.4571424H34.13333333c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808h955.73333334c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808z m0 770.43809493H34.13333333c-5.36380907 0-9.7523808 4.38857173-9.7523808 9.7523808v68.26666667c0 5.36380907 4.38857173 9.7523808 9.7523808 9.7523808h955.73333334c5.36380907 0 9.7523808-4.38857173 9.7523808-9.7523808v-68.26666667c0-5.36380907-4.38857173-9.7523808-9.7523808-9.7523808zM61.44 670.59809493L251.9771424 520.53333333a10.7763808 10.7763808 0 0 0 0-16.9447616L61.44 353.40190507c-7.07047573-5.6076192-17.55428587-0.60952427-17.55428587 8.41142826v300.25142827a10.84952427 10.84952427 0 0 0 17.55428587 8.53333333z"></path>      
    </SvgIcon>
  }
}
