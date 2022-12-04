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



type User struct{
     contenttype.Metadata `boil:",bind" json:"metadata"`

	 ID int `boil:"id" json:"id" toml:"id" yaml:"id"`

     
    
                  
         
            Email  string `boil:"email" json:"email" toml:"email" yaml:"email"`
         
    
                  
         
            Firstname  string `boil:"firstname" json:"firstname" toml:"firstname" yaml:"firstname"`
         
    
                  
         
            Lastname  string `boil:"lastname" json:"lastname" toml:"lastname" yaml:"lastname"`
         
    
                  
         
            Login  string `boil:"login" json:"login" toml:"login" yaml:"login"`
         
    
                  
         
            Password  string `boil:"password" json:"-" toml:"password" yaml:"password"`
         
    
    
     contenttype.Location `boil:"location,bind" json:"location"`
    
}

func (c User ) GetID() int{
	 return c.ID
}

func (c *User ) GetMetadata() *contenttype.Metadata{
	 return &c.Metadata
}

func (c *User) GetLocation() *contenttype.Location{
    
    return &c.Location
    
}

//Get map of the all fields(including data_fields)
//todo: cache this? (then you need a reload?)
func (c *User) ToDBValues() map[string]interface{} {
	result := make(map[string]interface{})
    

    
        
        
            result["email"]=c.Email
        
        
    
        
        
            result["firstname"]=c.Firstname
        
        
    
        
        
            result["lastname"]=c.Lastname
        
        
    
        
        
            result["login"]=c.Login
        
        
    
        
        
            result["password"]=c.Password
        
        
    
	for key, value := range c.Metadata.ToDBValues() {
		result[key] = value
	}
	return result
}

//Get identifier list of fields(NOT including data_fields )
func (c *User) IdentifierList() []string {
	return []string{ "email","firstname","lastname","login","password",}
}

//Get field value
func (c *User) Value(identifier string) interface{} {
    
    if util.Contains( c.Location.IdentifierList(), identifier ) {
        return c.Location.Field( identifier )
    }
    
    var result interface{}
	switch identifier {
    
    
    
    case "email":
            result = (c.Email)        
    
    
    
    case "firstname":
            result = (c.Firstname)        
    
    
    
    case "lastname":
            result = (c.Lastname)        
    
    
    
    case "login":
            result = (c.Login)        
    
    
    
    case "password":
            result = (c.Password)        
    
    
	case "id":
		result = c.ID
    }
	return result
}

//Set value to a field
func (c *User) SetValue(identifier string, value interface{}) error {
	switch identifier {
        
        
                        
            
            case "email":
            c.Email = value.(string)
                    
        
                        
            
            case "firstname":
            c.Firstname = value.(string)
                    
        
                        
            
            case "lastname":
            c.Lastname = value.(string)
                    
        
                        
            
            case "login":
            c.Login = value.(string)
                    
        
                        
            
            case "password":
            c.Password = value.(string)
                    
             
	}
	//todo: check if identifier exist
	return nil
}

//Store content.
//Note: it will set id to ID after success
func (c *User) Store(ctx context.Context, transaction ...*sql.Tx) error {
	if c.ID == 0 {
		id, err := db.Insert(ctx, "dmc_user", c.ToDBValues(), transaction...)
		c.ID = id
		if err != nil {
			return err
		}
	} else {
		err := db.Update(ctx, "dmc_user", c.ToDBValues(), Cond("id", c.ID), transaction...)
    if err != nil {
			return err
		}
	}

	return nil
}

func (c *User)StoreWithLocation(){

}

//Delete content only
func (c *User) Delete(ctx context.Context, transaction ...*sql.Tx) error {
	contentError := db.Delete(ctx, "dmc_user", Cond("id", c.ID), transaction...)
	return contentError
}

func init() {
	new := func() contenttype.ContentTyper {
        entity := &User{}
        entity.Metadata.Contenttype = "user"
        return entity
	}

	newList := func() interface{} {
		return &[]User{}
	}

    toList := func(obj interface{}) []contenttype.ContentTyper {
        contentList := *obj.(*[]User)
        list := make([]contenttype.ContentTyper, len(contentList))
        for i, _ := range contentList {
            list[i] = &contentList[i]
        }
        return list
    }

	contenttype.Register("user",
		contenttype.ContentTypeRegister{
			New:            new,
			NewList:        newList,
            ToList:         toList})
}
