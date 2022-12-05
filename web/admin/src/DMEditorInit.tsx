import { registerTool } from "dmeditor";
import { toolCarousel, toolEmbedContent, toolContentGallery, toolContentGrid } from "dmeditor-digimaker";
//import { toolData } from "dmeditor/Data";
import React from "react";
import { TabOutlined, ViewListOutlined} from "@mui/icons-material";

// registerTool(toolData);
registerTool(toolContentGrid);
registerTool(toolEmbedContent);
registerTool(toolCarousel);
registerTool(toolContentGallery);

registerTool({
    type: "tab",
    menu: { text: "Tab", category: "blocks", icon: <TabOutlined /> },
    initData: "test",
    view:()=><div>Not implemented</div>,
    render: () => <div>Not implemented</div>,
  });
  
  registerTool({
    type: "expandable_list",
    menu: {
      text: "Expandable list",
      category: "blocks",
      icon: <ViewListOutlined />,
    },
    initData: "test",
    view:()=><div>Not implemented</div>,
    render: () => <div>Not implemented</div>,
  });
