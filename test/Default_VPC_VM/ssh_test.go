package Default_VPC_VM_test

import (
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
)


func TestSSH( t *testing.T){
	// Arrange
	sshUserName := "ubuntu"
	options := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: ".",
	})

	// Act
	// Defer the destory of the test that is run
	defer func(){
		_,e := terraform.DestroyE(t,options)
		if e != nil{
			t.Fatalf("failure on destroy : %v",e)
		}
	}()
	// Run the terraform code
	_,e := terraform.InitAndApplyE(t, options)
	if e != nil{
		t.Fatalf("failure on init and apply : %v",e)
	}
	// Get the public key
	public_key := terraform.Output(t,options, "public_key")
	// Get the private key
	private_key := terraform.Output(t,options,"private_key")
	// Get public ip
	pub_ip := terraform.Output(t,options,"external_ip")
	// Key pair
	keys := &ssh.KeyPair{
		PublicKey: public_key,
		PrivateKey: private_key,
	}

	host := ssh.Host{
		Hostname: pub_ip,
		SshUserName: sshUserName,
		SshKeyPair: keys,
	}

	// Act
	err := ssh.CheckSshConnectionWithRetryE(t,host,10,2*time.Second)
	if err != nil{
		t.Fatalf("Unable ssh because %v",err)
	}
}