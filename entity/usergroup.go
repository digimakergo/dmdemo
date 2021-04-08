//This file is generated automatically, DO NOT EDIT IT.
//Generated time:

package entity

import (
    "context"
    "database/sql"
    "github.com/digimakergo/digimaker/core/db"
    "github.com/digimakergo/digimaker/core/definition"
    "github.com/digimakergo/digimaker/core/contenttype"
    
    "github.com/digimakergo/digimaker/core/util"
    
	. "github.com/digimakergo/digimaker/core/db"
    
)



type Usergroup struct{
     contenttype.ContentCommon `boil:",bind"`

     
    
                  
         
            Summary  string `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
         
    
                  
         
            Title  string `boil:"title" json:"title" toml:"title" yaml:"title"`
         
    
    
     contenttype.Location `boil:"location,bind"`
    
}

func (c *Usergroup ) ContentType() string{
	 return "usergroup"
}

func (c *Usergroup ) GetName() string{
	 location := c.GetLocation()
     if location != nil{
         return location.Name
     }else{
         return ""
     }
}

func (c *Usergroup) GetLocation() *contenttype.Location{
    
    return &c.Location
    
}

func (c *Usergroup) ToMap() map[string]interface{}{
    result := map[string]interface{}{}
    for _, identifier := range c.IdentifierList(){
      result[identifier] = c.Value(identifier)
    }
    return result
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Usergroup) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    

    
        
        
            result["summary"]=c.Summary
        
        
    
        
        
            result["title"]=c.Title
        
        
    
	for key, value := range c.ContentCommon.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Usergroup) IdentifierList() []string {
	return append(c.ContentCommon.IdentifierList(),[]string{ "summary","title",}...)
}

func (c *Usergroup) Definition(language ...string) definition.ContentType {
	def, _ := definition.GetDefinition( c.ContentType(), language... )
    return def
}

//Get field value
func (c *Usergroup) Value(identifier string) interface{} {
    
    if util.Contains( c.Location.IdentifierList(), identifier ) {
        return c.Location.Field( identifier )
    }
    
    var result interface{}
	switch identifier {
    
    
    
    case "summary":
            result = (c.Summary)        
    
    
    
    case "title":
            result = (c.Title)        
    
    
	case "cid":
		result = c.ContentCommon.CID
    default:
    	result = c.ContentCommon.Value( identifier )
    }
	return result
}

//Set value to a field
func (c *Usergroup) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
        
                        
            
            case "summary":
            c.Summary = value.(string)
                    
        
                        
            
            case "title":
            c.Title = value.(string)
                    
        
	default:
		return c.ContentCommon.SetValue(identifier, value)        
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to CID after success
func (c *Usergroup) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.CID == 0 {
		id, err := db.Insert(ctx, "dm_usergroup", c.ToDBValues(), transaction...)
		c.CID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dm_usergroup", c.ToDBValues(), Cond("id", c.CID), transaction...)
    if err != nil {
			return err
		}
	}

	return nil
}

func (c *Usergroup)StoreWithLocation(){

}

//Delete content only
func (c *Usergroup) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dm_usergroup", Cond("id", c.CID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
		return &Usergroup{}
	}

	newList := func() interface{} {
		return &[]Usergroup{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]Usergroup)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("usergroup",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
