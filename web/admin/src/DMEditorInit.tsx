import { registerTool, registerCategory } from "dmeditor";
import { toolContentGallery } from "./dmeditor_content/Gallery";
import { toolContentGrid } from "./dmeditor_content/ContentGrid";
import { toolData } from "./dmeditor_content/Data";
import React from "react";
import { BrowseGalleryOutlined, GridViewOutlined, Grid4x4Outlined,ArrowUpwardOutlined,ArrowDownwardOutlined} from "@mui/icons-material";



registerCategory({identifier:'content', text:'Content'});

registerCategory({identifier:'list', text:'List'});

registerTool(toolData);
registerTool(toolContentGallery);
registerTool(toolContentGrid);

registerTool( { 
    type: "list_files",
menu: {
  text: "Files",
  category: "list",
  icon: <GridViewOutlined />,
},
initData: {type:'data_link', content:[], settings:{contentType:'image', columns:3, space:5}},
render: toolData.render })