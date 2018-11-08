package generator_test

import (
	"io/ioutil"
	"log"
	"os"

	artifacts "github.com/kun-lun/artifacts/pkg/apis"
	dep "github.com/kun-lun/artifacts/pkg/apis/deployments"
	. "github.com/kun-lun/ashandler/generator"
	clogger "github.com/kun-lun/common/logger"
	"github.com/kun-lun/common/storage"
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
	"github.com/spf13/afero"
	yaml "gopkg.in/yaml.v2"
)

var _ = Describe("AsGenerator", func() {

	var (
		generator   ASGenerator
		hostGroups  []dep.HostGroup
		deployments []dep.Deployment
	)

	BeforeEach(func() {
		log.SetFlags(0)
		fs := afero.NewOsFs()
		afs := &afero.Afero{Fs: fs}

		// Configuration
		logger := clogger.NewLogger(os.Stdout, os.Stdin)
		tempDir, err := ioutil.TempDir("", "")
		Expect(err).To(BeNil())
		stateStore := storage.NewStore(tempDir, afs)

		generator = NewASGenerator(stateStore, logger)
		hostGroupName := "fake_host_group"
		hostGroups = []dep.HostGroup{
			dep.HostGroup{
				Name: hostGroupName,
				Hosts: []dep.Host{
					{
						Alias: "FakeAlias",
					},
				},
			},
		}
		deployments = []dep.Deployment{
			{
				HostGroupName: hostGroupName,
				Vars:          yaml.MapSlice{},
				Roles: []artifacts.Role{
					{
						Name: "kunlun.php",
					},
				},
			},
		}
	})

	Describe("Generate", func() {
		Context("Everything OK", func() {
			It("should succeed", func() {
				Expect(generator.Generate(hostGroups, deployments)).To(BeNil())
			})
		})
	})
})
