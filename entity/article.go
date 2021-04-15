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



type Article struct{
     contenttype.ContentCommon `boil:",bind"`

     
    
                  
         
            Body  string `boil:"body" json:"body" toml:"body" yaml:"body"`
         
    
                  
         
            Coverimage  string `boil:"coverimage" json:"coverimage" toml:"coverimage" yaml:"coverimage"`
         
    
                  
         
            Editors  contenttype.RelationList `boil:"-" json:"editors" toml:"editors" yaml:"editors"`
         
    
                  
         
            RelatedArticles  contenttype.RelationList `boil:"-" json:"related_articles" toml:"related_articles" yaml:"related_articles"`
         
    
                  
         
    
                  
         
            Summary  string `boil:"summary" json:"summary" toml:"summary" yaml:"summary"`
         
    
                  
         
            Title  string `boil:"title" json:"title" toml:"title" yaml:"title"`
         
    
                  
         
            UsefulResources  contenttype.RelationList `boil:"-" json:"useful_resources" toml:"useful_resources" yaml:"useful_resources"`
         
    
    
     contenttype.Location `boil:"location,bind"`
    
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
        
        
    
        
    
        
    
        
        
        
    
        
        
            result["summary"]=c.Summary
        
        
    
        
        
            result["title"]=c.Title
        
        
    
        
    
	for key, value := range c.ContentCommon.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *Article) IdentifierList() []string {
	return append(c.ContentCommon.IdentifierList(),[]string{ "body","coverimage","editors","related_articles","summary","title","useful_resources",}...)
}

func (c *Article) Definition(language ...string) definition.ContentType {
	def, _ := definition.GetDefinition( c.ContentType(), language... )
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
            result = (c.Body)        
    
    
    
    case "coverimage":
            result = (c.Coverimage)        
    
    
    
    case "editors":
            result = (c.Editors)        
    
    
    
    case "related_articles":
            result = (c.RelatedArticles)        
    
    
    
    
    
    case "summary":
            result = (c.Summary)        
    
    
    
    case "title":
            result = (c.Title)        
    
    
    
    case "useful_resources":
            result = (c.UsefulResources)        
    
    
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
            c.Body = value.(string)
                    
        
                        
            
            case "coverimage":
            c.Coverimage = value.(string)
                    
        
                        
            
            case "editors":
            c.Editors = value.(contenttype.RelationList)
                    
        
                        
            
            case "related_articles":
            c.RelatedArticles = value.(contenttype.RelationList)
                    
        
                        
                    
        
                        
            
            case "summary":
            c.Summary = value.(string)
                    
        
                        
            
            case "title":
            c.Title = value.(string)
                    
        
                        
            
            case "useful_resources":
            c.UsefulResources = value.(contenttype.RelationList)
                    
        
	default:
		return c.ContentCommon.SetValue(identifier, value)        
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to CID after success
func (c *Article) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.CID == 0 {
		id, err := db.Insert(ctx, "dm_article", c.ToDBValues(), transaction...)
		c.CID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dm_article", c.ToDBValues(), Cond("id", c.CID), transaction...)
    if err != nil {
			return err
		}
	}

	return nil
}

func (c *Article)StoreWithLocation(){

}

//Delete content only
func (c *Article) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dm_article", Cond("id", c.CID), transaction...)
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
