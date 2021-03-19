//This file is generated automatically, DO NOT EDIT IT.
//Generated time:

package entity

import (
    "context"
    "database/sql"
    "github.com/digimakergo/digimaker/core/db"
    "github.com/digimakergo/digimaker/core/definition"
    "github.com/digimakergo/digimaker/core/contenttype"
	  "github.com/digimakergo/digimaker/core/fieldtype"
    
    "github.com/digimakergo/digimaker/core/util"
    
	. "github.com/digimakergo/digimaker/core/db"
    
)



type Frontpage struct{
     contenttype.ContentCommon `boil:",bind"`

     
    
         
         
         
            Mainarea  fieldtype.Text `boil:"mainarea" json:"mainarea" toml:"mainarea" yaml:"mainarea"`
         
        
    
         
         
    
         
         
         
            Sidearea  fieldtype.Text `boil:"sidearea" json:"sidearea" toml:"sidearea" yaml:"sidearea"`
         
        
    
         
         
    
         
         
    
         
         
         
            Title  fieldtype.Text `boil:"title" json:"title" toml:"title" yaml:"title"`
         
        
    
    
     contenttype.Location `boil:"location,bind"`
    
}

func (c *Frontpage ) TableName() string{
	 return "dm_frontpage"
}

func (c *Frontpage ) ContentType() string{
	 return "frontpage"
}

func (c *Frontpage ) GetName() string{
	 location := c.GetLocation()
     if location != nil{
         return location.Name
     }else{
         return ""
     }
}

func (c *Frontpage) GetLocation() *contenttype.Location{
    
    return &c.Location
    
}

func (c *Frontpage) ToMap() map[string]interface{}{
    result := map[string]interface{}{}
    for _, identifier := range c.IdentifierList(){
      result[identifier] = c.Value(identifier)
    }
    return result
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Frontpage) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    

    
        
        
            result["mainarea"]=c.Mainarea
        
        
    
        
    
        
        
            result["sidearea"]=c.Sidearea
        
        
    
        
    
        
    
        
        
            result["title"]=c.Title
        
        
    
	for key, value := range c.ContentCommon.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Frontpage) IdentifierList() []string {
	return append(c.ContentCommon.IdentifierList(),[]string{ "mainarea","mainarea_blocks","sidearea","sidearea_blocks","slideshow","title",}...)
}

func (c *Frontpage) Definition(language ...string) definition.ContentType {
	def, _ := definition.GetDefinition( c.ContentType(), language... )
    return def
}

//Get field value
func (c *Frontpage) Value(identifier string) interface{} {
    
    if util.Contains( c.Location.IdentifierList(), identifier ) {
        return c.Location.Field( identifier )
    }
    
    var result interface{}
	switch identifier {
    
    
    
    case "mainarea":
        
            result = &(c.Mainarea)
        
    
    
    
    case "mainarea_blocks":
        
            result = c.Relations.GetField("mainarea_blocks")
        
    
    
    
    case "sidearea":
        
            result = &(c.Sidearea)
        
    
    
    
    case "sidearea_blocks":
        
            result = c.Relations.GetField("sidearea_blocks")
        
    
    
    
    case "slideshow":
        
            result = c.Relations.GetField("slideshow")
        
    
    
    
    case "title":
        
            result = &(c.Title)
        
    
    
	case "cid":
		result = c.ContentCommon.CID
    default:
    	result = c.ContentCommon.Value( identifier )
    }
	return result
}

//Set value to a field
func (c *Frontpage) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
        
            
            
            
            case "mainarea":
            c.Mainarea = value.(fieldtype.Text)
            
            
        
            
            
        
            
            
            
            case "sidearea":
            c.Sidearea = value.(fieldtype.Text)
            
            
        
            
            
        
            
            
        
            
            
            
            case "title":
            c.Title = value.(fieldtype.Text)
            
            
        
	default:
		err := c.ContentCommon.SetValue(identifier, value)
        if err != nil{
            return err
        }
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to CID after success
func (c *Frontpage) Store(ctx context.Context, transaction ...*sql.Tx) error {
	handler := db.DBHanlder()
	if c.CID == 0 {
		id, err := handler.Insert(ctx, c.TableName(), c.ToDBValues(), transaction...)
		c.CID = id
		if err != nil {
			return err
		}
	} else {
		err := handler.Update(ctx, c.TableName(), c.ToDBValues(), Cond("id", c.CID), transaction...)
    if err != nil {
			return err
		}
	}

	err := c.StoreRelations(ctx, c.ContentType(), transaction...)
	if err != nil {
		return err
	}

	return nil
}

func (c *Frontpage)StoreWithLocation(){

}

//Delete content only
func (c *Frontpage) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	handler := db.DBHanlder()
	contentError := handler.Delete(ctx, c.TableName(), Cond("id", c.CID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
		return &Frontpage{}
	}

	newList := func() interface{} {
		return &[]Frontpage{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]Frontpage)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("frontpage",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
