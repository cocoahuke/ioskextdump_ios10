# ioskextdump_ios10

**All function support from iOS 10 to Latest iOS 12 kernelcache**

iOS10 Edition) Dump Kext information from iOS kernel cache. Applicable to the kernel which dump from memory. The disassembly framework used is [Capstone](http://www.capstone-engine.org/)

[![Contact](https://img.shields.io/badge/contact-@cocoahuke-fbb52b.svg?style=flat)](https://twitter.com/cocoahuke) [![build](https://travis-ci.org/cocoahuke/ioskextdump_ios10.svg?branch=master)](https://travis-ci.org/cocoahuke/ioskextdump_ios10) [![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/cocoahuke/ioskextdump_ios10/blob/master/LICENSE) [![paypal](https://img.shields.io/badge/Donate-PayPal-039ce0.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=EQDXSYW8Z23UY)

##### 32bit version of iOS Kernel (iOS8/iOS9):
**32bit(arm):  [ioskextdump_32](https://github.com/cocoahuke/ioskextdump_32)**
##### 64bit version of iOS Kernel (iOS8/iOS9):
**64bit(arm):  [ioskextdump](https://github.com/cocoahuke/ioskextdump)**
##### Dump Kext info For Mac:
**64bit(x86_64):  [mackextdump](https://github.com/cocoahuke/mackextdump)**

This is [ioskextdump](https://github.com/cocoahuke/ioskextdump) that working for iOS10. iOS10's iOS kernel has some changes in the structure, the kext's macho header is saved in `__PRELINK_TEXT`, text segment is in `__PLK_TEXT_EXEC`, data segment is in `__PLK_DATA_CONST`/`__PRELINK_DATA`, and these segments are marked on the macho header of kernelcache.  
In the past iOS9/iOS8 kernelcache, each kext is independent, you can export all the segments into a file, all segments is defined in a continuous memory and defined in the kext 's macho header.  
For iOS10 kext, each type of segment of the kext are placed together in a continuous memory that defined in kernel macho header (name is `__PLK*`), and also the amount of kext has increased significantly (Before was over 900, and now I tested two of the latest iOS10 kernel one is over 1500, the other over 1600)

I added ways to find vtable of kexts class, this become little harder by looking up in manually if in iOS10, and update other functions so that it can work properly in iOS10

Seems all iOS10 kernels could be easy get by use [img4tool](https://github.com/xerub/img4tool), its a good news

Please refer to [ioskextdump](https://github.com/cocoahuke/ioskextdump) for how to use it

___In addition. Looking for iOS/Mac os hacker, i would like to give help or join who want to jailbreak iOS___

##  Example output
```
******** 0:com.apple.iokit.IOUserEthernet *******
(0xfffffff006900930)->OSMetaClass:OSMetaClass call 4 args list
x0:0xfffffff00768ddc8
x1:IOUserEthernetResourceUserClient
x2:0xfffffff0075ecde8
x3:0xf8
vtable start from addr 0xfffffff006f34690
Inheritance relationship: IOUserClient->IOService->IORegistryEntry->OSObject

override: IOUserClient_IOUserClient loc:0xfffffff006f34690 imp:0xfffffff006900088
override: IOUserClient_~IOUserClient loc:0xfffffff006f34698 imp:0xfffffff00690008c
override: IOUserClient_getMetaClass loc:0xfffffff006f346c8 imp:0xfffffff0069000a4
override: IOUserClient_free loc:0xfffffff006f346f8 imp:0xfffffff00690036c
override: IOService_start loc:0xfffffff006f34938 imp:0xfffffff0069003ac
override: IOUserClient_externalMethod loc:0xfffffff006f34bc8 imp:0xfffffff0069004b8
override: IOUserClient_initWithTask loc:0xfffffff006f34be0 imp:0xfffffff00690027c
...

0 func:0xfffffff0069001cc  scalar_i:0x0  struct_i:0xffffffff  scalar_o:0x1  struct_o:0x0
1 func:0xfffffff0069001d4  scalar_i:0x1  struct_i:0x0  scalar_o:0x0  struct_o:0x0
...
```
