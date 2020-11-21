//This file is generated automatically, DO NOT EDIT IT.
//Generated time:

package entity

import (
    "database/sql"
    "github.com/digimakergo/digimaker/core/db"
    "github.com/digimakergo/digimaker/core/contenttype"
	  "github.com/digimakergo/digimaker/core/fieldtype"
    
    "github.com/digimakergo/digimaker/core/util"
    
	. "github.com/digimakergo/digimaker/core/db"
    
)



type Article struct{
     contenttype.ContentCommon `boil:",bind"`

     
    
         
         
         
            Body  fieldtype.RichText `boil:"body" json:"body" toml:"body" yaml:"body"`
         
        
    
         
         
         
            Coverimage  fieldtype.Image `boil:"coverimage" json:"coverimage" toml:"coverimage" yaml:"coverimage"`
         
        
    
         
         
    
         
         
         
            OfflineTime  fieldtype.Text `boil:"offline_time" json:"offline_time" toml:"offline_time" yaml:"offline_time"`
         
        
    
         
         
         
            OnlineTime  fieldtype.Text `boil:"online_time" json:"online_time" toml:"online_time" yaml:"online_time"`
         
        
    
         
         
    
         
         
         
        
    
         
         
         
            Summary  fieldtype.RichText `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
         
        
    
         
         
         
            Title  fieldtype.Text `boil:"title" json:"title" toml:"title" yaml:"title"`
         
        
    
         
         
    
    
     contenttype.Location `boil:"location,bind"`
    
}

func (c *Article ) TableName() string{
	 return "dm_article"
}

func (c *Article ) ContentType() string{
	 return "article"
}

func (c *Article ) GetName() string{
	 location := c.GetLocation()
     if location != nil{
         return location.Name
     }else{
         return ""
     }
}

func (c *Article) GetLocation() *contenttype.Location{
    
    return &c.Location
    
}

func (c *Article) ToMap() map[string]interface{}{
    result := map[string]interface{}{}
    for _, identifier := range c.IdentifierList(){
      result[identifier] = c.Value(identifier)
    }
    return result
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *Article) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    

    
        
        
            result["body"]=c.Body
        
        
    
        
        
            result["coverimage"]=c.Coverimage
        
        
    
        
    
        
        
            result["offline_time"]=c.OfflineTime
        
        
    
        
        
            result["online_time"]=c.OnlineTime
        
        
    
        
    
        
        
        
    
        
        
            result["summary"]=c.Summary
        
        
    
        
        
            result["title"]=c.Title
        
        
    
        
    
	for key, value := range c.ContentCommon.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Article) IdentifierList() []string {
	return append(c.ContentCommon.IdentifierList(),[]string{ "body","coverimage","editors","offline_time","online_time","related_articles","summary","title","useful_resources",}...)
}

func (c *Article) Definition(language ...string) contenttype.ContentType {
	def, _ := contenttype.GetDefinition( c.ContentType(), language... )
    return def
}

//Get field value
func (c *Article) Value(identifier string) interface{} {
    
    if util.Contains( c.Location.IdentifierList(), identifier ) {
        return c.Location.Field( identifier )
    }
    
    var result interface{}
	switch identifier {
    
    
    
    case "body":
        
            result = &(c.Body)
        
    
    
    
    case "coverimage":
        
            result = &(c.Coverimage)
        
    
    
    
    case "editors":
        
            result = c.Relations.GetField("editors")
        
    
    
    
    case "offline_time":
        
            result = &(c.OfflineTime)
        
    
    
    
    case "online_time":
        
            result = &(c.OnlineTime)
        
    
    
    
    case "related_articles":
        
            result = c.Relations.GetField("related_articles")
        
    
    
    
    
    
    case "summary":
        
            result = &(c.Summary)
        
    
    
    
    case "title":
        
            result = &(c.Title)
        
    
    
    
    case "useful_resources":
        
            result = c.Relations.GetField("useful_resources")
        
    
    
	case "cid":
		result = c.ContentCommon.CID
    default:
    	result = c.ContentCommon.Value( identifier )
    }
	return result
}

//Set value to a field
func (c *Article) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
        
            
            
            
            case "body":
            c.Body = value.(fieldtype.RichText)
            
            
        
            
            
            
            case "coverimage":
            c.Coverimage = value.(fieldtype.Image)
            
            
        
            
            
        
            
            
            
            case "offline_time":
            c.OfflineTime = value.(fieldtype.Text)
            
            
        
            
            
            
            case "online_time":
            c.OnlineTime = value.(fieldtype.Text)
            
            
        
            
            
        
            
            
            
            
        
            
            
            
            case "summary":
            c.Summary = value.(fieldtype.RichText)
            
            
        
            
            
            
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
func (c *Article) Store(transaction ...*sql.Tx) error {
	handler := db.DBHanlder()
	if c.CID == 0 {
		id, err := handler.Insert(c.TableName(), c.ToDBValues(), transaction...)
		c.CID = id
		if err != nil {
			return err
		}
	} else {
		err := handler.Update(c.TableName(), c.ToDBValues(), Cond("id", c.CID), transaction...)
    if err != nil {
			return err
		}
	}

	err := c.StoreRelations(c.ContentType(), transaction...)
	if err != nil {
		return err
	}

	return nil
}

func (c *Article)StoreWithLocation(){

}

//Delete content only
func (c *Article) Delete(transaction ...*sql.Tx) error {
	handler := db.DBHanlder()
	contentError := handler.Delete(c.TableName(), Cond("id", c.CID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
		return &Article{}
	}

	newList := func() interface{} {
		return &[]Article{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]Article)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("article",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
