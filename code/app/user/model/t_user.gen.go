// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package model

import (
	"time"
)

const TableNameTUser = "t_user"

// TUser mapped from table <t_user>
type TUser struct {
	ID        int32     `gorm:"column:id;primaryKey;autoIncrement:true" json:"id"`                      // 主键id
	Username  string    `gorm:"column:username;not null" json:"username"`                               // 用户名
	Password  string    `gorm:"column:password;not null" json:"password"`                               // 密码
	Phone     string    `gorm:"column:phone;not null" json:"phone"`                                     // 手机号
	Email     string    `gorm:"column:email;not null" json:"email"`                                     // 邮箱
	Gender    int32     `gorm:"column:gender;default:1" json:"gender"`                                  // 性别：0->未知；1->男；2->女
	Status    int32     `gorm:"column:status;default:1" json:"status"`                                  // 帐号启用状态:0->禁用；1->启用
	CreatedAt time.Time `gorm:"column:created_at;not null;default:CURRENT_TIMESTAMP" json:"created_at"` // 创建时间
	UpdatedAt time.Time `gorm:"column:updated_at;not null;default:CURRENT_TIMESTAMP" json:"updated_at"` // 更新时间
}

// TableName TUser's table name
func (*TUser) TableName() string {
	return TableNameTUser
}
