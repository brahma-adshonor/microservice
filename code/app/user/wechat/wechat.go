package wechat

import (
	"context"
	"fmt"
	"sync"

	"github.com/brahma-adshonor/microservice/code/app/user/config"

	"github.com/medivhzhan/weapp/v2"
)

type Service struct {
	AppID     string
	AppSecret string
}

var wechatInstance *Service
var wechatOnce sync.Once

func GetWechatInstance() *Service {
	wechatOnce.Do(func() {
		wechatInstance = &Service{
			AppID:     config.AppID,
			AppSecret: config.AppSecret,
		}
	})
	return wechatInstance
}

func (s *Service) Resolve(ctx context.Context, code string) (string, error) {
	resp, err := weapp.Login(s.AppID, s.AppSecret, code)
	if err != nil {
		return "", fmt.Errorf("weapp.Login: %v", err)
	}
	if err := resp.GetResponseError(); err != nil {
		return "", fmt.Errorf("weapp.Login: %v", err)
	}
	return resp.OpenID, nil
}
