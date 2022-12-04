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



type Image struct{
     contenttype.Metadata `boil:",bind" json:"metadata"`

     ID int `boil:"id" json:"id" toml:"id" yaml:"id"`

     
            
     
            
     
            
     
            
     
            
     
            
                LocationId  int `boil:"location_id" json:"location_id" toml:"location_id" yaml:"location_id"`
            
     
    
             
         
            Image  string `boil:"image" json:"image" toml:"image" yaml:"image"`
                 
    
             
         
            Name  string `boil:"name" json:"name" toml:"name" yaml:"name"`
                 
    
}

func (c Image ) GetID() int{
        return c.ID
}

func (c *Image ) GetMetadata() *contenttype.Metadata{
        return &c.Metadata
}

func (c *Image) GetLocation() *contenttype.Location{
    return nil
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Image) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    
         
    
         
    
         
    
         
    
         
    
         
         result["location_id"]=c.LocationId
         
    

    
        
        
            result["image"]=c.Image
        
        
    
        
        
            result["name"]=c.Name
        
        
    

    for key, value := range c.Metadata.ToDBValues() {
		result[key] = value
	}

	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Image) IdentifierList() []string {
	return []string{ "image","name",}
}

//Get field value
func (c *Image) Value(identifier string) interface{} {
    
    var result interface{}
	switch identifier {
    
      
    
      
    
      
    
      
    
      
    
      
      case "location_id":
         result = c.LocationId
      
    
    
    
    case "image":        
            result = (c.Image)        
    
    
    
    case "name":        
            result = (c.Name)        
    
    

    default:
    }
	return result
}

//Set value to a field
func (c *Image) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
         
        
         
        
         
        
         
        
         
        
         
          case "location_id":
             c.LocationId = value.(int)
        
        
        
            
            
            case "image":
            c.Image = value.(string)
                     
        
            
            
            case "name":
            c.Name = value.(string)
                     
        
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *Image) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dmc_image", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dmc_image", c.ToDBValues(), Cond("id", c.ID), transaction...)
		return err
	}
	return nil
}


func (c *Image)StoreWithLocation(){

}

//Delete content only
func (c *Image) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dmc_image", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
    entity := &Image{}
    entity.Metadata.Contenttype = "image"
    return entity
	}

	newList := func() interface{} {
		return &[]Image{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]Image)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("image",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
