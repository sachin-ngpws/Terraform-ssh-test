package certs_test

import (
	"crypto/rsa"
	"crypto/x509"
	"encoding/pem"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestCert(t *testing.T){
	// Arrange
	size := 2048
	options := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: ".",
		Vars: map[string]interface{}{
			"RSA_bit_size": size,
		},
	})
	// Act
	// Defer the destory of the test that is run
	defer terraform.Destroy(t,options)
	// Run the terraform code
	terraform.InitAndApply(t, options)
	// Get the public key
	output := terraform.Output(t,options, "public_key")
	// Decode the key
	pem, _ := pem.Decode([]byte(output)) 
	// Extract certs
	public, err := x509.ParsePKIXPublicKey(pem.Bytes)
	// Type cast the cert
	key, ok := public.(*rsa.PublicKey)
	// Assert
	assert.NotEmpty(t,pem.Bytes,"Unable to decode the key")
	assert.Empty(t,err,"Unable to parse the key bytes")
	assert.True(t,ok,"Unable to type cast to rsa Public key")
	assert.Equalf(t,size,key.N.BitLen(),"The expected value is %d, but got %d",size,key.Size())

}

func TestCertFail(t *testing.T){
	// Arrange
	size := 1024
	options := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: ".",
		Vars: map[string]interface{}{
			"RSA_bit_size": size,
		},
	})
	// Act
	// Defer the destory of the test that is run
	defer func(){
		_,e := terraform.DestroyE(t,options)
		assert.NotEmpty(t,e,"Should have thrown an error at destroy as well")
	}()
	// Run the terraform code
	_,e := terraform.InitAndApplyE(t, options)
	
	assert.NotEmpty(t,e,"Should have thrown an error")
}