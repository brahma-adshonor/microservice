package model

import (
	"context"

	"gorm.io/gorm"
)

type User struct {
	userDB *gorm.DB
}

func NewUserModel(db *gorm.DB) *User {
	return &User{
		userDB: db,
	}
}

// ResolveUserID 根据openID获取UserID
func (t *User) ResolveUserID(ctx context.Context, openID string) (int32, error) {
	var user TUser
	result := t.userDB.WithContext(ctx).Where("open_id = ?", openID).First(&user)
	if result.RowsAffected == 1 {
		return user.ID, nil
	}
	if result.Error != nil {
		return 0, result.Error
	}
	user.OpenID = openID
	result = t.userDB.WithContext(ctx).Create(&user)
	if result.Error != nil {
		return 0, result.Error
	}
	return user.ID, nil
}
