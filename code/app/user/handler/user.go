package handler

import (
	"context"
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/brahma-adshonor/microservice/code/app/user/config"

	"github.com/brahma-adshonor/microservice/code/app/user/wechat"

	"go.uber.org/zap"

	"github.com/brahma-adshonor/microservice/code/app/user/svc"
	userpb "github.com/brahma-adshonor/microservice/code/proto/user"
)

func Login(s *svc.ServiceContext) func(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	return func(w http.ResponseWriter, r *http.Request) {
		var request userpb.LoginRequest
		err := json.NewDecoder(r.Body).Decode(&request)
		if err != nil {
			s.Logger.Error("json decode error", zap.Error(err))
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}

		openID, err := wechat.GetWechatInstance().Resolve(ctx, request.Code)
		if err != nil {
			s.Logger.Error("wechat resolve error", zap.Error(err))
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		userID, err := s.User.ResolveUserID(ctx, openID)
		if err != nil {
			s.Logger.Error("can't resolve user id", zap.Error(err))
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		token, err := s.TokenGenerator.GenerateToken(strconv.Itoa(int(userID)), config.TokenExpire)
		if err != nil {
			s.Logger.Error("can't generate token", zap.Error(err))
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		s.Logger.Info("LoginRequest is request", zap.String("request", request.String()))

		_ = json.NewEncoder(w).Encode(&userpb.LoginResponse{
			AccessToken: token,
			ExpiresIn:   int32(config.TokenExpire.Seconds()),
			UserId:      userID,
		})

	}

}
