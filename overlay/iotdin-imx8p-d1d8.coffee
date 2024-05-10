deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

IOTDIN_IMX8P_UNPACK="Please check the readme or the image download modal in balena-cloud for flashing instructions"

postProvisioningInstructions = [
        instructions.BOARD_REPOWER
]
 
module.exports =
        version: 1
        slug: 'iotdin-imx8p-d1d8'
        name: 'Compulab IOTDIN-iMX8P 1G-8G DRAM'
        arch: 'aarch64'
        state: 'released'
 
        stateInstructions:
                postProvisioning: postProvisioningInstructions
 
        instructions: [
                IOTDIN_IMX8P_UNPACK
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'http://docs.balena.io/iotdin-imx8p/nodejs/getting-started/#adding-your-first-device'
                osx: 'http://docs.balena.io/iotdin-imx8p/getting-started/#adding-your-first-device'
                linux: 'http://docs.balena.io/iotdin-imx8p/getting-started/#adding-your-first-device'

        supportsBlink: false

        yocto:
                machine: 'iotdin-imx8p-d1d8'
                image: 'balena-image'
                fstype: 'balenaos-img'
                version: 'yocto-kirkstone'
                deployArtifact: 'balena-image-iotdin-imx8p-d1d8.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
