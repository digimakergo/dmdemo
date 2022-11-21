import { registerTool, registerCategory } from "dmeditor";
import { toolCarousel, toolEmbedContent, toolContentGallery, toolContentGrid } from "dmeditor-digimaker";
//import { toolData } from "dmeditor/Data";
import React from "react";
import { BrowseGalleryOutlined, GridViewOutlined, Grid4x4Outlined,ArrowUpwardOutlined,ArrowDownwardOutlined} from "@mui/icons-material";





// registerTool(toolData);
registerTool(toolContentGrid);
registerTool(toolEmbedContent);
registerTool(toolCarousel);
registerTool(toolContentGallery);

// registerCategory({identifier:'list', text:'List'});

// registerTool( { 
//     type: "list_files",
// menu: {
//   text: "Files",
//   category: "list",
//   icon: <GridViewOutlined />,
// },
// initData: {type:'data_link', content:[], settings:{contentType:'image', columns:3, space:5}},
// render: toolData.render })