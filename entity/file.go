//This file is generated automatically, DO NOT EDIT IT.
//Generated time:

package entity

import (
    "context"
    "database/sql"
    "github.com/digimakergo/digimaker/core/db"
    "github.com/digimakergo/digimaker/core/contenttype"
    
	. "github.com/digimakergo/digimaker/core/db"
    
)



type File struct{
     contenttype.Metadata `boil:",bind" json:"metadata"`

     ID int `boil:"id" json:"id" toml:"id" yaml:"id"`

     
    
             
         
            Filetype  string `boil:"filetype" json:"filetype" toml:"filetype" yaml:"filetype"`
                 
    
             
         
            Path  string `boil:"path" json:"path" toml:"path" yaml:"path"`
                 
    
             
         
            Title  string `boil:"title" json:"title" toml:"title" yaml:"title"`
                 
    
}

func (c File ) GetID() int{
        return c.ID
}

func (c *File ) GetMetadata() *contenttype.Metadata{
        return &c.Metadata
}

func (c *File) GetLocation() *contenttype.Location{
    return nil
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *File) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    

    
        
        
            result["filetype"]=c.Filetype
        
        
    
        
        
            result["path"]=c.Path
        
        
    
        
        
            result["title"]=c.Title
        
        
    

    for key, value := range c.Metadata.ToDBValues() {
		result[key] = value
	}

	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *File) IdentifierList() []string {
	return []string{ "filetype","path","title",}
}

//Get field value
func (c *File) Value(identifier string) interface{} {
    
    var result interface{}
	switch identifier {
    
    
    
    case "filetype":        
            result = (c.Filetype)        
    
    
    
    case "path":        
            result = (c.Path)        
    
    
    
    case "title":        
            result = (c.Title)        
    
    

    default:
    }
	return result
}

//Set value to a field
func (c *File) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
        
            
            
            case "filetype":
            c.Filetype = value.(string)
                     
        
            
            
            case "path":
            c.Path = value.(string)
                     
        
            
            
            case "title":
            c.Title = value.(string)
                     
        
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *File) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dmc_file", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dmc_file", c.ToDBValues(), Cond("id", c.ID), transaction...)
		return err
	}
	return nil
}


func (c *File)StoreWithLocation(){

}

//Delete content only
func (c *File) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dmc_file", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
    entity := &File{}
    entity.Metadata.Contenttype = "file"
    return entity
	}

	newList := func() interface{} {
		return &[]File{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]File)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("file",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
