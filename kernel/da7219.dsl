Scope (\_SB.PCI0.I2C0)
    {
        Device (DLG7)
        {
            Name (_HID, "DLGS7219")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "Dialog Semiconductor DA7219 Audio Codec")  // _DDN: DOS Device Name
            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                I2cSerialBusV2 (0x001A, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                    0x00, ResourceConsumer, , Exclusive,
                    )
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                {
                    0x0000005B,
                }
            })
            Name (_DSD, Package (0x04)  // _DSD: Device-Specific Data
            {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                Package (0x05)
                {
                    
                        Package (0x02)
                    {
                        "clock-output-names", 
                        "mclk"
                    },  
                    Package (0x02)
                    {
                        "wakeup-source", 
                        TRUE
                    },
                    Package (0x02)
                    {
                        "dlg,vdd", 
                        1800
                    }, 
                    Package (0x02)
                    {
                        "dlg,vddio", 
                        1800
                    }, 
                    Package (0x02)
                    {
                        "dlg,vddmic", 
                        3300
                    }, 
                    Package (0x02)
                    {
                        "dlg,micbias-lvl", 
                        0x0A28
                    }, 

                    Package (0x02)
                    {
                        "dlg,mic-amp-in-sel", 
                        "diff"
                    }
                }, 

                ToUUID ("dbb8e3e6-5886-4ba6-8795-1319f52a966b") /* Hierarchical Data Extension */, 
                Package (0x01)
                {
                    Package (0x02)
                    {
                        "da7219_aad", 
                        "DAAD"
                    }
                }
            })
            Name (DAAD, Package (0x02)
            {
                ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301") /* Device Properties for _DSD */, 
                Package (0x0D)
                {
                    Package (0x02)
                    {
                        "dlg,btn-cfg", 
                        0x32
                    }, 

                    Package (0x02)
                    {
                        "dlg,mic-det-thr", 
                        0x01F4
                    }, 

                    Package (0x02)
                    {
                        "dlg,jack-ins-deb", 
                        0x14
                    }, 

                    Package (0x02)
                    {
                        "dlg,jack-det-rate", 
                        "32ms_64ms"
                    }, 

                    Package (0x02)
                    {
                        "dlg,jack-rem-deb", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "dlg,a-d-btn-thr", 
                        0x0A
                    }, 

                    Package (0x02)
                    {
                        "dlg,d-b-btn-thr", 
                        0x16
                    }, 

                    Package (0x02)
                    {
                        "dlg,b-c-btn-thr", 
                        0x21
                    }, 

                    Package (0x02)
                    {
                        "dlg,c-mic-btn-thr", 
                        0x3E
                    }, 

                    Package (0x02)
                    {
                        "dlg,btn-avg", 
                        0x04
                    }, 

                    Package (0x02)
                    {
                        "dlg,adc-1bit-rpt", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "dlg,micbias-pulse-lvl", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "dlg,micbias-pulse-time", 
                        Zero
                    }
                }
            })
        }
    }

