package token

import (
	"time"

	"github.com/golang-jwt/jwt/v4"
)

// JWTTokenGen generates a JWT token.
type JWTTokenGen struct {
	issuer  string
	nowFunc func() time.Time
	secKey  string
}

// NewJWTTokenGen creates a JWTTokenGen.
func NewJWTTokenGen(issuer, secKey string) *JWTTokenGen {
	return &JWTTokenGen{
		issuer:  issuer,
		nowFunc: time.Now,
		secKey:  secKey,
	}
}

// GenerateToken generates a token.
func (t *JWTTokenGen) GenerateToken(userID string, expire time.Duration) (string, error) {
	tkn := jwt.NewWithClaims(jwt.SigningMethodRS512, jwt.RegisteredClaims{
		Issuer:    t.issuer,
		IssuedAt:  jwt.NewNumericDate(time.Now()),
		ExpiresAt: jwt.NewNumericDate(time.Now().Add(expire)),
		Subject:   userID,
	})

	return tkn.SignedString([]byte(t.secKey))
}
