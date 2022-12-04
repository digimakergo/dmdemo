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



type Role struct{
     contenttype.Metadata `boil:",bind" json:"metadata"`

     ID int `boil:"id" json:"id" toml:"id" yaml:"id"`

     
            
                Author  int `boil:"author" json:"author" toml:"author" yaml:"author"`
            
     
            
                Modified  int `boil:"modified" json:"modified" toml:"modified" yaml:"modified"`
            
     
            
                Published  int `boil:"published" json:"published" toml:"published" yaml:"published"`
            
     
    
             
         
            Identifier  string `boil:"identifier" json:"identifier" toml:"identifier" yaml:"identifier"`
                 
    
             
         
            Name  string `boil:"name" json:"name" toml:"name" yaml:"name"`
                 
    
             
         
            Summary  string `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
                 
    
             
         
            UnderFolder  int `boil:"under_folder" json:"under_folder" toml:"under_folder" yaml:"under_folder"`
                 
    
}

func (c Role ) GetID() int{
        return c.ID
}

func (c *Role ) GetMetadata() *contenttype.Metadata{
        return &c.Metadata
}

func (c *Role) GetLocation() *contenttype.Location{
    return nil
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Role) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    
         
         result["author"]=c.Author
         
    
         
         result["modified"]=c.Modified
         
    
         
         result["published"]=c.Published
         
    

    
        
        
            result["identifier"]=c.Identifier
        
        
    
        
        
            result["name"]=c.Name
        
        
    
        
        
            result["summary"]=c.Summary
        
        
    
        
        
            result["under_folder"]=c.UnderFolder
        
        
    

    for key, value := range c.Metadata.ToDBValues() {
		result[key] = value
	}

	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Role) IdentifierList() []string {
	return []string{ "identifier","name","summary","under_folder",}
}

//Get field value
func (c *Role) Value(identifier string) interface{} {
    
    var result interface{}
	switch identifier {
    
      
      case "author":
         result = c.Author
      
    
      
      case "modified":
         result = c.Modified
      
    
      
      case "published":
         result = c.Published
      
    
    
    
    case "identifier":        
            result = (c.Identifier)        
    
    
    
    case "name":        
            result = (c.Name)        
    
    
    
    case "summary":        
            result = (c.Summary)        
    
    
    
    case "under_folder":        
            result = (c.UnderFolder)        
    
    

    default:
    }
	return result
}

//Set value to a field
func (c *Role) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
         
          case "author":
             c.Author = value.(int)
        
        
         
          case "modified":
             c.Modified = value.(int)
        
        
         
          case "published":
             c.Published = value.(int)
        
        
        
            
            
            case "identifier":
            c.Identifier = value.(string)
                     
        
            
            
            case "name":
            c.Name = value.(string)
                     
        
            
            
            case "summary":
            c.Summary = value.(string)
                     
        
            
            
            case "under_folder":
            c.UnderFolder = value.(int)
                     
        
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *Role) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dmc_role", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dmc_role", c.ToDBValues(), Cond("id", c.ID), transaction...)
		return err
	}
	return nil
}


func (c *Role)StoreWithLocation(){

}

//Delete content only
func (c *Role) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dmc_role", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
    entity := &Role{}
    entity.Metadata.Contenttype = "role"
    return entity
	}

	newList := func() interface{} {
		return &[]Role{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]Role)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("role",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
