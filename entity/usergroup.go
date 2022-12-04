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



type Usergroup struct{
     contenttype.Metadata `boil:",bind" json:"metadata"`

	 ID int `boil:"id" json:"id" toml:"id" yaml:"id"`

     
    
                  
         
            Summary  string `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
         
    
                  
         
            Title  string `boil:"title" json:"title" toml:"title" yaml:"title"`
         
    
    
     contenttype.Location `boil:"location,bind" json:"location"`
    
}

func (c Usergroup ) GetID() int{
	 return c.ID
}

func (c *Usergroup ) GetMetadata() *contenttype.Metadata{
	 return &c.Metadata
}

func (c *Usergroup) GetLocation() *contenttype.Location{
    
    return &c.Location
    
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Usergroup) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    

    
        
        
            result["summary"]=c.Summary
        
        
    
        
        
            result["title"]=c.Title
        
        
    
	for key, value := range c.Metadata.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Usergroup) IdentifierList() []string {
	return []string{ "summary","title",}
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
    
    
	case "id":
		result = c.ID
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
                    
             
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *Usergroup) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dmc_usergroup", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dmc_usergroup", c.ToDBValues(), Cond("id", c.ID), transaction...)
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
	contentError := db.Delete(ctx, "dmc_usergroup", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
        entity := &Usergroup{}
        entity.Metadata.Contenttype = "usergroup"
        return entity
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
