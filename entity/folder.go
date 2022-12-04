//This file is generated automatically, DO NOT EDIT IT.
//Generated time:

package entity

import (
    "context"
    "database/sql"
    "github.com/digimakergo/digimaker/core/db"
    "github.com/digimakergo/digimaker/core/contenttype"
    
    "github.com/digimakergo/digimaker/core/util"
    
	. "github.com/digimakergo/digimaker/core/db"
    
)



type Folder struct{
     contenttype.Metadata `boil:",bind" json:"metadata"`

	 ID int `boil:"id" json:"id" toml:"id" yaml:"id"`

     
          FolderType  string `boil:"folder_type" json:"folder_type" toml:"folder_type" yaml:"folder_type"`
     
    
                  
         
            DisplayType  string `boil:"display_type" json:"display_type" toml:"display_type" yaml:"display_type"`
         
    
                  
         
            Summary  string `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
         
    
                  
         
            Title  string `boil:"title" json:"title" toml:"title" yaml:"title"`
         
    
    
     contenttype.Location `boil:"location,bind" json:"location"`
    
}

func (c Folder ) GetID() int{
	 return c.ID
}

func (c *Folder ) GetMetadata() *contenttype.Metadata{
	 return &c.Metadata
}

func (c *Folder) GetLocation() *contenttype.Location{
    
    return &c.Location
    
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Folder) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    
         result["folder_type"]=c.FolderType
    

    
        
        
            result["display_type"]=c.DisplayType
        
        
    
        
        
            result["summary"]=c.Summary
        
        
    
        
        
            result["title"]=c.Title
        
        
    
	for key, value := range c.Metadata.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Folder) IdentifierList() []string {
	return []string{ "display_type","summary","title",}
}

//Get field value
func (c *Folder) Value(identifier string) interface{} {
    
    if util.Contains( c.Location.IdentifierList(), identifier ) {
        return c.Location.Field( identifier )
    }
    
    var result interface{}
	switch identifier {
    
      case "folder_type":
         result = c.FolderType
    
    
    
    case "display_type":
            result = (c.DisplayType)        
    
    
    
    case "summary":
            result = (c.Summary)        
    
    
    
    case "title":
            result = (c.Title)        
    
    
	case "id":
		result = c.ID
    }
	return result
}

//Set value to a field
func (c *Folder) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
          case "folder_type":
             c.FolderType = value.(string)
        
        
                        
            
            case "display_type":
            c.DisplayType = value.(string)
                    
        
                        
            
            case "summary":
            c.Summary = value.(string)
                    
        
                        
            
            case "title":
            c.Title = value.(string)
                    
             
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *Folder) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dmc_folder", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dmc_folder", c.ToDBValues(), Cond("id", c.ID), transaction...)
    if err != nil {
			return err
		}
	}

	return nil
}

func (c *Folder)StoreWithLocation(){

}

//Delete content only
func (c *Folder) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dmc_folder", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
        entity := &Folder{}
        entity.Metadata.Contenttype = "folder"
        return entity
	}

	newList := func() interface{} {
		return &[]Folder{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]Folder)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("folder",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
