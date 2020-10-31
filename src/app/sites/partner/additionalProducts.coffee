import { copy } from "../../../utils/basic.util"

import { htmlRedTop, htmlRedBtm } from "../../components/html.component"
import { iconNavToggle } from "../../components/icon.component"
import { imgMobileLogo, imgLogo } from "../../components/img.component"
import { lang } from "../../components/lang.component"
import { navMain, navPartner } from "../../components/nav.component"
import { navMobile } from "../../components/list.component"
import {
  grid24
  gridHeader
  gridMain
  gridFooter
} from "../../components/grid.component"

navMobileWrapper = copy grid24
navMobileWrapper.style = {
  ...navMobileWrapper.style
  background: "#fff"
  position: "absolute"
  top: 0
  bottom: 0
  left: 0
  right: 0
  zIndex: 9999
}

export partnerAdditionalProducts = [
  { ...copy(grid24), id: "app" }
  { ...copy(htmlRedTop), parentId: "app" }
  { ...gridHeader, id: "header", parentId: "app" }
  { ...imgMobileLogo, parentId: "header", media: max: "l" }
  { ...imgLogo, parentId: "header", media: min: "l" }
  { ...navMain, parentId: "header", media: min: "l" }
  { ...navPartner, parentId: "header", media: min: "l" }
  { ...gridMain, id: "main", parentId: "app" }
  { ...gridFooter, id: "footer", parentId: "app" }
  { ...lang, media: min: "l", parentId: "footer" }
  { ...iconNavToggle, parentId: "footer", media: max: "l" }
  {
    ...navMobileWrapper
    id: "navMobileWrapper"
    className: "hidden"
    media: max: "l"
    parentId: "app"
  }
  {
    ...copy(htmlRedTop)
    id: "redTopNavMobile"
    parentId: "navMobileWrapper"
    media: max: "l"
  }
  {
    ...navMobile
    id: "navMobile"
    parentId: "navMobileWrapper"
    media: max: "l"
  }
,
  id: "navMobileFooter"
  ui: "grid"
  style:
    alignItems: "center"
    gridColumn: "2 / 24"
    gridRow: "-4 / -2"
    gridTemplateColumns: "repeat(24, 1fr)"
  media: max: "l"
  parentId: "navMobileWrapper"
,
  id: "langMobile"
  ui: "lang"
  style:
    display: "inline-grid"
    gridArea: "1/1/2/3"
    gridTemplateColumns: "1fr 1fr"
  parentId: "navMobileFooter"
,
  id: "iconNavToggleX"
  ui: "icon"
  icon: "close"
  events: click: [name: "ui-list-toggle", args: toToggle: "navMobileWrapper"]
  parentId: "navMobileFooter"
,
  {
    ...copy(htmlRedBtm)
    id: "redBtmNavMobile"
    media: max: "l"
    parentId: "navMobileWrapper"
  }
]
