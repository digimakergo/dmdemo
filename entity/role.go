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
    
    "github.com/digimakergo/digimaker/core/fieldtype/fieldtypes"
    
)



type Role struct{
     contenttype.ContentEntity `boil:",bind"`

     
          Author  int `boil:"author" json:"author" toml:"author" yaml:"author"`
     
          Modified  int `boil:"modified" json:"modified" toml:"modified" yaml:"modified"`
     
          Published  int `boil:"published" json:"published" toml:"published" yaml:"published"`
     
    
             
         
            Identifier  string `boil:"identifier" json:"identifier" toml:"identifier" yaml:"identifier"`
                 
    
             
         
            Name  string `boil:"name" json:"name" toml:"name" yaml:"name"`
                 
    
             
         
            Parameters  fieldtypes.Map `boil:"parameters" json:"parameters" toml:"parameters" yaml:"parameters"`
                 
    
             
         
            Summary  string `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
                 
    
}

func (c *Role ) ContentType() string{
	 return "role"
}

func (c *Role ) GetName() string{
	 return ""
}

func (c *Role) GetLocation() *contenttype.Location{
    return nil
}

func (c *Role) ToMap() map[string]interface{}{
    result := map[string]interface{}{}
    for _, identifier := range c.IdentifierList(){
      result[identifier] = c.Value(identifier)
    }
    return result
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
        
        
    
        
        
            result["parameters"]=c.Parameters
        
        
    
        
        
            result["summary"]=c.Summary
        
        
    
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Role) IdentifierList() []string {
	return []string{ "identifier","name","parameters","summary",}
}

func (c *Role) Definition(language ...string) definition.ContentType {
	def, _ := definition.GetDefinition( c.ContentType(), language... )
    return def
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
    
    
    
    case "parameters":        
            result = (c.Parameters)        
    
    
    
    case "summary":        
            result = (c.Summary)        
    
    

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
                     
        
            
            
            case "parameters":
            c.Parameters = value.(fieldtypes.Map)
                     
        
            
            
            case "summary":
            c.Summary = value.(string)
                     
        
	default:
          return c.ContentEntity.SetValue(identifier, value)        
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *Role) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dm_role", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dm_role", c.ToDBValues(), Cond("id", c.ID), transaction...)
		return err
	}
	return nil
}


func (c *Role)StoreWithLocation(){

}

//Delete content only
func (c *Role) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dm_role", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
    entity := &Role{}
    entity.ContentEntity.ContentType = "Role"
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
