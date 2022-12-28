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
    name:"Tab", 
    menu: { category: "blocks", icon: <TabOutlined /> },
    initData:  ()=>{
      return {
        type:'tab', 
        data:'tab',
       
     }
    },
    view:()=><div>Not implemented</div>,
    render: () => <div>Not implemented</div>,
  });
  
  registerTool({
    type: "expandable_list",
    name:"Expandable list",
    menu: {
      category: "blocks",
      icon: <ViewListOutlined />,
    },
    initData: ()=>{
      return {
        type:'expandable_list', 
        data:'ddd',
     }
    },
    view:()=><div>Not implemented</div>,
    render: () => <div>Not implemented</div>,
  });
