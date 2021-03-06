//This file is generated automatically, DO NOT EDIT IT.
//Generated time:

package entity

import (
    "context"
    "database/sql"
    "github.com/digimakergo/digimaker/core/db"
    "github.com/digimakergo/digimaker/core/definition"
    "github.com/digimakergo/digimaker/core/contenttype"
    
	. "github.com/digimakergo/digimaker/core/db"
    
)



type Image struct{
     contenttype.ContentEntity `boil:",bind"`

     
          Author  int `boil:"author" json:"author" toml:"author" yaml:"author"`
     
          Cuid  string `boil:"cuid" json:"cuid" toml:"cuid" yaml:"cuid"`
     
          LocationId  int `boil:"location_id" json:"location_id" toml:"location_id" yaml:"location_id"`
     
          Modified  int `boil:"modified" json:"modified" toml:"modified" yaml:"modified"`
     
          Published  int `boil:"published" json:"published" toml:"published" yaml:"published"`
     
    
             
         
            Image  string `boil:"image" json:"image" toml:"image" yaml:"image"`
                 
    
             
         
            Name  string `boil:"name" json:"name" toml:"name" yaml:"name"`
                 
    
}

func (c *Image ) ContentType() string{
	 return "image"
}

func (c *Image ) GetName() string{
	 return ""
}

func (c *Image) GetLocation() *contenttype.Location{
    return nil
}

func (c *Image) ToMap() map[string]interface{}{
    result := map[string]interface{}{}
    for _, identifier := range c.IdentifierList(){
      result[identifier] = c.Value(identifier)
    }
    return result
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Image) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    
         result["author"]=c.Author
    
         result["cuid"]=c.Cuid
    
         result["location_id"]=c.LocationId
    
         result["modified"]=c.Modified
    
         result["published"]=c.Published
    

    
        
        
            result["image"]=c.Image
        
        
    
        
        
            result["name"]=c.Name
        
        
    
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Image) IdentifierList() []string {
	return []string{ "image","name",}
}

func (c *Image) Definition(language ...string) definition.ContentType {
	def, _ := definition.GetDefinition( c.ContentType(), language... )
    return def
}

//Get field value
func (c *Image) Value(identifier string) interface{} {
    
    var result interface{}
	switch identifier {
    
      case "author":
         result = c.Author
    
      case "cuid":
         result = c.Cuid
    
      case "location_id":
         result = c.LocationId
    
      case "modified":
         result = c.Modified
    
      case "published":
         result = c.Published
    
    
    
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
        
          case "author":
             c.Author = value.(int)
        
          case "cuid":
             c.Cuid = value.(string)
        
          case "location_id":
             c.LocationId = value.(int)
        
          case "modified":
             c.Modified = value.(int)
        
          case "published":
             c.Published = value.(int)
        
        
            
            
            case "image":
            c.Image = value.(string)
                     
        
            
            
            case "name":
            c.Name = value.(string)
                     
        
	default:

	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *Image) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dm_image", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dm_image", c.ToDBValues(), Cond("id", c.ID), transaction...)
		return err
	}
	return nil
}


func (c *Image)StoreWithLocation(){

}

//Delete content only
func (c *Image) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dm_image", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
    entity := &Image{}
    entity.ContentEntity.ContentType = "Image"
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
